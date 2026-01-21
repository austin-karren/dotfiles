# ---------------------------------------------------------
# 🛠️  Pre-Initialization (Paths & Completions)
# ---------------------------------------------------------

# Uncomment the following two lines if needed
# autoload -Uz compinit
# compinit

# :: Docker
fpath=($HOME/.docker/completions $fpath)

# :: brew
export BREW_HOME="/opt/homebrew"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# ---------------------------------------------------------
# 🔌  oh-my-zsh
# ---------------------------------------------------------

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ---------------------------------------------------------
# ⚙️  Shell utilities
# ---------------------------------------------------------

# :: zoxide
eval "$(zoxide init --cmd cd zsh)"

# ---------------------------------------------------------
# 🌐  Web development toolchain (Bun, Deno, Volta)
# ---------------------------------------------------------

# :: volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# :: bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# :: deno
if [[ ":$FPATH:" != *":$HOME/.zsh/completions:"* ]]; then
  export FPATH="$HOME/.zsh/completions:$FPATH"
fi
. "$HOME/.deno/env"

# :: completions bridge (Terraform, etc)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# ---------------------------------------------------------
# 📱  Mobile Development (Android)
# ---------------------------------------------------------

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ---------------------------------------------------------
# 💻  Aliases and functions
# ---------------------------------------------------------

git-unload() {
  echo "📦 Unloading dead branches..."
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
  echo "🔄 Reloading shell..."
  exec zsh
}

secret() {
  echo "🔑 Generating secret..."
  openssl rand -base64 32
}

alias ls="ls --color=always"
alias lsa="ls -a --color=always"

# ---------------------------------------------------------
# 🎨  Terminal personalization - startup animation
# ---------------------------------------------------------

echo "austink.dev" | figlet  -f "Slant" | lolcat
echo "keybindings:" | lolcat
printf "  %-16s %s\n" "cmd+d" "=  new_split:auto"
printf "  %-16s %s\n" "cmd+opt+arrow" "=  toggle_split_view"
printf "  %-16s %s\n" "cmd+shift+space" "=  toggle_quick_terminal"
echo " "
