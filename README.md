Usage:

```
./llama-completion -m /data/data/com.termux/files/home/storage/downloads/Qwen_Qwen3-4B-Instruct-2507-Q4_K_M.gguf -c 768 --flash-attn on -ngl 0 -t 6 -b 512 --no-mmap --cache-type-k q8_0 --cache-type-v q8_0 --temp 0.40 --top-k 20 --top-p 0.85 --min-p 0.08 --repeat-penalty 1.12 --prompt "You are an expert engineering assistant. Use only exact standard physical constants and formulas (e.g. g = 9.80665 m/s², c = 299792458 m/s, Stefan-Boltzmann = 5.670374419e-8). Never approximate unless the user explicitly allows it. Always show rigorous step-by-step calculations and double-check numbers before final answer. Respond only in clear professional English."
```
