#!/usr/bin/env bash

# =============================================================================
# macOS Dotfiles Setup Script
# =============================================================================
# This script automates the setup of a new Mac with your dotfiles
# Usage: ./setup.sh

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "\n${BLUE}==>${NC} ${GREEN}$1${NC}\n"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# =============================================================================
# Check if running on macOS
# =============================================================================
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only"
    exit 1
fi

print_header "Starting macOS Setup"
echo "Dotfiles directory: $DOTFILES_DIR"

# =============================================================================
# Install Xcode Command Line Tools
# =============================================================================
print_header "Checking Xcode Command Line Tools"
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please complete the installation and run this script again"
    exit 0
else
    print_success "Xcode Command Line Tools already installed"
fi

# =============================================================================
# Install Homebrew
# =============================================================================
print_header "Checking Homebrew"
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
    echo "Updating Homebrew..."
    brew update
fi

# =============================================================================
# Install packages from Brewfile
# =============================================================================
print_header "Installing Homebrew packages"
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    cd "$DOTFILES_DIR"
    brew bundle
    print_success "Homebrew packages installed"
else
    print_warning "Brewfile not found, skipping package installation"
fi

# =============================================================================
# Install Zsh plugins
# =============================================================================
print_header "Installing Zsh plugins"
mkdir -p ~/.zsh

# zsh-autosuggestions
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    print_success "zsh-autosuggestions installed"
else
    print_success "zsh-autosuggestions already installed"
fi

# zsh-syntax-highlighting
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
    print_success "zsh-syntax-highlighting installed"
else
    print_success "zsh-syntax-highlighting already installed"
fi

# =============================================================================
# Create symlinks for dotfiles
# =============================================================================
print_header "Creating symlinks"

# Backup existing files
backup_file() {
    if [ -f "$1" ] || [ -L "$1" ]; then
        mv "$1" "$1.backup.$(date +%Y%m%d_%H%M%S)"
        print_warning "Backed up existing $1"
    fi
}

# Zsh
backup_file ~/.zshrc
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
print_success "Linked .zshrc"

# Create .zshrc_local from template if it doesn't exist
if [ ! -f ~/.zshrc_local ]; then
    if [ -f "$DOTFILES_DIR/zsh/.zshrc_local.template" ]; then
        cp "$DOTFILES_DIR/zsh/.zshrc_local.template" ~/.zshrc_local
        print_warning "Created .zshrc_local from template - please edit with your secrets"
    fi
else
    print_success ".zshrc_local already exists"
fi

# Git
backup_file ~/.gitconfig
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig
print_success "Linked .gitconfig"

if [ -f "$DOTFILES_DIR/git/.gitconfig_mac" ]; then
    backup_file ~/.gitconfig_mac
    ln -sf "$DOTFILES_DIR/git/.gitconfig_mac" ~/.gitconfig_mac
    print_success "Linked .gitconfig_mac"
fi

if [ -f "$DOTFILES_DIR/git/.gitignore_global" ]; then
    backup_file ~/.gitignore_global
    ln -sf "$DOTFILES_DIR/git/.gitignore_global" ~/.gitignore_global
    print_success "Linked .gitignore_global"
fi

# VSCode
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
if [ -d "/Applications/Visual Studio Code.app" ] || command -v code &>/dev/null; then
    mkdir -p "$VSCODE_USER_DIR"
    if [ -f "$DOTFILES_DIR/vscode/settings.json" ]; then
        backup_file "$VSCODE_USER_DIR/settings.json"
        ln -sf "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
        print_success "Linked VSCode settings"
    fi
else
    print_warning "VSCode not found, skipping VSCode settings"
fi

# =============================================================================
# Setup Pip configuration
# =============================================================================
print_header "Setting up Pip configuration"
mkdir -p ~/.config/pip

if [ -f "$DOTFILES_DIR/pip/pip.conf.template" ]; then
    if [ ! -f ~/.config/pip/pip.conf ]; then
        cp "$DOTFILES_DIR/pip/pip.conf.template" ~/.config/pip/pip.conf
        print_warning "Created pip.conf from template - please edit with your credentials"
    else
        print_success "pip.conf already exists"
    fi
else
    print_warning "pip.conf.template not found, skipping pip setup"
fi

# =============================================================================
# Set Zsh as default shell
# =============================================================================
print_header "Setting Zsh as default shell"
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
    print_success "Zsh set as default shell"
else
    print_success "Zsh already set as default shell"
fi

# =============================================================================
# Final instructions
# =============================================================================
print_header "Setup Complete! 🎉"
echo ""
echo "Next steps:"
echo "  1. Edit ~/.zshrc_local with your secrets and machine-specific config"
echo "  2. Restart your terminal or run: exec zsh"
echo "  3. Configure any remaining app-specific settings"
echo ""
print_warning "Backup files (if any) are saved with .backup.<timestamp> extension"
echo ""
