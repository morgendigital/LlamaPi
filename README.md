# LlamaPi
Note: This repo is still under construction, however you can use the installation steps already if you want to play arround with Llama/Llama2 on a Raspberry Pi.

# Recommendations
- Raspberry Pi 4 with 8GB RAM (slower is possible, but only the 8GB RAM model can run quantized 7B models).
- Ubuntu 22.04+ 64 Bit (can be installed with Raspberry Pi Imager)

# Install
```
sudo apt update && sudo apt install -y git g++ build-essential python3-pip
python3 -m pip install torch numpy sentencepiece
git clone https://github.com/ggerganov/llama.cpp && cd llama.cpp && make
```
