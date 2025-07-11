# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/austinkarren/.zsh/completions:"* ]]; then export FPATH="/Users/austinkarren/.zsh/completions:$FPATH"; fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# I prefer the default oh-my-zsh theme robbyrussell
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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

# JS ecosystem stuff, also assuming that you are using MacOS and that your user is austinkarren. Feel free to comment or change the following lines if you don't use them. I might make a branch for other operating systems in the future.

# bun completions
[ -s "/Users/austinkarren/.bun/_bun" ] && source "/Users/austinkarren/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

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
