#!/usr/bin/env bash

for file in .bashrc .bash_aliases .zshrc .gitconfig .vimrc
do
    if [[ -f $HOME/$file ]]; then 
		echo "Comparing $file..."
		diff $HOME/$file $HOME/scripts/terminal/configs
		echo
    fi
done

echo "Comparing oh-my-zsh custom folder..."
diff -r $HOME/.oh-my-zsh/custom $HOME/scripts/terminal/configs/oh-my-zsh/custom
echo

echo "Comparing Windows Terminal settings..."
diff /c/Users/lecattar*/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json $HOME/scripts/terminal/configs/winterm.json
echo

echo "Comparing VSCode settings..."
diff /c/Users/lecattar*/AppData/Roaming/Code/User/settings.json $HOME/scripts/terminal/configs/vscode_user.json
echo
