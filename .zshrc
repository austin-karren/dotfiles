# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# I prefer the default oh-my-zsh theme robbyrussell
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Terminal personalization - startup animation
echo "austink.dev" | figlet  -f "Slant" | lolcat
echo "keybindings:" | lolcat
echo "cmd+shift+space = toggle_quick_terminal" | lolcat
echo " "

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Brew path
export BREW_HOME="/opt/homebrew" # Homebrew path on Apple Silicon Macs
export PATH="/opt/homebrew/Cellar/sqlite/3.46.0/bin/sqlite3:$PATH"

# aliases and functions
# For a full list of active aliases, run `alias`.

alias git-prune-dead='git fetch -p && git branch -vv | grep ": gone]" | awk "{print \$1}" | xargs git branch -D'

alias ls="ls -a --color=always"
alias lsa="ls -a --color=always"
alias reloadrc="source ~/.zshrc"
alias secret="openssl rand -base64 32"

# JS ecosystem stuff, also assuming that you are using MacOS and that your user is austinkarren. Feel free to comment or change the following lines if you don't use them. I might make a branch for other operating systems in the future.

# bun completions
[ -s "/Users/austinkarren/.bun/_bun" ] && source "/Users/austinkarren/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno comletions
if [[ ":$FPATH:" != *":/Users/austinkarren/.zsh/completions:"* ]]; then export FPATH="/Users/austinkarren/.zsh/completions:$FPATH"; fi

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# zoxide
eval "$(zoxide init --cmd cd zsh)"
. "/Users/austinkarren/.deno/env"

# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Android Emulator
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Docker CLI completions.
fpath=(/Users/austinkarren/.docker/completions $fpath)
autoload -Uz compinit
compinit
