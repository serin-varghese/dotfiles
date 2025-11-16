# Zsh Configuration

Shell configuration with modern tools and productivity enhancements.

## 📁 Files

- `.zshrc` - Main Zsh configuration (commit to repo)
- `.zshrc_local.template` - Template for machine-specific settings (DO NOT COMMIT)
- `.zshrc_local` - Your actual local settings (gitignored)

## 🚀 Setup

### 1. Install Zsh Plugins

```bash
mkdir -p ~/.zsh

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
```

### 2. Install Starship Prompt

```bash
brew install starship
```

### 3. Symlink Configurations

```bash
# Link main config
ln -sf ~/Projects/02_Personal/dotfiles/zsh/.zshrc ~/.zshrc

# Copy template for local settings
cp ~/Projects/02_Personal/dotfiles/zsh/.zshrc_local.template ~/.zshrc_local

# Edit your local settings
vim ~/.zshrc_local
```

### 4. Reload Shell

```bash
exec zsh
```

## ⚙️ What's Included

### .zshrc (Shared Config)

**Features:**
- Auto-cd (type directory name to cd)
- Command history (5000 lines, persistent, shared across sessions)
- Arrow key history search
- Modern tool aliases (eza, bat, etc.)
- Starship prompt
- Auto-completion

**Aliases:**
- `ls` → `eza` (if installed)
- `ll` → `eza -la --git`
- `cat` → `bat --style=plain` (if installed)
- `tree` → `eza --tree`

**macOS Specific:**
- Homebrew path configuration
- Proxy settings
- HDF5 library paths

### .zshrc_local (Local Config)

This file is gitignored and contains:

**Secrets & Credentials:**
- Proxy credentials
- API tokens
- Database passwords

**Machine-Specific Settings:**
- Custom PATH additions
- Azure/Databricks configurations
- Docker/Podman settings
- Project-specific aliases

**Example (from template):**
```bash
# Proxy settings
export HTTP_PROXY_USER=username
export HTTP_PROXY_PASSWORD=password

# Databricks
alias connect-databricks="databricks configure --token"

# Custom aliases
alias myproject="cd ~/Projects/my-data-project && source .venv/bin/activate"
```

## 🎨 Customization

### Adding Aliases

Edit `~/.zshrc_local`:

```bash
# Git aliases
alias gst="git status"
alias gco="git checkout"
alias gp="git pull"

# Python environments
alias activate="source .venv/bin/activate"

# Jump to common directories
alias work="cd ~/Projects/work"
alias dots="cd ~/Projects/02_Personal/dotfiles"
```

### Extending PATH

Add custom paths in `~/.zshrc_local`:

```bash
# Add local scripts
export PATH="$HOME/.local/bin:$PATH"

# Add custom Python installation
export PATH="/opt/python/3.11/bin:$PATH"
```

### Environment Variables

Set project-specific variables:

```bash
# Default Python version
export PYENV_VERSION=3.11.0

# Jupyter config
export JUPYTER_CONFIG_DIR=~/.jupyter

# Data directories
export DATA_DIR=~/data
export MODELS_DIR=~/models
```

## 🔧 Advanced Features

### History Search

Press ↑/↓ to search history based on what you've typed:

```bash
# Type: git
# Press ↑ → cycles through "git status", "git commit", etc.
```

### Auto-suggestions

As you type, see suggestions from history (gray text). Press → to accept.

### Completion

Press Tab for smart completion:
```bash
git co<Tab>      # Completes to "git checkout"
cd Proj<Tab>     # Completes to "cd Projects/"
```

## 📦 Recommended Tools

Install these for the best experience:

```bash
brew install starship    # Prompt
brew install eza         # Better ls
brew install bat         # Better cat
brew install fzf         # Fuzzy finder
brew install zoxide      # Smart cd
```

## 🔒 Security Notes

**Never commit `.zshrc_local`!**

- Contains secrets and credentials
- Already in `.gitignore`
- Use `.zshrc_local.template` to share structure
- Each machine has its own `.zshrc_local`

## 🐛 Troubleshooting

### Plugins not loading

```bash
# Check if plugins exist
ls ~/.zsh/

# Reinstall if missing
rm -rf ~/.zsh/zsh-*
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# Reload
exec zsh
```

### Starship not showing

```bash
# Check if installed
which starship

# Install if missing
brew install starship

# Verify it's in .zshrc
grep starship ~/.zshrc
```

### Slow startup

```bash
# Profile your shell startup
zsh -xv

# Common culprits:
# - Too many plugins
# - Slow network calls in .zshrc
# - Heavy completions
```

## 🔗 Related

- [Starship Documentation](https://starship.rs/)
- [Zsh Documentation](https://zsh.sourceforge.io/Doc/)
- [Oh My Zsh](https://ohmyz.sh/) - Alternative framework (not used here)
