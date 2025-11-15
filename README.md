# � Dotfiles

Personal configuration files and setup automation for macOS.

## 🚀 Quick Start

### Automated Setup (Recommended)

```bash
# 1. Clone this repository
git clone https://github.com/serin-varghese/dotfiles.git ~/Projects/02_Personal/dotfiles
cd ~/Projects/02_Personal/dotfiles

# 2. Run the setup script
./setup.sh

# 3. Edit your local secrets
vim ~/.zshrc_local

# 4. Restart your shell
exec zsh
```

### Manual Setup

If you prefer to set things up manually:

#### 1. Install Xcode Command Line Tools

```bash
xcode-select --install
```

#### 2. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

For Apple Silicon Macs, add Homebrew to PATH:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### 3. Install packages

```bash
brew bundle
```

#### 4. Install Zsh plugins

```bash
mkdir -p ~/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
```

#### 5. Create symlinks

```bash
# Zsh
ln -sf ~/Projects/02_Personal/dotfiles/zsh/.zshrc ~/.zshrc
cp ~/Projects/02_Personal/dotfiles/zsh/.zshrc_local.template ~/.zshrc_local

# Git
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitconfig_mac ~/.gitconfig_mac
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitignore_global ~/.gitignore_global

# VSCode
ln -sf ~/Projects/02_Personal/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

#### 6. Configure pip (Python package manager)

```bash
# Create pip config directory
mkdir -p ~/.config/pip

# Copy pip template and edit with your credentials
cp ~/Projects/02_Personal/dotfiles/pip/pip.conf.template ~/.config/pip/pip.conf
vim ~/.config/pip/pip.conf

# Replace placeholders:
# <JFROG_USERNAME> - Your JFrog/Artifactory username
# <JFROG_TOKEN>    - Your JFrog/Artifactory API token
```

#### 7. Configure secrets

Edit `~/.zshrc_local` to add your:
- Proxy credentials (if needed)
- API keys
- Machine-specific configurations

---

## 📁 Structure

```
.
├── git/                      # Git configuration
│   ├── .gitconfig           # Main Git config
│   ├── .gitconfig_mac       # Mac-specific Git config
│   └── .gitignore_global    # Global gitignore
├── vscode/                   # VSCode settings
│   └── settings.json
├── zsh/                      # Zsh configuration
│   ├── .zshrc               # Main Zsh config
│   └── .zshrc_local.template # Template for local secrets
├── pip/                      # Python pip configuration
│   └── pip.conf.template    # Template for pip settings
├── ubuntu/                   # Ubuntu-specific configs
│   └── .inputrc
├── .gitignore                # Excludes secrets from git
├── Brewfile                  # Homebrew packages
├── setup.sh                  # Automated setup script
└── README.md
```

---

## 🛠️ Tools Included

### Shell & Terminal
- **Zsh** - Default shell
- **Starship** - Cross-shell prompt
- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Fish-like syntax highlighting

### Modern CLI Tools
- **eza** - Modern replacement for `ls` with colors and icons
- **bat** - `cat` clone with syntax highlighting
- **fd** - Modern replacement for `find`
- **ripgrep** - Fast grep alternative
- **fzf** - Fuzzy finder

### Development
- **Git** - Version control
- **VSCode** - Code editor
- **Docker** - Containerization
- **Azure CLI** - Azure command-line interface

### Productivity
- **Rectangle** - Window management
- **1Password** - Password manager
- **iTerm2** - Terminal emulator

---

## ⚙️ Configuration Details

### Zsh Features
- ✨ Modern prompt with Starship
- 🔍 History search with arrow keys
- � Fish-like autosuggestions
- 🎨 Syntax highlighting
- 📚 Persistent history across sessions

### Custom Aliases
```bash
ll    # Detailed list (eza -la)
cc    # Go up one directory (cd ..)
alert # Play sound when command finishes
```

---

## 🔒 Security

**Important:** Never commit secrets to this repository!

- `.zshrc_local` is gitignored (contains secrets)
- `pip/pip.conf` is gitignored (contains JFrog credentials)
- Use `.zshrc_local.template` and `pip/pip.conf.template` as references
- Sensitive data should only exist in your local config files
- Always replace `<PLACEHOLDERS>` with actual values locally

---

## 🔄 Updating

### Update Brewfile from current system
```bash
cd ~/Projects/02_Personal/dotfiles
brew bundle dump --force
```

### Pull latest dotfiles
```bash
cd ~/Projects/02_Personal/dotfiles
git pull
```

### Apply updates
```bash
# Re-run setup if needed
./setup.sh

# Or manually update specific configs
source ~/.zshrc
```

---

## � Customization

1. **Add more Homebrew packages**: Edit `Brewfile`
2. **Modify Zsh config**: Edit `zsh/.zshrc`
3. **Add local customizations**: Edit `~/.zshrc_local`
4. **Update VSCode settings**: Edit `vscode/settings.json`

---

## 🐛 Troubleshooting

### Zsh plugins not working
```bash
# Reinstall plugins
rm -rf ~/.zsh/zsh-autosuggestions ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
exec zsh
```

### Homebrew issues
```bash
# Update Homebrew
brew update
brew doctor
```

### Symlink conflicts
The `setup.sh` script automatically backs up existing files with a timestamp. Check for `.backup.*` files in your home directory.

---

**Happy configuring! 🎉**
