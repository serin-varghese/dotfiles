# VSCode Configuration

Settings and extensions for data science development with Python, Jupyter, Databricks, and Azure.

## 📁 Files

- `settings.json` - VSCode user settings
- `extensions.json` - Recommended extensions list

## 🚀 Quick Setup

### 1. Install Settings

```bash
# Symlink settings to VSCode user directory
ln -sf ~/Projects/02_Personal/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
```

### 2. Install Extensions

#### Option A: Automatic (install all recommended)
```bash
# Install all extensions from extensions.json
cat ~/Projects/02_Personal/dotfiles/vscode/extensions.json | \
  jq -r '.recommendations[]' | \
  xargs -L 1 code --install-extension
```

#### Option B: Manual (let VSCode prompt you)
1. Open VSCode
2. Open Command Palette (`Cmd+Shift+P`)
3. Run: "Extensions: Show Recommended Extensions"
4. Click "Install All" or install individually

## 📦 Extensions Categories

### Python & Data Science
- **Python** - Full Python language support
- **Pylance** - Fast, feature-rich language server
- **Ruff** - Fast Python linter & formatter
- **Jupyter** - Notebook support
- **autoDocstring** - Generate docstrings automatically

### Databricks & Azure
- **Databricks** - Workspace integration, notebook sync
- **Azure Account** - Azure authentication
- **Azure Storage** - Browse storage accounts
- **Azure Resources** - Manage Azure resources

### SQL & Databases
- **SQLTools** - Universal SQL client
- **SQLTools Databricks Driver** - Connect to Databricks SQL
- **DuckDB SQL Tools** - DuckDB integration

### Code Quality
- **GitLens** - Enhanced Git features
- **Error Lens** - Inline error display
- **Code Spell Checker** - Catch typos

### Productivity
- **TODO Highlight** - Highlight TODO/FIXME comments
- **Path Intellisense** - Autocomplete file paths
- **Better Comments** - Colorful comment highlighting

## ⚙️ Key Settings Explained

Check `settings.json` for configurations including:
- Python formatting with Ruff
- Jupyter notebook settings
- Git integration
- Editor preferences

## 🔄 Updating

To update your settings:
1. Edit `vscode/settings.json` in this repo
2. Changes will sync automatically (if symlinked)
3. Commit and push changes

To update extensions list:
```bash
# Export currently installed extensions
code --list-extensions > extensions.txt
# Then manually update extensions.json
```

## 💡 Tips

- Use `Cmd+Shift+P` to access all VSCode commands
- Install "Settings Sync" to sync across multiple machines
- Customize keybindings in `keybindings.json` (not included yet)
