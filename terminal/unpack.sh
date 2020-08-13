#!/usr/bin/env bash

if [[ ! -f /etc/wsl.conf ]]; then
	echo "Using wsl.conf to set mount point for c drive. Restart the terminal before attempting to rerun this script."
	cp $HOME/scripts/terminal/configs/wsl.conf /etc/wsl.conf
	exit
fi

for file in .bashrc .bash_aliases .zshrc .gitconfig .vimrc
do
	cp $HOME/scripts/terminal/configs/$file $HOME
done

rm -rf $HOME/.oh-my-zsh/custom
cp -r $HOME/scripts/terminal/configs/oh-my-zsh/custom $HOME/.oh-my-zsh/custom

cp $HOME/scripts/terminal/configs/winterm.json /c/Users/lecattar*/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json
cp $HOME/scripts/terminal/configs/vscode_user.json /c/Users/lecattar*/AppData/Roaming/Code/User/settings.json
