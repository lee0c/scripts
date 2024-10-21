# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
ZSH_CUSTOM=$HOME/scripts/setup/configs/oh-my-zsh/custom/themes

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( git )

source $ZSH/oh-my-zsh.sh

# User configuration

# set browser vars
export DISPLAY=:0
export BROWSER=/c/Program\ Files\ \(x86\)/Microsoft/Edge\ Dev/Application/msedge.exe

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

# command aliases
alias gtree="git log --graph --oneline --all"
alias code="code ."
alias k="kubectl"
alias kdump="kubectl get all --all-namespaces"
alias tf="terraform"
alias sscat="cat $HOME/.ssh/id_rsa.pub"
alias fixtime="sudo ntpdate time.windows.com"

# when sourced, clear term & reset prompt newline
clear
export PROMPT_NEWLINE=""
$HOME/scripts/terminal/flag-motd.sh

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
. "/home/lecattar/.deno/env"
