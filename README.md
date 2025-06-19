# My dotfiles

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

## Requirements

Use macOS, Linux, or WSL. If you are using something other than macOS on apple silicon, you may want to comment out JS ecosystem stuff in `.zshrc` and set that up yourself. Ensure you have the following installed on your system.

### Zsh

```bash
sudo apt install
```

### Oh My Zsh

Check if you have zsh installed:

```bash
which zsh
```

Curl:

```zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Wget:

```zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

### Git

macOS:

```zsh
brew install git
```

Linux:

```zsh
sudo apt-get install git
```

### Stow

macOS:

```zsh
brew install stow
```

Linux:

```zsh
sudo apt-get install stow
```

## Installation

First make sure zsh is installed and set as your default shell. Then check out the dotfiles repo in you home directory using git:

```zsh
gh repo clone austin-karren/dotfiles
cd dotfiles
```

Then, use stow to symlink the dotfiles you want to use:

```zsh
stow .
```

Note: oh-my-zsh overrides the `.zshrc` file. To use the `.zshrc` file in this repo, you can add the `--adopt` flag to the stow command:

```zsh
stow --adopt .zshrc
```

### User paths

The `.zshrc` file assumes that the user is on macOS and the user is `austinkarren` (my default macOS user). Change the paths in `.zshrc` to match your system or do a fresh install yourself. If you are using something other than macOS on apple silicon, you may want to comment out JS ecosystem stuff in `.zshrc` and set that up yourself.

### Startup animation

For art on your shell install figlet and lolcat:

```zsh
brew install figlet lolcat
```

## References

YT video: [Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs?si=7qzwfZUKaaK5Fo-o) by [
Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy)

My blog post about dotfiles management: [https://austink.dev/articles/make-managing-dotfiles-a-breeze-with-stow](https://austink.dev/articles/make-managing-dotfiles-a-breeze-with-stow)
