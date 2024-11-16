#!/bin/bash
{ 
python main.py --target_model llama3-8b-q2 --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q2 --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q2 --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q2 --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q2 --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q2 --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q4 --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q4 --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q4 --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q4 --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q4 --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q4 --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q8 --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q8 --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q8 --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q8 --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q8 --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q8 --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q16 --prompt_language en --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q16 --prompt_language en --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q16 --prompt_language en --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q16 --prompt_language ko --n_requests 100 --n_restarts 20 --attack past --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q16 --prompt_language ko --n_requests 100 --n_restarts 20 --attack present --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
python main.py --target_model llama3-8b-q16 --prompt_language ko --n_requests 100 --n_restarts 20 --attack future --prompt_gen_model gpt-4o-mini --prompt_judge_model gpt-4o-mini
} | tee -a output_all_logs.txt