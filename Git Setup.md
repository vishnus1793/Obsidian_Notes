# Set Git Username
git config --global user.name "vishnus1793"

# Set Git Email
git config --global user.email "vishnusakthi.44@gmail.com"

# Authenticate with GitHub
# Install GitHub CLI on Void Linux
sudo xbps-install -S github-cli

# Login to GitHub
gh auth login

# Verify Configuration
git config --global --list
