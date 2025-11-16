# Databricks Configuration

Templates for connecting to Databricks workspaces on Azure.

## 📁 Files

- `.databrickscfg.template` - Configuration template for Databricks CLI

## 🚀 Setup

### 1. Copy Template

```bash
cp ~/Projects/02_Personal/dotfiles/databricks/.databrickscfg.template ~/.databrickscfg
```

### 2. Edit Configuration

```bash
vim ~/.databrickscfg
```

Replace placeholders:
- `<workspace-name>` - Your Databricks workspace name
- `<your-personal-access-token>` - Generate from User Settings → Access Tokens

### 3. Generate Personal Access Token

1. Go to your Databricks workspace
2. Click your profile → **User Settings**
3. Navigate to **Access Tokens** tab
4. Click **Generate New Token**
5. Set lifetime (e.g., 90 days)
6. Copy the token (you won't see it again!)
7. Paste into `~/.databrickscfg`

## 📝 Configuration Profiles

The template includes multiple profile examples:

### DEFAULT Profile
Used when no `--profile` flag is specified:
```ini
[DEFAULT]
host = https://<workspace-name>.azuredatabricks.net
token = <your-pat>
```

### Environment Profiles (dev/staging/prod)
```ini
[dev]
host = https://dev-workspace.azuredatabricks.net
token = <dev-token>

[prod]
host = https://prod-workspace.azuredatabricks.net
token = <prod-token>
```

### Azure AD Authentication
Use your Azure CLI login instead of tokens:
```ini
[azure-ad]
host = https://<workspace-name>.azuredatabricks.net
auth_type = azure-cli
```

Requires: `az login` before using Databricks CLI

### Service Principal Authentication
For CI/CD pipelines:
```ini
[sp-auth]
host = https://<workspace-name>.azuredatabricks.net
auth_type = azure-client-secret
azure_tenant_id = <tenant-id>
azure_client_id = <sp-client-id>
azure_client_secret = <sp-secret>
```

## 🔧 Usage

### Using Default Profile
```bash
databricks workspace list
databricks fs ls dbfs:/
databricks clusters list
```

### Using Specific Profile
```bash
databricks workspace list --profile dev
databricks fs ls dbfs:/ --profile prod
```

### Set Default Profile via Environment Variable
```bash
export DATABRICKS_CONFIG_PROFILE=dev
databricks workspace list  # Uses dev profile
```

## 🛠️ Common Commands

### Workspace
```bash
# List workspace files
databricks workspace list /Users/your.email@company.com

# Export notebook
databricks workspace export /path/to/notebook notebook.py --format SOURCE

# Import notebook
databricks workspace import notebook.py /path/to/notebook --language PYTHON
```

### DBFS (Databricks File System)
```bash
# List files
databricks fs ls dbfs:/

# Upload file
databricks fs cp local-file.csv dbfs:/data/

# Download file
databricks fs cp dbfs:/data/file.csv ./local-file.csv
```

### Clusters
```bash
# List clusters
databricks clusters list

# Start cluster
databricks clusters start --cluster-id <cluster-id>

# Get cluster info
databricks clusters get --cluster-id <cluster-id>
```

### Jobs
```bash
# List jobs
databricks jobs list

# Run job
databricks jobs run-now --job-id <job-id>

# Get run status
databricks runs get --run-id <run-id>
```

## 🔒 Security

**Important:**
- `~/.databrickscfg` contains secrets - never commit it!
- Use restrictive permissions: `chmod 600 ~/.databrickscfg`
- Rotate tokens regularly (every 90 days recommended)
- Use Azure AD auth when possible for better security

## 🔗 Links

- [Databricks CLI Documentation](https://docs.databricks.com/dev-tools/cli/index.html)
- [Azure Databricks Authentication](https://docs.microsoft.com/en-us/azure/databricks/dev-tools/auth)
- [Personal Access Tokens](https://docs.databricks.com/dev-tools/api/latest/authentication.html)
