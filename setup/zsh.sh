#!/usr/bin/env bash

# Install zsh
sudo apt update
sudo apt install -y zsh

echo "zsh version: $(zsh --version)"

chsh -s $(which zsh)

# https://ohmyz.sh/#install
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
