#!/bin/bash
{ 
python main.py --target_model llama3-8b-f16 --prompt_language en --n_requests 5 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
} | tee -a output_all_logs4.txt