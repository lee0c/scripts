#!/bin/bash

for file in .bashrc .bash_aliases .zshrc .gitconfig .vimrc
do
	cp $HOME/scripts/terminal/configs/$file $HOME
done

rm -rf $HOME/.oh-my-zsh/custom
cp -r $HOME/scripts/terminal/configs/oh-my-zsh/custom $HOME/.oh-my-zsh

cp $HOME/scripts/terminal/configs/winterm.json /c/Users/le*/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/profiles.json
