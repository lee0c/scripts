#!/bin/bash

for file in .bashrc .bash_aliases .zshrc .gitconfig .vimrc
do
    if [[ -f $HOME/$file ]]
    then cp $HOME/$file $HOME/scripts/terminal/configs
    fi
done

cp -r $HOME/.oh-my-zsh/custom $HOME/scripts/terminal/configs/oh-my-zsh

cp /c/Users/lecattar/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json $HOME/scripts/terminal/configs/winterm.json
