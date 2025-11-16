# Git Configuration

Git settings optimized for data science workflows.

## 📁 Files

### `.gitconfig`
**Main Git configuration file** - Contains your global Git settings, aliases, and preferences.

What it controls:
- User identity (name, email)
- Default branch names
- Custom aliases for common commands
- Merge and diff tools
- Color settings
- Push/pull behavior

Location after install: `~/.gitconfig`

### `.gitconfig_mac`
**macOS-specific Git settings** - Platform-specific configurations for macOS.

What it controls:
- macOS Keychain integration for credentials
- macOS-specific file system settings
- Platform-specific diff/merge tools (e.g., Xcode FileMerge)
- Path configurations for macOS

Location after install: `~/.gitconfig_mac` (included by `.gitconfig`)

### `.gitignore_global`
**Global ignore patterns** - Files and patterns to ignore across ALL your Git repositories.

What it controls:
- OS-specific files (`.DS_Store`, `Thumbs.db`)
- Editor/IDE files (`.vscode/`, `.idea/`)
- Python artifacts (`__pycache__/`, `*.pyc`)
- Data science files (datasets, models, notebooks checkpoints)
- Secrets and credentials

Location after install: `~/.gitignore_global`

**Note:** This is different from project-specific `.gitignore` files. Global patterns apply to every Git repo on your machine.

## 🚀 Setup

### Quick Install (Recommended)

Run the automated setup script from the dotfiles root:

```bash
cd ~/Projects/02_Personal/dotfiles
./setup.sh
```

This will automatically create symlinks for all Git configurations.

### Manual Install

If you prefer to install manually or selectively:

#### Step 1: Symlink Configurations

```bash
# Main Git config
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitconfig ~/.gitconfig

# macOS-specific config
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitconfig_mac ~/.gitconfig_mac

# Global gitignore
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitignore_global ~/.gitignore_global
```

**What symlinks do:**
- Create a link from your home directory to the dotfiles repo
- Changes in the repo automatically apply to your system
- Easy to update by pulling latest changes from Git

#### Step 2: Configure Your Identity

**Important:** Set your personal information (not included in dotfiles for privacy):

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@company.com"
```

#### Step 3: Verify Installation

```bash
# Check that configs are loaded
git config --list --show-origin

# Test an alias
git st  # Should run 'git status'
```

### Updating Configurations

Since files are symlinked, updates are automatic:

```bash
cd ~/Projects/02_Personal/dotfiles
git pull
# Your Git config is now updated!
```

## ⚙️ .gitconfig

Main Git configuration with aliases and settings.

### Configure Your Identity

After symlinking, set your personal info:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@company.com"
```

### Useful Aliases

Check `.gitconfig` for pre-configured aliases like:

```bash
git st      # status
git co      # checkout
git br      # branch
git ci      # commit
git unstage # unstage files
git last    # show last commit
```

## 🍎 .gitconfig_mac

macOS-specific settings included via `.gitconfig`.

Contains macOS-specific configurations such as:
- Credential helpers
- Path configurations
- macOS-specific diff/merge tools

## 🚫 .gitignore_global

Global patterns that apply to all your repositories.

### What's Ignored

**Python:**
- `__pycache__/`, `*.pyc`
- `.ruff_cache/`, `.pytest_cache/`
- Virtual environments (`venv/`, `.venv/`)

**Data Science:**
- Data files: `*.csv`, `*.parquet`, `*.pkl`
- Models: `*.pth`, `*.h5`, `*.onnx`
- Notebooks: `.ipynb_checkpoints/`
- Experiment tracking: `mlruns/`, `wandb/`

**OS Files:**
- macOS: `.DS_Store`
- Linux: `*~`
- Windows: `Thumbs.db`

**IDEs:**
- VSCode: `.vscode/`
- PyCharm: `.idea/`
- Jupyter: `.jupyter/`

**Secrets:**
- `.env`, `.env.local`
- `.databrickscfg`
- `.azure/`

### Customization

To add project-specific ignores, create `.gitignore` in your project root.

Global ignore applies across all repositories on your machine.

## 📝 Best Practices

### Committing Notebooks

Jupyter notebooks can cause messy diffs. Use one of these approaches:

#### Option 1: nbstripout (recommended)
```bash
pip install nbstripout
nbstripout --install  # In your repo
```

Automatically clears outputs before commit.

#### Option 2: Manual clearing
Clear all outputs before committing:
- Jupyter: Cell → All Output → Clear
- VSCode: Clear All Outputs button

### Handling Large Files

For datasets and models over 100MB:

```bash
# Install Git LFS
brew install git-lfs
git lfs install

# Track large files
git lfs track "*.pth"
git lfs track "*.h5"
git lfs track "*.parquet"

# Commit .gitattributes
git add .gitattributes
git commit -m "Configure Git LFS"
```

### Data Version Control (DVC)

For better data versioning:

```bash
brew install dvc

# Initialize in your repo
dvc init

# Track data
dvc add data/large-dataset.csv
git add data/large-dataset.csv.dvc .gitignore
git commit -m "Add dataset with DVC"
```

## 🔧 Advanced Configuration

### Diff Tools

Configure diff tool for better notebook viewing:

```bash
# Using nbdime
pip install nbdime
nbdime config-git --enable --global
```

### Credentials

For Azure DevOps or GitHub:

```bash
# macOS Keychain (recommended)
git config --global credential.helper osxkeychain

# Or use gh CLI
brew install gh
gh auth login
```

## 🔗 Related

- See `.gitattributes` in repo root for file handling rules
- See `.pre-commit-config.yaml` for automated checks
- See project `.gitignore` templates in `templates/`
