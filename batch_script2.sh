#!/bin/bash

python -u main.py --target_model llama3-8b-iq4nl --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_74_iq4nl_ko_present.txt
sleep 5
python -u main.py --target_model llama3-8b-iq4nl --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_75_iq4nl_ko_future.txt