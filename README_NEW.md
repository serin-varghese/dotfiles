# 🏠 Dotfiles for Data Scientists

Personal dotfiles and development environment setup for data science work with Python, Databricks, and Azure on macOS.

## 🚀 Quick Start

```bash
# Clone this repo
git clone https://github.com/serin-varghese/dotfiles.git ~/Projects/02_Personal/dotfiles
cd ~/Projects/02_Personal/dotfiles

# Run automated setup
./setup.sh

# Edit your secrets
vim ~/.zshrc_local
vim ~/.config/pip/pip.conf
vim ~/.databrickscfg

# Restart shell
exec zsh
```

## 📁 What's Inside

### 🐚 [Shell Configuration](zsh/)
Modern Zsh setup with Starship prompt, auto-suggestions, and productivity aliases.

### 🐍 [Python Configuration](pip/)
Pip settings for corporate proxies and custom package indexes.

### 📊 [Databricks Setup](databricks/)
CLI configuration for Azure Databricks workspaces with multiple profiles.

### 💻 [VSCode](vscode/)
50+ recommended extensions and settings for data science development.

### 📝 [Project Templates](templates/)
Ready-to-use templates for new data science projects:
- `pyproject.toml` - Python project config with Ruff, pytest, mypy
- `.env.template` - Environment variables for Azure/Databricks

### 🔧 [Git Configuration](git/)
Git settings optimized for data science workflows with notebook handling.

### Root Configuration Files
- `.gitattributes` - Handle Jupyter notebooks and data files in Git
- `.editorconfig` - Consistent code style across editors
- `.pre-commit-config.yaml` - Automated code quality checks
- `.gitignore` - Comprehensive ignore patterns for data science
- `Brewfile` - All Homebrew packages and apps

## 🛠️ Tools Included

**Shell & Terminal:**
- Zsh + Starship + zsh-autosuggestions + zsh-syntax-highlighting
- Modern CLI: eza, bat, fd, ripgrep, fzf, zoxide

**Python Development:**
- pyenv, poetry, ruff, uv
- pytest, mypy, pre-commit

**Data Science:**
- Databricks CLI, DuckDB, PostgreSQL
- Git LFS, DVC (Data Version Control)
- Jupyter, pandas, numpy (via templates)

**Cloud & DevOps:**
- Azure CLI, Docker, kubectl
- GitHub CLI, gitleaks

See [Brewfile](Brewfile) for the complete list.

## 📖 Detailed Documentation

Each directory has its own README with installation and usage instructions:

- **[vscode/README.md](vscode/README.md)** - VSCode setup and extensions
- **[databricks/README.md](databricks/README.md)** - Databricks CLI configuration
- **[templates/README.md](templates/README.md)** - Project templates usage
- **[git/README.md](git/README.md)** - Git configuration guide
- **[zsh/README.md](zsh/README.md)** - Shell configuration details
- **[pip/README.md](pip/README.md)** - Python pip setup

## 🎯 For New Data Scientists

This repo serves as a **quickstart checklist** for setting up a new Mac for data science work:

✅ Shell with modern tools and aliases  
✅ Python development environment  
✅ Databricks and Azure integration  
✅ VSCode with all essential extensions  
✅ Git configured for notebooks and data files  
✅ Code quality automation (pre-commit hooks)  
✅ Project templates ready to use  

## 🔒 Security

**Never commit secrets!** These files are gitignored:
- `zsh/.zshrc_local` - Proxy credentials, API keys
- `~/.config/pip/pip.conf` - JFrog/Artifactory tokens  
- `~/.databrickscfg` - Databricks tokens
- `.env` files - Environment-specific secrets

Always use the `.template` files as references.

## 🔄 Updating

```bash
cd ~/Projects/02_Personal/dotfiles
git pull
./setup.sh  # Re-run to apply updates
```

## 💡 Customization

1. Fork this repo
2. Modify configs to your preferences
3. Update Brewfile with your tools
4. Add your VSCode extensions to `vscode/extensions.json`
5. Commit and push to your fork

## 🐛 Troubleshooting

Check individual README files for specific issues:
- Shell not loading? → [zsh/README.md](zsh/README.md#troubleshooting)
- Pip install failing? → [pip/README.md](pip/README.md#troubleshooting)  
- Git issues? → [git/README.md](git/README.md#best-practices)

## 📄 License

See [LICENSE](LICENSE) file.

---

**Happy coding! 🎉**
