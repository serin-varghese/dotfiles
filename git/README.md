# Git Configuration

Git settings optimized for data science workflows.

## 📁 Files

- `.gitconfig` - Main Git configuration
- `.gitconfig_mac` - macOS-specific Git settings
- `.gitignore_global` - Global gitignore patterns

## 🚀 Setup

### Symlink Configurations

```bash
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitconfig_mac ~/.gitconfig_mac
ln -sf ~/Projects/02_Personal/dotfiles/git/.gitignore_global ~/.gitignore_global
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
