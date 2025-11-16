# Brewfile - Homebrew Bundle for Data Science
# Install all packages with: brew bundle
# Generate from current system: brew bundle dump --force

# Taps
# Note: Explicitly tapping `homebrew/bundle`, `homebrew/cask`, and
# `homebrew/core` is no longer required and can cause errors. Homebrew
# provides bundle and cask functionality from core now. If you run into
# a package that requires an additional tap, add it individually.

# =============================================================================
# Essential CLI Tools
# =============================================================================

# Version Control
brew "git"
brew "git-lfs"         # Git Large File Storage (for models/datasets)
brew "wget"
brew "curl"

# =============================================================================
# Shell & Terminal
# =============================================================================

# Shell
brew "zsh"
brew "starship"        # Cross-shell prompt

# Modern Unix tools (replacements for classic commands)
brew "eza"             # Modern replacement for ls
brew "bat"             # Cat clone with syntax highlighting
brew "fd"              # Modern replacement for find
brew "ripgrep"         # Fast grep alternative (rg)
brew "fzf"             # Fuzzy finder
brew "zoxide"          # Smarter cd command
brew "tldr"            # Simplified man pages

# Terminal multiplexer (optional)
# brew "tmux"          # Terminal multiplexer

# =============================================================================
# Python Development
# =============================================================================

# Python
brew "python@3.11"     # Python 3.11

# Python version management
brew "pyenv"           # Python version manager
brew "pyenv-virtualenv" # Virtualenv plugin for pyenv

# Python package management
brew "poetry"          # Modern dependency management
brew "pipx"            # Install Python CLI tools in isolated environments

# Python tools
brew "ruff"            # Fast Python linter & formatter
brew "uv"              # Ultra-fast Python package installer

# =============================================================================
# Data Science & ML Libraries (system dependencies)
# =============================================================================

# Scientific computing dependencies
brew "cmake"
brew "openblas"
brew "hdf5"            # Hierarchical Data Format
brew "netcdf"          # Network Common Data Form

# Linear algebra & optimization
brew "suite-sparse"
brew "tbb"             # Threading Building Blocks

# Qt (for certain Python packages)
brew "qt@5"            # Qt framework version 5

# =============================================================================
# Databases & Data Tools
# =============================================================================

# Databases
brew "postgresql@15"   # PostgreSQL database
brew "duckdb"          # Fast in-process analytical database
brew "sqlite"          # SQLite database

# Database CLI tools
brew "pgcli"           # PostgreSQL CLI with autocomplete
brew "litecli"         # SQLite CLI with autocomplete

# =============================================================================
# Cloud & DevOps
# =============================================================================

# Cloud CLIs
brew "azure-cli"       # Azure command-line interface

# Container & orchestration
brew "kubectl"         # Kubernetes CLI (optional)
# brew "helm"          # Kubernetes package manager (optional)

# Infrastructure as Code (optional)
# brew "terraform"     # Infrastructure as code

# =============================================================================
# Databricks & Spark
# =============================================================================

# Databricks
brew "databricks"      # Databricks CLI

# Java (required for Spark)
brew "openjdk@11"      # Java 11 for Spark compatibility

# =============================================================================
# Development Tools
# =============================================================================

# JSON/YAML tools
brew "jq"              # JSON processor
brew "yq"              # YAML processor

# File compression
brew "p7zip"
brew "unzip"

# Process monitoring
brew "htop"            # Interactive process viewer
brew "btop"            # Modern htop alternative

# =============================================================================
# Data Visualization & Graphics (optional)
# =============================================================================

# Graphviz (for visualization libraries like networkx)
brew "graphviz"

# ImageMagick (for image processing)
brew "imagemagick"

# =============================================================================
# Git Tools
# =============================================================================

# Git extras
brew "git-delta"       # Better git diff
brew "gh"              # GitHub CLI
# brew "lazygit"       # Terminal UI for git (optional)

# DVC - Data Version Control
brew "dvc"

# =============================================================================
# Pre-commit & Code Quality
# =============================================================================

# Pre-commit framework
brew "pre-commit"

# Security scanning
brew "gitleaks"        # Detect secrets in git repos

# =============================================================================
# Productivity Tools
# =============================================================================

# Note-taking & documentation
brew "pandoc"          # Universal document converter

# =============================================================================
# Applications (Casks)
# =============================================================================

# Development
cask "visual-studio-code"
cask "docker"          # Docker Desktop
cask "iterm2"          # Better terminal

# Productivity
cask "rectangle"       # Window management
cask "1password"       # Password manager

# Data Science Apps (optional)
# cask "pycharm"       # Python IDE
# cask "rstudio"       # R IDE
# cask "dbeaver-community" # Universal database tool

# Communication
cask "slack"
# cask "microsoft-teams"  # Uncomment if needed
# cask "zoom"             # Uncomment if needed

# Browsers (optional)
# cask "google-chrome"
# cask "firefox"

# Note-taking (optional)
# cask "obsidian"      # Markdown-based notes
# cask "notion"        # All-in-one workspace

# =============================================================================
# Post-Install Notes
# =============================================================================
# After installing:
# 1. Link Java: sudo ln -sfn /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk
# 2. Install VSCode extensions: see vscode/extensions.json
# 3. Setup pre-commit: pre-commit install (in your project repos)
