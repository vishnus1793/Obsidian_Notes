## 📌 Config File Location
`~/.config/hypr/hyprland.conf`

---

## 1. 🧩 Basic Structure
Hyprland config uses **sections**:
```ini
section {
    key = value
}
```

Examples:
- `input { ... }` → Keyboard, mouse, touchpad  
- `general { ... }` → Gaps, borders, layouts  
- `decoration { ... }` → Borders, shadows, blur  
- `animations { ... }` → Window/transition animations  
- `bind` → Keybindings  

---

## 2. 🎹 Input Configuration
```ini
input {
    kb_layout = us                # Keyboard layout (us, de, in, etc.)
    kb_variant =                  # Variant (colemak, dvorak, etc.)
    kb_model = pc105              # Keyboard model
    kb_options = caps:swapescape  # Extra tweaks (XKB options)
    follow_mouse = 1              # Focus window when mouse enters
    touchpad {
        natural_scroll = true
        tap_to_click = true
    }
}
```

### 🔑 Common `kb_options`
- `caps:swapescape` → Swap CapsLock ↔ Escape  
- `caps:escape` → Make CapsLock = Escape  
- `ctrl:nocaps` → Make CapsLock = Ctrl  
- `altwin:swap_alt_win` → Swap Alt and Windows key  

---

## 3. 🎨 General Appearance
```ini
general {
    gaps_in = 5                     # Gaps between windows
    gaps_out = 20                   # Gaps between windows and screen edge
    border_size = 2
    col.active_border = rgb(ffcc00) # Border color for active window
    col.inactive_border = rgb(444444)
    layout = dwindle                # Default tiling layout (dwindle/master)
}
```

---

## 4. ✨ Window Decorations
```ini
decoration {
    rounding = 10           # Rounded corners
    blur = true
    blur_size = 6
    drop_shadow = true
    shadow_range = 20
    shadow_render_power = 3
}
```

---

## 5. 🌀 Animations
```ini
animations {
    enabled = yes
    bezier = myCurve, 0.05, 0.9, 0.1, 1.05   # Custom easing curve
    animation = windows, 1, 7, myCurve       # Window open/close
    animation = borders, 1, 10, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, myCurve
}
```

---

## 6. ⌨️ Keybindings
```ini
# Launch apps
bind = SUPER, Return, exec, alacritty
bind = SUPER, E, exec, thunar

# Close window
bind = SUPER, Q, killactive

# Change workspace
bind = SUPER, 1, workspace, 1
bind = SUPER, 2, workspace, 2
bind = SUPER, mouse_down, workspace, e+1
bind = SUPER, mouse_up, workspace, e-1
```

**Syntax:**
```
bind = MOD, KEY, action, arguments
```

- `exec` → Run a command  
- `killactive` → Close focused window  
- `workspace` → Switch workspace  
- `movetoworkspace` → Move window to workspace  

---

## 7. 🖱️ Mouse Bindings
```ini
bindm = SUPER, mouse:272, movewindow   # Drag window with left click
bindm = SUPER, mouse:273, resizewindow # Resize window with right click
```

---

## 8. 🖥️ Monitor Config
```ini
monitor=HDMI-A-1,1920x1080@60,0x0,1
```

Format:
```
monitor=name,resolution,position,scale
```

Example:  
- `1920x1080@60` → Resolution + refresh rate  
- `0x0` → Position relative to other monitors  
- `1` → Scale factor  

---

## 9. 🚀 Autostart Apps
```ini
exec-once = waybar &
exec-once = nm-applet &
exec-once = hyprpaper &
```

---

## 10. 🛠 Useful Commands
```bash
hyprctl reload          # Reload config
wev                     # Show key events (Wayland)
evtest                  # Show input events
```

---

# ✅ Next Steps
1. Play with **layouts** (`dwindle`, `master`).  
2. Customize **gaps, borders, and blur**.  
3. Add **workspace keybindings**.  
4. Experiment with **kb_options**.  
5. Create a **workflow** with animations + keybinds.  
