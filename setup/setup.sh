#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
    ca-certificates \
    curl \
    apt-transport-https \
    lsb-release \
    gnupg1

# Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

# Kubernetes signing key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

## Sources

RELEASE=$(lsb_release -cs)

# Azure CLI
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $RELEASE main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Functions Core Tools
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $RELEASE main" > /etc/apt/sources.list.d/dotnetdev.list'

# Kubectl
echo "deb https://apt.kubernetes.io/ kubernetes-$RELEASE main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

# Git
sudo add-apt-repository ppa:git-core/ppa

# Update and install, then upgrade
sudo apt update

sudo apt install -y \
    git \
    kubectl \
    azure-cli \
    azure-functions-core-tools

# Binaries
curl -sL https://run.linkerd.io/install | sh
