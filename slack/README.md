# Slack Configuration

Slack workspace and notification settings.

## 📦 Installation

### Via Homebrew (Recommended)

```bash
brew install --cask slack
```

### Manual Download

Download from [slack.com/downloads/mac](https://slack.com/downloads/mac)

## ⚙️ Initial Setup

### 1. Sign In to Workspaces

```bash
# Launch Slack
open -a Slack
```

Click **"Sign in to Slack"** and enter your workspace URL(s).

### 2. Add Multiple Workspaces

- Click your workspace name (top-left)
- Select **"Sign in to another workspace"**
- Enter workspace URL and credentials

## 🔧 Recommended Settings

### Notifications

**Preferences → Notifications:**

✅ Notify me about: **Direct messages, mentions & keywords**  
✅ Sound & appearance: **Notification sound: Knock Brush** (or your preference)  
✅ When I'm not active: **Send me email notifications**  
✅ Do Not Disturb: **Set schedule** (e.g., 10 PM - 8 AM)

**Mute channels you don't need immediate alerts from:**
- Right-click channel → **Mute channel**

### Sidebar

**Preferences → Sidebar:**

✅ Always show: **Unreads, Starred, Threads**  
✅ Sort conversations: **Most recent** or **Alphabetically** (your choice)  
✅ Show all unread channels and DMs: **Enabled**

### Themes

**Preferences → Themes:**

Choose a theme or create custom:

**Data Science Dark Theme:**
```
#1E1E1E,#2D2D30,#007ACC,#FFFFFF,#3E3E42,#FFFFFF,#4EC9B0,#CE9178,#2D2D30,#D4D4D4
```

**Light Theme (default):**
```
#FFFFFF,#FFFFFF,#3F46AD,#FFFFFF,#350D36,#FFFFFF,#1264A3,#CD2553,#FFFFFF,#1D1C1D
```

### Messages & Media

**Preferences → Messages & media:**

✅ Theme: **Dark** (or match system)  
✅ Emoji skin tone: **Your preference**  
✅ Inline media: **Show images and files**  
✅ Automatically start video: **Disabled** (save bandwidth)

### Advanced

**Preferences → Advanced:**

✅ Input options: 
   - **Enter to send** OR **Ctrl+Enter to send** (your choice)
   
✅ Other options:
   - Format messages with markup: **Enabled**
   - When writing a message: **Show formatting**

## 💡 Productivity Tips

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Cmd + K` | Quick switcher (jump to any conversation) |
| `Cmd + Shift + A` | View all unreads |
| `Cmd + Shift + T` | View threads |
| `Cmd + .` | Toggle right sidebar |
| `Cmd + /` | View keyboard shortcuts |
| `Cmd + F` | Search current conversation |
| `Opt + ↑/↓` | Navigate channels |
| `Cmd + [` / `Cmd + ]` | Navigate history |
| `/remind` | Set reminders |
| `/dnd` | Set Do Not Disturb |

### Slash Commands

Useful for data scientists:

```
/remind [@someone or #channel or me] [what] [when]
/dnd for 2 hours
/status [emoji] [status message]
/mute [#channel]
/code or /pre    # Format as code block
```

**Create code snippets:**
1. Click the "+" next to message box
2. Select **"Code or text snippet"**
3. Choose language (Python, SQL, etc.)
4. Paste your code

### Integrations

**Useful for data teams:**

**GitHub:**
- Get notifications for PRs, commits, issues
- `/github subscribe owner/repo`

**Google Drive:**
- Share and preview docs without leaving Slack
- `/drive connect`

**Zoom:**
- Start meetings directly from Slack
- `/zoom`

**Databricks (via webhooks):**
- Job notifications
- Cluster status updates

**Custom Webhooks:**
```python
# Send notifications from Python scripts
import requests

webhook_url = "https://hooks.slack.com/services/YOUR/WEBHOOK/URL"
message = {"text": "Model training completed! Accuracy: 95%"}
requests.post(webhook_url, json=message)
```

## 🔒 Security & Privacy

### Enable Two-Factor Authentication

1. Go to workspace settings
2. **Your Profile → More → Account settings**
3. Enable **Two-Factor Authentication**
4. Use an authenticator app (1Password, Authy, etc.)

### Workspace Security

**Best practices:**
- Don't share sensitive credentials in Slack
- Use threads for context (easier to search later)
- Archive old channels regularly
- Use private channels for sensitive discussions
- Enable session timeout

### File Security

**Preferences → Privacy:**
- Review file sharing settings
- Be careful with data files (CSV, parquet, models)
- Use external secure storage (Azure, S3) for large datasets

## 🎨 Custom Status

Set your status to indicate availability:

| Status | When to Use |
|--------|-------------|
| 🎯 In a meeting | During calls/meetings |
| 💻 Deep work | Focused coding time |
| 🍕 Lunch | Break time |
| 🏖️ Vacationing | Out of office |
| 🤖 Training models | Long-running tasks |
| 📊 Analyzing data | Data exploration |

Click your profile photo → **Set a status**

## 🔍 Search Tips

Slack's search is powerful for data science teams:

```
from:@username in:#channel-name has:link after:2024-01-01
```

**Search operators:**
- `from:@username` - Messages from specific person
- `in:#channel` - Within a channel
- `has:link` - Contains links
- `has:file` - Contains files
- `before:2024-11-01` - Before date
- `after:2024-11-01` - After date
- `"exact phrase"` - Exact match

## 📱 Mobile App

**Install on iOS/Android:**
- Same workspaces sync automatically
- Configure mobile-specific notification settings
- Enable biometric authentication

## 🐛 Troubleshooting

### High CPU Usage

```bash
# Quit Slack
killall Slack

# Clear cache
rm -rf ~/Library/Application\ Support/Slack/Cache/*
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/*

# Restart Slack
open -a Slack
```

### Notifications Not Working

1. **System Preferences → Notifications**
2. Find **Slack** in the list
3. Enable **Allow Notifications**
4. Check **Slack Preferences → Notifications**

### Can't Connect to Workspace

- Check internet connection
- Verify workspace URL
- Try signing out and back in
- Check Slack status: [status.slack.com](https://status.slack.com)

## 🔗 Related

- [Slack Keyboard Shortcuts](https://slack.com/help/articles/201374536)
- [Slack API Documentation](https://api.slack.com/)
- [Webhooks for Notifications](https://api.slack.com/messaging/webhooks)

## 💬 Tips for Data Science Teams

1. **Create channels by project** - e.g., `#proj-customer-churn`, `#proj-forecasting`
2. **Use naming conventions** - `#team-data-science`, `#alert-model-failures`
3. **Share code snippets** - Use code formatting for readability
4. **Document in threads** - Keep conversations organized
5. **Use reminders** - `/remind #channel to review model performance every Monday at 9am`
6. **Integrate with tools** - Connect GitHub, Databricks, MLflow via webhooks
7. **Create huddles** - Quick voice chats for debugging sessions
