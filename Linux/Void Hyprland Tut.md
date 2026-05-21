```sh
# Step 1: Add the Hyprland repository using nano
sudo nano /etc/xbps.d/hyprland-void.conf
# Add the following line and save the file:
# repository=https://raw.githubusercontent.com/Makrennel/hyprland-void/repository-x86_64-glibc

# Step 2: Update package list
sudo xbps-install -S

# Step 3: Install Hyprland
sudo xbps-install -S hyprland

# Step 4: Install dependencies (recommended)
sudo xbps-install -S xwayland wlroots grim slurp waybar

# Step 5: Start Hyprland
Hyprland
```
