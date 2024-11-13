from models import ModelHuggingFace

if __name__ == "__main__":
    model = ModelHuggingFace("llama3-8b")
    response = model.get_response("안녕하세요! 오늘 날씨가 어떤가요?", max_n_tokens=50, temperature=0.7)
    print(f"응답: {response}")