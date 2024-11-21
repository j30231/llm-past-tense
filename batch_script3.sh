#!/bin/bash
{ 
python -u main.py --target_model llama3-8b-q4km --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini --resume --resume_file "jailbreak_artifacts/(67)_2024-11-20 01:59:24.019519-model=llama3-8b-q4km-attack=present-n_requests=100-n_restarts=20-lang=en.json"
} | tee -a output_all_logs_q4km.txt