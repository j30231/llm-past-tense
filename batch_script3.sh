#!/bin/bash

python -u main.py --target_model llama3-8b-iq2xss --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_107_iq2xss_en_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xss --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_108_iq2xss_en_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xss --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_109_iq2xss_en_future.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xss --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_110_iq2xss_ko_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xss --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_111_iq2xss_ko_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2xss --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_112_iq2xss_ko_future.txt
sleep 5


# resume-file 을 할때는 85번이면 batch_index.txt 에서 86번으로 바꿔야 함.