#!/bin/bash

# 모든 명령어의 출력을 화면과 파일에 동시에 출력
python -u main.py --target_model llama3-8b-iq4nl --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_70_iq4nl_en_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq4nl --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_71_iq4nl_en_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq4nl --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_72_iq4nl_en_future.txt
sleep 5

python -u main.py --target_model llama3-8b-iq4nl --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_73_iq4nl_ko_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq4nl --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_74_iq4nl_ko_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq4nl --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_75_iq4nl_ko_future.txt