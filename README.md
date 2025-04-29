🎯 Dotfiles

Get up and running on a new machine in minutes with this streamlined collection of dotfiles. These are my personal configuration files designed to simplify and customize terminal, Git, and VSCode environments.

⸻

✨ Quick Start: Setup on a New Machine

1. Clone this repository:

   ```bash
   git clone https://github.com/serin-varghese/dotfiles.git ~/dotfiles
   ```

2. Navigate to the cloned directory:

   ```bash
   cd ~/dotfiles
   ```

3. Set up Git configuration:

   ```bash
   mv git/.gitconfig ~/
   ```

4. Copy VSCode settings:
 • Open VSCode.
 • Go to Code → Preferences → Settings.
 • Click the {} icon at the top right to open settings.json.
 • Replace the contents with vscode/settings.json.

5. Apply custom Zsh config:

   ```bash
   mv zsh/.zshrc ~/.zshrc
   ```

⸻

📂 Folder Structure

dotfiles/
├── git/
│   ├── .gitconfig
│   ├── .gitconfig_mac
│   └── .gitignore_global
├── vscode/
│   └── settings.json
└── zsh/
    └── .zshrc


⸻

📌 Pro Tip: Symlink Instead of Copying

To make updates to dotfiles seamless across machines:

   ```bash
   ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
   ```

This keeps your home directory synced with changes made in the repo.

⸻
