#!/bin/bash

mkdir $HOME/tooling
cd $HOME/tooling

git clone git@github.com:ahmetb/kubectx.git
git clone git@github.com:lee0c/kubectl-watch.git
git clone git@github.com:lee0c/rg-cli.git

chmod +x kubectx/kubectx kubectx/kubens kubectl-watch/kubectl-watch rg-cli/rg

sudo ln -s $HOME/tooling/kubectx/kubectx /usr/local/bin/kubectl-ctx
sudo ln -s $HOME/tooling/kubectx/kubens /usr/local/bin/kubectl-ns
sudo ln -s $HOME/tooling/kubectl-watch/kubectl-watch /usr/local/bin/kubectl-watch
sudo ln -s $HOME/tooling/rg-cli/rg /usr/local/bin/rg
