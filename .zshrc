# ---------------------------------------------------------
# 🛠️  Pre-Initialization (Paths & Variables)
# ---------------------------------------------------------

#:: zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# :: powerlevel10k
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# :: brew
export BREW_HOME="/opt/homebrew"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# :: volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# :: bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ---------------------------------------------------------
# ⚙️  Shell utilities and plugin manager
# ---------------------------------------------------------

# :: zinit (plugin manager)
source "${ZINIT_HOME}/zinit.zsh"

# :: zoxide (better completion command)
eval "$(zoxide init --cmd cd zsh)"

# :: powerlevel10k (https://github.com/romkatv/powerlevel10k)
zinit ice depth=1
zinit light romkatv/powerlevel10k

# :: zinit annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ---------------------------------------------------------
# 💡  Completions and fpaths
# ---------------------------------------------------------

# :: docker fpath
fpath=($HOME/.docker/completions $fpath)

# :: deno fpath
fpath=($HOME/.zsh/completions $fpath)

# :: initialize completion system
autoload -Uz compinit

# :: helper to check if cache is fresh (less than 24h old)
_is_cache_fresh() {
  local check="${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1)"
  [[ -n ${~check} ]]
}

if _is_cache_fresh; then
  compinit -C
else
  compinit
fi

# :: bun completion script
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# :: zinit completion
autoload -Uz _zinit
[[ -v _comps ]] && _comps[zinit]=_zinit

# :: bash completions bridge (Terraform, etc)
autoload -Uz bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# ---------------------------------------------------------
# 📱  Mobile Development (Android)
# ---------------------------------------------------------

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ---------------------------------------------------------
# 📊  LM Studio
# ---------------------------------------------------------

export PATH="$PATH:/Users/austinkarren/.lmstudio/bin"
alias lms-load-qwen-vision="lms load --identifier qwen-portal/vision-model"

lms-status() {
  echo "\e[38;5;99m\uf05a\e[0m Checking LM Studio status"
  lms status
}

lms-models() {
  echo "\e[38;5;99m\ue24b\e[0m Checking LM Studio models"
  curl http://192.168.69.127:1234/v1/models
}

# ---------------------------------------------------------
# 💻  Aliases and functions
# ---------------------------------------------------------

git-unload() {
  echo "\e[33m\uf440\e[0m Unloading dead branches..."
  git fetch -p && git branch -vv | grep ": gone]" | awk '{print $1}' | xargs -r git branch -D
}

# Refresh git index to respect .gitignore updates
git-reindex() {
  git rm -r --cached . > /dev/null 2>&1
  git add -A
  git status --short
  echo "📋 Manifest updated. Ignored files have been offloaded!"
}

reload-shell() {
  echo "\e[36m\uf01e\e[0m Reloading shell..."
  exec zsh
}

secret() {
  echo "\e[33m\uf084\e[0m Generating secret..."
  openssl rand -base64 32
}

alias ls="ls --color=always"
alias lsa="ls -a --color=always"

my-ghostty() {
  echo "ghostty keybindings:"
  echo ""
  printf "  %-16s %s\n" "cmd+d" "=  new_split:auto"
  printf "  %-16s %s\n" "cmd+opt+arrow" "=  toggle_split_view"
  printf "  %-16s %s\n" "cmd+shift+space" "=  toggle_quick_terminal"
}

my-aliases() {
  echo "Aliases:"
  echo ""
  grep -E "^alias " ~/.zshrc | sort | while read -r line; do
    # Extract alias name and value
    alias_def="${line#alias }"
    alias_name="${alias_def%%=*}"
    alias_value="${alias_def#*=}"
    # Remove surrounding quotes from value
    alias_value="${alias_value%\"}"
    alias_value="${alias_value#\"}"
    printf "  %-20s %s\n" "$alias_name" "=  $alias_value"
  done
}

my-functions() {
  echo "Functions:"
  echo ""
  grep -E "^[a-zA-Z_][a-zA-Z0-9_-]*\(\)" ~/.zshrc | sort | while read -r line; do
    # Extract function name (remove the parentheses)
    func_name="${line%%\(\)*}"
    printf "  %s\n" "$func_name"
  done
}

help() {
  echo "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  echo "\e[1m\e[36m  austink.dev shell customizations\e[0m"
  echo "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  echo ""
  echo "Custom aliases and functions defined in ~/.zshrc for"
  echo "productivity, git workflows, and local development tools."
  echo ""
  echo "Run \e[33mmy-aliases\e[0m or \e[33mmy-functions\e[0m individually for filtered output."
  echo "Edit \e[33m~/.zshrc\e[0m to add or modify custom commands."
  echo ""
  echo "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  echo ""
  my-ghostty
  echo ""
  my-aliases
  echo ""
  my-functions
  echo ""
  echo "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  echo "\e[2mSource: ~/.zshrc | Reload: reload-shell\e[0m"
}

my-name() {
  echo "austink.dev" | figlet  -f "Slant" | lolcat
  echo " "
}

# ---------------------------------------------------------
# 🎨  Terminal personalization - startup animation
# ---------------------------------------------------------

# :: startup animation
my-name

# :: powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
