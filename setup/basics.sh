if [[ ! -f /etc/wsl.conf ]]; then
        echo "Using wsl.conf to set mount point for c drive. Restart the terminal before running any scripts dependent on Windows file system."
        cp $HOME/scripts/terminal/configs/wsl.conf /etc/wsl.conf
        exit
fi

for file in .gitconfig .vimrc
do
	cp $HOME/scripts/terminal/configs/$file $HOME
done
