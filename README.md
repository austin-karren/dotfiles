# My dotfiles

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

## Requirements

Use MacOS, Linux, or WSL. Ensure you have the following installed on your system.

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

First, check out the dotfiles repo in you home directory using git:

```zsh
gh repo clone austin-karren/dotfiles
cd dotfiles
```

Then, use stow to symlink the dotfiles you want to use:

```zsh
stow .
```

## References

YT Video: [Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs?si=7qzwfZUKaaK5Fo-o) by [
Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy)
