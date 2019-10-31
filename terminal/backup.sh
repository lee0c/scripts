#!/bin/bash

if [[ -f $HOME/.bashrc ]]; then cp $HOME/.bashrc $HOME/scripts/terminal/configs; fi
if [[ -f $HOME/.bash_aliases ]]; then cp $HOME/.bash_aliases $HOME/scripts/terminal/configs; fi
if [[ -f $HOME/.zshrc ]]; then cp $HOME/.zshrc $HOME/scripts/terminal/configs; fi

cp -r $HOME/.oh-my-zsh/custom $HOME/scripts/terminal/configs/oh-my-zsh

cp /c/Users/lecattar/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json $HOME/scripts/terminal/configs/winterm.json
