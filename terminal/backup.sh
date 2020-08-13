#!/bin/bash

for file in .bashrc .bash_aliases .zshrc .gitconfig .vimrc
do
    if [[ -f $HOME/$file ]]
    then cp $HOME/$file $HOME/scripts/terminal/configs
    fi
done

cp -r $HOME/.oh-my-zsh/custom $HOME/scripts/terminal/configs/oh-my-zsh

cp /c/Users/lecattar*/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json $HOME/scripts/terminal/configs/winterm.json
cp /c/Users/lecattar*/AppData/Roaming/Code/User/settings.json $HOME/scripts/terminal/configs/vscode_user.json

cp /etc/wsl.conf $HOME/scripts/terminal/configs
