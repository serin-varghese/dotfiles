# Project Templates

Reusable configuration templates for data science projects.

## 📁 Files

- `pyproject.toml` - Python project configuration template
- `.env.template` - Environment variables template for Azure/Databricks projects

## 🐍 pyproject.toml

Modern Python project configuration with Ruff, pytest, and mypy.

### Usage

```bash
# Copy to your project root
cp ~/Projects/02_Personal/dotfiles/templates/pyproject.toml /path/to/your/project/

# Customize
vim /path/to/your/project/pyproject.toml
```

### What's Included

- **Project metadata** - name, version, dependencies
- **Ruff** - Fast linting & formatting (replaces Black, isort, flake8)
- **pytest** - Test configuration with coverage
- **mypy** - Type checking configuration
- **Build system** - setuptools configuration

### Key Features

#### Ruff Configuration
- Line length: 88 (Black compatible)
- Import sorting built-in
- Fast linting with auto-fix
- Pandas-specific rules

#### Testing
- Coverage reports (terminal + HTML)
- Test markers (unit, integration, slow)
- Strict pytest settings

#### Dependencies
Includes common data science packages:
- numpy, pandas, matplotlib, seaborn
- Optional: scikit-learn, torch, databricks-sdk
- Dev tools: pytest, ruff, mypy, jupyter

### Customization

Edit the template to:
1. Change project name and version
2. Add/remove dependencies
3. Adjust Ruff rules
4. Configure pytest markers
5. Set mypy strictness

## 🌍 .env.template

Comprehensive environment variables for data science projects.

### Usage

```bash
# Copy to your project root
cp ~/Projects/02_Personal/dotfiles/templates/.env.template /path/to/your/project/.env

# Edit with your values
vim /path/to/your/project/.env

# Load in Python
pip install python-dotenv
```

```python
from dotenv import load_dotenv
import os

load_dotenv()
workspace_url = os.getenv("DATABRICKS_WORKSPACE_URL")
```

### What's Included

#### Databricks
- Workspace URLs and tokens
- Cluster IDs
- SQL warehouse IDs
- Databricks Connect settings

#### Azure
- Tenant and subscription IDs
- Service principal credentials
- Storage account settings
- Key Vault configuration
- Azure OpenAI settings

#### Databases
- PostgreSQL connection strings
- SQL Server settings
- DuckDB paths

#### MLflow
- Tracking URI
- Experiment names
- Artifact locations

#### Data Paths
- Local directories (data, models, logs)
- Azure Blob Storage paths (abfss://)
- ADLS Gen2 paths

#### API Keys
- GitHub tokens
- Hugging Face tokens
- Weights & Biases
- OpenAI keys

### Security

**Important:**
- `.env` files should NEVER be committed to git
- Already excluded in `.gitignore`
- Use `.env.template` to show structure only
- Replace ALL `<placeholders>` with real values

### Best Practices

1. **One .env per environment**: `.env.dev`, `.env.prod`
2. **Use Azure Key Vault** for production secrets
3. **Rotate credentials** regularly
4. **Limit scope** - only include what you need
5. **Document** - add comments for team members

## 🚀 Quick Start for New Projects

```bash
# Create new project directory
mkdir my-data-project && cd my-data-project

# Copy templates
cp ~/Projects/02_Personal/dotfiles/templates/pyproject.toml .
cp ~/Projects/02_Personal/dotfiles/templates/.env.template .env

# Initialize git
git init

# Copy .gitattributes and .gitignore
cp ~/Projects/02_Personal/dotfiles/.gitattributes .
cp ~/Projects/02_Personal/dotfiles/.gitignore .

# Copy pre-commit config
cp ~/Projects/02_Personal/dotfiles/.pre-commit-config.yaml .

# Create project structure
mkdir -p src tests data notebooks

# Install pre-commit hooks
pip install pre-commit
pre-commit install

# Create virtual environment
python -m venv .venv
source .venv/bin/activate

# Install dependencies
pip install -e ".[dev]"
```

## 📚 Additional Resources

- [Ruff Documentation](https://docs.astral.sh/ruff/)
- [pytest Documentation](https://docs.pytest.org/)
- [python-dotenv Documentation](https://pypi.org/project/python-dotenv/)
- [pyproject.toml Specification](https://packaging.python.org/en/latest/specifications/declaring-project-metadata/)
