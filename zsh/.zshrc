# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
zsh-autosuggestions
zsh-syntax-highlighting
web-search
copybuffer
dirhistory
sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Python alias
alias python=python3

# Set up Android SDK path for flexibility
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"

# Android Emulator Aliases
alias emulator="$ANDROID_HOME/emulator/emulator"
alias android='nohup $ANDROID_HOME/emulator/emulator -avd Pixel_6_Pro_API_26 > /dev/null 2>&1 & disown'

# Ensure Docker is running before launching
alias dockerrun="pgrep Docker || open -a Docker"

# Function to start MobSF with Docker check
function mobsf() {
    pgrep Docker || open -a Docker  # Start Docker if not running
    sleep 5  # Allow time for Docker to start
    docker run -it --rm -p 8000:8000 -v $(pwd)/mobsf_data:/root/.MobSF opensecurity/mobile-security-framework-mobsf:latest
}

# TheFuck alias (corrects previous command errors)
eval $(thefuck --alias)
# Alternative alias for TheFuck
eval $(thefuck --alias FUCK)

# Directory navigation improvements
alias cd="z"
eval "$(zoxide init zsh)"

# Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Ruby path export
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# System & Performance
alias dfh="df -h | sort -hr -k 2 | head -10"  # Show top 10 disk space usage
alias topcpu="ps -A -o %cpu,pid,command | sort -nr | head -10"  # Show top 10 processes by CPU usage
alias topmem="ps -A -o %mem,pid,command | sort -nr | head -10"  # Show top 10 processes by memory usage
alias uptime="uptime"  # Show system uptime and load average

# Networking
alias pubip="curl ifconfig.me"  # Show public IP
alias localip="ipconfig getifaddr en0"  # Show local IP address (Wi-Fi)
alias ports="sudo lsof -i -P -n | grep LISTEN"  # Show open network ports

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2024-07-20 11:41:51
export PATH="$PATH:/Users/parv/.local/bin"

alias ciphey="docker run -it --rm remnux/ciphey"
alias dockersteg='docker run -it --rm -v /Users/parv/data:/data dominicbreuker/stego-toolkit /bin/bash'
alias pip="$HOME/my-venv/bin/pip"
alias python="$HOME/my-venv/bin/python"
alias speed=networkQuality
function y() { local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd; yazi "$@" --cwd-file="$tmp"; IFS= read -r -d "" cwd < "$tmp"; [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"; rm -f -- "$tmp"; }
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias tree="eza --tree"
alias cat="bat"
