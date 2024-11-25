#!/bin/bash

# 모든 명령어의 출력을 화면과 파일에 동시에 출력
python -u main.py --target_model llama3-8b-iq1m --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_01_iq1m_en_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq1m --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_02_iq1m_en_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq1m --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_03_iq1m_en_future.txt
sleep 5

python -u main.py --target_model llama3-8b-iq1m --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_04_iq1m_ko_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq1m --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_05_iq1m_ko_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq1m --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_06_iq1m_ko_future.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xs --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_07_iq2xs_en_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xs --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_08_iq2xs_en_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xs --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_09_iq2xs_en_future.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xs --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_10_iq2xs_ko_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xs --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_11_iq2xs_ko_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xs --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_12_iq2xs_ko_future.txt
sleep 5