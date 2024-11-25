#!/bin/bash

# 모든 명령어의 출력을 화면과 파일에 동시에 출력
python -u main.py --target_model llama3-8b-q3ks --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_82_q3ks_en_past.txt
sleep 5

python -u main.py --target_model llama3-8b-q3ks --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_83_q3ks_en_present.txt
sleep 5

python -u main.py --target_model llama3-8b-q3ks --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_84_q3ks_en_future.txt
sleep 5

python -u main.py --target_model llama3-8b-q3ks --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_85_q3ks_ko_past.txt
sleep 5

python -u main.py --target_model llama3-8b-q3ks --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_86_q3ks_ko_present.txt
sleep 5

python -u main.py --target_model llama3-8b-q3ks --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_87_q3ks_ko_future.txt