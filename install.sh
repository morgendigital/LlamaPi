#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Update and install required packages
echo "Updating and installing necessary packages..."
sudo apt update
if [ $? -ne 0 ]; then
    echo "Failed to update package list. Exiting..."
    exit 1
fi

sudo apt install -y git g++ build-essential python3-pip
if [ $? -ne 0 ]; then
    echo "Failed to install required packages. Exiting..."
    exit 1
fi

# Install Python packages
echo "Installing Python packages..."
python3 -m pip install torch numpy sentencepiece
if [ $? -ne 0 ]; then
    echo "Failed to install Python packages. Exiting..."
    exit 1
fi

# Clone and make llama.cpp
echo "Cloning and compiling llama.cpp..."
git clone https://github.com/ggerganov/llama.cpp
if [ $? -ne 0 ]; then
    echo "Failed to clone llama.cpp repository. Exiting..."
    exit 1
fi

cd llama.cpp
make
if [ $? -ne 0 ]; then
    echo "Failed to compile llama.cpp. Exiting..."
    exit 1
fi

echo "Installation complete!"

