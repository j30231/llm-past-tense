from openai import OpenAI


client  = OpenAI(
    base_url="http://localhost:1234/v1",    # LM Studio의 기본 URL
    api_key="not-needed"                    # LM Studio는 API 키가 필요없음
)

def chat_with_model(prompt: str) -> str:
    """LM Studio API를 사용하여 대화하는 함수"""
    try:
        response = client.chat.completions.create(
            model="lmstudio-community/meta-llama-3.1-8b-instruct",            # 실제 모델명은 LM Studio에서 로드한 모델에 따라 다름
            messages=[
                {"role": "user", "content": prompt}
            ],
            temperature=0.7
        )
        return response.choices[0].message.content
    except Exception as e:
        return f"오류 발생: {str(e)}"

# 사용 예시
if __name__ == "__main__":
    prompt = "안녕하세요! 오늘 날씨가 어떤가요?"
    response = chat_with_model(prompt)
    print("사용자:", prompt)
    print("AI:", response)

