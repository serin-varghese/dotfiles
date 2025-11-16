# Python Pip Configuration

Configuration for Python's package manager with corporate proxy and custom indexes.

## 📁 Files

- `pip.conf.template` - Template for pip configuration

## 🚀 Setup

### 1. Create Config Directory

```bash
mkdir -p ~/.config/pip
```

### 2. Copy Template

```bash
cp ~/Projects/02_Personal/dotfiles/pip/pip.conf.template ~/.config/pip/pip.conf
```

### 3. Edit Configuration

```bash
vim ~/.config/pip/pip.conf
```

Replace placeholders:
- `<JFROG_USERNAME>` - Your JFrog/Artifactory username
- `<JFROG_TOKEN>` - Your JFrog/Artifactory API token

## ⚙️ Configuration Options

### Index URLs

The template includes:

**Primary index** (`index-url`):
- Main package source (PyPI or corporate mirror)
- All packages searched here first

**Extra indexes** (`extra-index-url`):
- Fallback package sources
- Corporate repositories
- Special sources (e.g., NVIDIA PyTorch)

### Trusted Hosts

Bypass SSL verification for specific hosts (use with caution):

```ini
trusted-host =
    jfrog.devstack.vwgroup.com
    pypi.ngc.nvidia.com
```

**Warning:** Only add trusted corporate hosts!

### Cache Settings

```ini
no-cache-dir = true
```

Disables local caching. Useful for:
- Corporate environments with package scanning
- Limited disk space
- Consistent package resolution

To enable caching, remove or comment out this line.

## 📝 Using Multiple Configurations

### Priority Order

Pip checks configurations in this order:

1. **Site level** (virtual environment): `$VIRTUAL_ENV/pip.conf`
2. **User level**: `~/.config/pip/pip.conf` or `~/.pip/pip.conf`
3. **Global level**: `/Library/Application Support/pip/pip.conf` (macOS)

### Per-Project Configuration

Create `pip.conf` in your virtual environment:

```bash
# In your project
python -m venv .venv
source .venv/bin/activate

# Create venv-specific config
cat > .venv/pip.conf <<EOF
[global]
index-url = https://pypi.org/simple
EOF
```

### Environment-Specific Configs

```bash
# Development (public PyPI)
cp ~/dotfiles/pip/pip.conf.template ~/.config/pip/pip.conf.dev

# Production (corporate PyPI)
cp ~/dotfiles/pip/pip.conf.template ~/.config/pip/pip.conf.prod

# Switch configs
ln -sf ~/.config/pip/pip.conf.dev ~/.config/pip/pip.conf
```

## 🔧 Common Use Cases

### Install from Corporate Repository

```bash
# Already configured if you edited pip.conf
pip install pandas

# Or specify index explicitly
pip install pandas \
  --index-url https://user:token@jfrog.company.com/artifactory/api/pypi/pypi/simple
```

### Install Specific Versions

```bash
pip install pandas==2.1.0
pip install "numpy>=1.24,<2.0"
```

### Install from requirements.txt

```bash
# Uses configured indexes
pip install -r requirements.txt

# With specific index
pip install -r requirements.txt \
  --index-url https://pypi.org/simple
```

### Install from Private Git Repository

```bash
# Using personal access token
pip install git+https://oauth2:YOUR_TOKEN@github.com/company/repo.git

# Using SSH (if keys configured)
pip install git+ssh://git@github.com/company/repo.git
```

## 🔒 Security

**Important:**
- `~/.config/pip/pip.conf` contains credentials - never commit it!
- Use restrictive permissions: `chmod 600 ~/.config/pip/pip.conf`
- Rotate tokens regularly
- Use environment variables for sensitive values:

```bash
# Set token as environment variable
export JFROG_TOKEN="your-token"

# Reference in pip.conf (not supported directly, use pip's --index-url instead)
```

## 🐛 Troubleshooting

### SSL Certificate Errors

```bash
# Temporarily disable SSL verification (not recommended)
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org package-name

# Better: Add corporate CA certificate
pip config set global.cert /path/to/corporate-ca-bundle.crt
```

### Timeout Issues

```bash
# Increase timeout in pip.conf
[install]
timeout = 120

# Or per command
pip install --timeout 120 package-name
```

### Proxy Issues

If behind a corporate proxy:

```bash
# HTTP proxy
export HTTP_PROXY=http://proxy.company.com:8080
export HTTPS_PROXY=http://proxy.company.com:8080

# With authentication
export HTTP_PROXY=http://user:pass@proxy.company.com:8080
```

Already configured in `~/.zshrc_local` if you followed the setup.

### Check Configuration

```bash
# Show current configuration
pip config list

# Show configuration sources
pip config debug

# Test package installation
pip install --dry-run --verbose pandas
```

## 🔗 Related

- See `.zshrc_local` for proxy settings
- See `templates/.env.template` for environment variables
- [Pip Documentation](https://pip.pypa.io/en/stable/)
- [pip.conf Documentation](https://pip.pypa.io/en/stable/topics/configuration/)
