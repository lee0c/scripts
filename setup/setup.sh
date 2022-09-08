#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y

# Microsoft signing key
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux
curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

# Kubernetes signing key
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# HashiCorp signing key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

## Sources

RELEASE=$(lsb_release -cs)

# Azure CLI
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $RELEASE main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Kubectl
echo "deb https://apt.kubernetes.io/ kubernetes-$RELEASE main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

# Git
sudo add-apt-repository ppa:git-core/ppa

# HashiCorp
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $RELEASE main"

# Update and install, then upgrade
sudo apt update

sudo apt install -y \
    git \
    kubectl \
    azure-cli \
    terraform
    
# Binaries
curl -sL https://run.linkerd.io/install | sh
