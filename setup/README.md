# Setup

## New machine

1. Windows settings
	1. dark mode
	1. wallpaper
	1. remove desktop shortcuts
	1. invisible desktop items
	1. uninstall bloatware
	1. sound profile to "none"
1. WSL
1. [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
1. [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n0dx20hk701)
1. [VSCode](https://code.visualstudio.com/Download)
	1. Horizon Theme
1. [Teams](https://teams.microsoft.com/downloads)
1. [Powerline fonts](https://github.com/powerline/fonts)
1. [Office](portal.office.com)

## Within the terminal 

1. Set up a private key
1. [`zsh.sh`](./zsh.sh) to switch to zsh and oh-my-zsh
1. [`setup.sh`](./setup.sh) for major installations
1. [`tooling.sh`](./tooling.sh) for tools in GH repositories
1. [`unpack.sh`](../terminal/unpack.sh) to load in all backed-up terminal/etc config files
1. Don't forget to set up desktop shortcut for terminal (`Win+R` and `shell:AppsFolder` to get to app)

### User profile management

If the user profile is not `lecattar`: in administrator cmd prompt

```cmd
CD C:\Users\
MKLINK /J lecattar $actualProfile
```
