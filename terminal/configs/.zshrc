# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lecattar/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	kubectl
	kube-ps1
	)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:/usr/local/go/bin:$HOME/.linkerd2/bin

# User configuration

# kube ps1 mods
export KUBE_PS1_ENABLED="false"
export KUBE_PS1_COLOR_SYMBOL="%{\e[38;5;27m%}"
export KUBE_PS1_COLOR_CONTEXT="%{$fg[black]%}"
export KUBE_PS1_COLOR_NS="%{$fg[black]%}"

# Newline after command
precmd() { 
    if [[ -z "$PROMPT_NEWLINE" ]];
    then
        export PROMPT_NEWLINE=1
        return
    fi    
    print "" 
}

# Agnoster prompr default user
export DEFAULT_USER="lecattar"

# Do not signify EOL with %
export PROMPT_EOL_MARK=''

# Change the highlighting for certain directory types
export LS_COLORS="${LS_COLORS}ow=01;34:"

# SSH agent
ssa() {
	ssa_pid=$(pgrep ssh-agent)
	if [[ $ssa_pid ]]; then kill $ssa_pid; fi
    
    echo -n "$fg[green]"
	eval $(ssh-agent -s)
	ssh-add ~/.ssh/id_rsa
}

# color scripts for editing use
alias showcolors="$HOME/scripts/terminal/testcolor.sh; $HOME/scripts/terminal/256-colors.sh"

# "reload"
reload() {
    source $HOME/.zshrc
}

# set browser vars
export DISPLAY=:0
export BROWSER=/c/Program\ Files\ \(x86\)/Microsoft/Edge\ Dev/Application/msedge.exe

# ssh aliases

# command aliases
alias gtree="git log --graph --oneline --all"
alias code="code ."
alias kdump="kubectl get all --all-namespaces"
alias sscat="cat $HOME/.ssh/id_rsa.pub"

# directory aliases

# when sourced, clear term & reset prompt newline
clear
export PROMPT_NEWLINE=""
$HOME/scripts/terminal/flag-motd.sh
