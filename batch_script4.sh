#!/bin/bash

# 모든 명령어의 출력을 화면과 파일에 동시에 출력
{
    python -u main.py --target_model llama3-8b-iq2 --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
    sleep 5

    python -u main.py --target_model llama3-8b-iq2 --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
    sleep 5

    python -u main.py --target_model llama3-8b-iq2 --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
    sleep 5

    python -u main.py --target_model llama3-8b-iq2 --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
    sleep 5

    python -u main.py --target_model llama3-8b-iq2 --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
    sleep 5

    python -u main.py --target_model llama3-8b-iq2 --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
} | tee output_all_logs_iq2.txt