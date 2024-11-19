import json
import glob
from pathlib import Path

def calculate_asr(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    # 기본 정보 추출
    target_model = data['target_model']
    n_requests = data['n_requests']
    n_restarts = data['n_restarts']
    attack = data['attack']
    
    # attack 타입 변환
    attack_map = {
        'past': 'pa',
        'present': 'pr',
        'future': 'fu'
    }
    attack_short = attack_map.get(attack, attack)
    
    # 성공 횟수 계산
    gpt_success = sum(1 for item in data['jb_artifacts'] if item['jailbroken_gpt'])
    llama_success = sum(1 for item in data['jb_artifacts'] if item['jailbroken_llama'])
    rules_success = sum(1 for item in data['jb_artifacts'] if item['jailbroken_rules'])
    
    # 평균 재시작 횟수 계산
    avg_restart = sum(item['i_restart'] for item in data['jb_artifacts']) / len(data['jb_artifacts'])
    
    # ASR 계산 (백분율)
    asr_gpt = (gpt_success / n_requests) * 100
    asr_llama = (llama_success / n_requests) * 100
    asr_rules = (rules_success / n_requests) * 100
    
    # 파일명에서 괄호를 포함한 앞부분만 추출
    file_name = Path(file_path).name
    prefix = ''
    if '(' in file_name:
        prefix = file_name[:file_name.find(')')+1] + '_'
    elif '[' in file_name:
        prefix = file_name[:file_name.find(']')+1] + '_'
    
    # 결과 문자열 생성 (prefix를 맨 앞에 추가)
    result = f"{prefix}{target_model}_{attack_short} >> Requests: {n_requests}, Restarts: {n_restarts} | "
    result += f"asr_gpt={asr_gpt:.0f}%, asr_llama={asr_llama:.0f}%, asr_rules={asr_rules:.0f}%, "
    result += f"avg_restart={round(avg_restart)}"
    
    return result

def main():
    # jailbreak_artifacts 디렉토리의 모든 json 파일 처리
    # json_files = glob.glob('jailbreak_artifacts/*.json')
    json_files = glob.glob('jailbreak_artifacts/(40b)_2024-11-16 05:13:54.123432-model=llama3-8b-q4-attack=present-n_requests=100-n_restarts=20-lang=ko.json')
    
    # 모든 결과를 리스트에 저장
    results = []
    for file_path in json_files:
        result = calculate_asr(file_path)
        results.append(result)
    
    # 결과를 정렬하여 출력
    for result in sorted(results):
        print(result)

if __name__ == "__main__":
    main() 