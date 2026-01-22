# My Dotfiles

This repository contains my personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Stow creates symlinks from this repository to your home directory, making it easy to version control and sync your configuration files across machines.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Included Files](#included-files)
- [References](#references)

## Prerequisites

### System Requirements

- **Operating System**: macOS, Linux, or WSL
- **Note**: If you're using something other than macOS on Apple Silicon, you may need to adjust paths in `.zshrc` and comment out JS ecosystem configurations.

### Required Software

#### Zsh

**Linux:**

```bash
sudo apt install zsh
```

Set Zsh as your default shell:

```bash
chsh -s $(which zsh)
```

#### Oh My Zsh

First, verify Zsh is installed:

```bash
which zsh
```

Install Oh My Zsh using curl:

```zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Or using wget:

```zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

#### Git

**macOS:**

```zsh
brew install git
```

**Linux:**

```zsh
sudo apt-get install git
```

#### GNU Stow

**macOS:**

```zsh
brew install stow
```

**Linux:**

```zsh
sudo apt-get install stow
```

### Optional Dependencies

#### Startup Animation

For the cool ASCII art shell greeting, install:

```zsh
brew install figlet lolcat
```

#### Git Delta (Enhanced Diff Viewer)

The `.gitconfig` uses [delta](https://github.com/dandavison/delta) as a pager for better git diffs:

```zsh
brew install git-delta
```

## Installation

1. **Clone the repository** to your home directory:

   ```zsh
   cd ~
   gh repo clone austin-karren/dotfiles
   cd dotfiles
   ```

2. **Symlink dotfiles using Stow**:

   ```zsh
   stow .
   ```

3. **Handle Oh My Zsh `.zshrc` conflict**:

   Oh My Zsh creates its own `.zshrc` file during installation. To use the `.zshrc` from this repo, use the `--adopt` flag:

   ```zsh
   stow --adopt .
   ```

   This will replace the repository's `.zshrc` with your current one, so you may want to back up your changes first or use `stow --adopt` carefully.

## Configuration

### Git Configuration (`.gitconfig`)

The `.gitconfig` file includes several useful settings and aliases. **Important**: You need to configure your personal git information.

#### Required Setup

The `.gitconfig` includes this line:

```gitconfig
[include]
  path = ~/.gitconfig.local
```

You need to **create a `~/.gitconfig.local` file** with your personal information:

```gitconfig
[user]
  name = Your Name
  email = your.email@example.com
```

**Alternative**: If you don't want to use a separate file, you can edit the `.gitconfig` directly and replace:

```gitconfig
[user]
	name = Austin Karren
[include]
  path = ~/.gitconfig.local # Replace with your own configuration file or email
```

with your own information:

```gitconfig
[user]
  name = Your Name
  email = your.email@example.com
```

#### Git Features Included

- **Useful aliases**: `git undo` - undoes the last commit while keeping changes
- **Auto-setup remote**: Automatically sets up remote tracking for new branches
- **Delta pager**: Enhanced diff viewer with syntax highlighting and line numbers
- **zdiff3 merge style**: Better conflict resolution view
- **Git LFS**: Large File Storage support

### Zsh Configuration (`.zshrc`)

The `.zshrc` file is configured for macOS on Apple Silicon. If you're using a different system:

1. Review and adjust paths to match your system
2. Comment out or modify JS ecosystem configurations (Node.js, npm, etc.)
3. Adjust any macOS-specific settings

## Included Files

- **`.gitconfig`** - Git configuration with aliases and enhanced diff viewing
- **`.zshrc`** - Zsh shell configuration with Oh My Zsh integration
- **`.config/zed/`** - Zed editor configuration (optional)
- **`Library/Application Support/com.mitchellh.ghostty/`** - Ghostty terminal configuration (optional)

## Optional Configurations

The following configurations are included but are optional and lower priority compared to the core `.zshrc` and `.gitconfig` files.

### Zed Editor (`.config/zed/`)

[Zed](https://zed.dev/) is a high-performance, multiplayer code editor. The configuration includes:

#### Key Features Configured

- **Theme**: Catppuccin (Mocha for dark mode, Latte for light mode) with system-based switching
- **Font**: MonoLisa at 16pt for both UI and editor
- **Keybindings**: VSCode-compatible keymap (see `keymap.json`)
- **LSP Configurations**:
  - Tailwind CSS with custom class functions (cva, cx)
  - Typos LSP for spell checking
- **AI Agent Settings**: Claude Sonnet 4.5 as default model with custom profiles
- **Editor Settings**: 2-space tabs, soft wrap, format on save

#### Files Included

- `settings.json` - Main editor configuration
- `keymap.json` - Custom keybindings
- `themes/` - Custom theme configurations
- `prompts/` - AI agent prompts

**Note**: If you don't use Zed, you can safely ignore this directory when running `stow`.

### Ghostty Terminal (`.config/ghostty/`)

[Ghostty](https://ghostty.org/) is a fast, feature-rich terminal emulator. The configuration includes:

#### Key Features Configured

- **Themes**: Andromeda (dark) and Catppuccin Latte (light) with automatic switching
- **Font**: MonoLisa at 15pt
- **Window Settings**:
  - Padding: 6px on all sides with balanced padding
  - Default size: 95 columns × 28 rows
  - Saves window state between sessions
- **Quick Terminal**:
  - Global hotkey: `Cmd+Shift+Space`
  - Auto-hide when focus is lost
  - Appears on screen with mouse cursor
- **Custom Keybindings**:
  - `Cmd+D` - New split (auto direction)
  - `Shift+Enter` - Insert newline

#### Location

The config is located at:

```
Library/Application Support/com.mitchellh.ghostty/config
```

**Note**: If you don't use Ghostty, you can safely ignore this directory when running `stow`. You can selectively stow files by specifying individual directories instead of using `stow .`

## References

- **YouTube**: [Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs?si=7qzwfZUKaaK5Fo-o) by [Dreams of Autonomy](https://www.youtube.com/@dreamsofautonomy)
- **Blog Post**: [Make Managing Dotfiles a Breeze with Stow](https://austink.dev/articles/make-managing-dotfiles-a-breeze-with-stow)

---

**Happy configuring! 🚀**
