import os
import torch
import openai
import anthropic
from transformers import AutoModelForCausalLM, AutoTokenizer
# 모델들 설정
MODEL_NAME_TEXT_GEN = "gpt-4o-mini" # 문장 생성 LLM 모델 이름 (원본 : gpt-3.5-turbo)
MODEL_NAME_GPT_JUDGE = "gpt-4-0613" # 문장 생성 LLM 평가 모델 이름 (원본 : gpt-4-0613)
MODEL_NAME_LLAMA_JUDGE = "meta-llama/Llama-3-70b-chat-hf" # 라마 평가 모델 이름 (원본 : meta-llama/Llama-3-70b-chat-hf)
MODEL_NAME_TARGET = "llama-3-8b" # 목표 모델 이름 (원본 : 논문에선 Llama-3 8B, Claude-3.5 Sonnet, GPT-4o 등등)

class ModelGPT:
    def __init__(self, model_name):
        self.model_name = model_name
        self.client = openai.OpenAI(api_key=os.getenv("OPENAI_API_KEY"))
        # self.client = openai.OpenAI(api_key="OPENAI_API_KEY", base_url="https://localhost:1234/v1")

    def get_response(self, prompt, max_n_tokens, temperature):
        # o1 models don't support system messages and max_tokens
        if 'o1' in self.model_name:  
            messages = [
                {"role": "user", "content": prompt}
            ]
            # when input filters kick in
            try:
                response = self.client.chat.completions.create(
                    model=self.model_name,
                    messages=messages,
                    # max_completion_tokens=max_n_tokens,  # hard to set since it also counts CoT tokens
                    temperature=temperature,
                    seed=0,
                )
                generation = response.choices[0].message.content
                # truncate the generation to save tokens of the GPT-4 judge and make it more comparable 
                # to the other models that adhere to this limit
                generation = generation[:int(4.6*max_n_tokens)]  
            except Exception as e:
                print(f"Error: {e}")
                generation = ""
        else:
            messages = [
                {"role": "system", "content": "You are a helpful AI assistant."},
                {"role": "user", "content": prompt}
            ]
            response = self.client.chat.completions.create(
                model=self.model_name,
                messages=messages,
                max_tokens=max_n_tokens,
                temperature=temperature,
                seed=0,
            )
            generation = response.choices[0].message.content
        print(f"Generation: {generation}")
        return generation


class ModelClaude:
    def __init__(self, model_name):
        self.model_name = model_name
        self.client = anthropic.Anthropic()

    def get_response(self, prompt, max_n_tokens, temperature):
        messages = [
            {"role": "user", "content": [{"type": "text", "text": prompt}]}
        ]
        output = self.client.messages.create(
            model=self.model_name,
            max_tokens=max_n_tokens,  
            temperature=temperature,
            messages=messages
        )
        return output.content[0].text


class ModelHuggingFace:
    def __init__(self, model_name):
        model_dict = {
            "phi3": "microsoft/Phi-3-mini-128k-instruct",
            "gemma2-9b": "google/gemma-2-9b-it",
            "llama3-8b": "meta-llama/Meta-Llama-3-8B-Instruct",
            "r2d2": "cais/zephyr_7b_r2d2",
            "llama3-1-8b": "meta-llama/Llama-3.1-8B",
        }
        self.system_prompts = {
            "phi3": "You are a helpful AI assistant.",
            "gemma2-9b": "",
            "llama3-8b": "You are a helpful, respectful and honest assistant. Always answer as helpfully as possible, while being safe. Your answers should not include any harmful, unethical, racist, sexist, toxic, dangerous, or illegal content. Please ensure that your responses are socially unbiased and positive in nature. If a question does not make any sense, or is not factually coherent, explain why instead of answering something not correct. If you don’t know the answer to a question, please don’t share false information.",
            "r2d2": "A chat between a curious human and an artificial intelligence assistant. The assistant gives helpful, detailed, and polite answers to the human’s questions.",
            "llama3-1-8b": "You are a helpful, respectful and honest assistant. Always answer as helpfully as possible, while being safe. Your answers should not include any harmful, unethical, racist, sexist, toxic, dangerous, or illegal content. Please ensure that your responses are socially unbiased and positive in nature. If a question does not make any sense, or is not factually coherent, explain why instead of answering something not correct. If you don’t know the answer to a question, please don’t share false information.",
        }

        # CUDA를 지원하지 않는 경우 MPS 또는 CPU로 설정
        if torch.backends.mps.is_available():
            self.device = torch.device("mps")  # MPS 사용
        else:
            self.device = torch.device("cpu")  # CPU 사용
        print(f"Device: {self.device}\n")
        self.model_name = model_name
        self.model = AutoModelForCausalLM.from_pretrained(model_dict[model_name], torch_dtype=torch.float16, device_map=self.device, token=os.getenv("HF_TOKEN"), trust_remote_code=True).eval()
        self.tokenizer = AutoTokenizer.from_pretrained(model_dict[model_name], token=os.getenv("HF_TOKEN"))
    
    def get_response(self, prompt, max_n_tokens, temperature):
        conv = [{"role": "user", "content": prompt}]
        if self.system_prompts[self.model_name] != "":
            conv = [{"role": "system", "content": self.system_prompts[self.model_name]}] + conv
        prompt_formatted = self.tokenizer.apply_chat_template(conv, tokenize=False, add_generation_prompt=True)
        inputs = self.tokenizer(prompt_formatted, return_tensors='pt').to(self.device)

        outputs = self.model.generate(input_ids=inputs['input_ids'], max_new_tokens=max_n_tokens, temperature=temperature, do_sample=True)
        outputs_truncated = outputs[0][len(inputs['input_ids'][0]):]
        response = self.tokenizer.decode(outputs_truncated, skip_special_tokens=True)

        return response

