#!/bin/bash
python -u main.py --target_model llama3-8b-q3ks --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini --resume --resume_file "./jailbreak_artifacts/(85)_2024-11-21 20:42:59.312240-model=llama3-8b-q3ks-attack=past-n_requests=100-n_restarts=20-lang=ko.json" | tee -a output_all_logs_85_q3ks_ko_past.txt
sleep 5

python -u main.py --target_model llama3-8b-q3ks --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee -a output_all_logs_86_q3ks_ko_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2m --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_88_iq2m_en_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2m --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_89_iq2m_en_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2m --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_90_iq2m_en_future.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2m --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_91_iq2m_ko_past.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2m --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_92_iq2m_ko_present.txt
sleep 5

python -u main.py --target_model llama3-8b-iq2m --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini | tee output_all_logs_93_iq2m_ko_future.txt