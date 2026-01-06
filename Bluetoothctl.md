# Arch Linux Bluetooth Audio & Speaker Switching Guide
_(PipeWire + WirePlumber)_

This document is a **complete reference** for fixing, using, and switching
audio between **Bluetooth devices** and **Laptop speakers** on Arch Linux.

---

## 0. Audio Stack Assumption

This guide assumes:
- PipeWire
- pipewire-pulse
- WirePlumber
- BlueZ

Verify:
```
pactl info | grep "Server Name"
```

## 1. Required Packages

Install once (safe if already installed):

`sudo pacman -S --needed pipewire pipewire-pulse pipewire-alsa wireplumber bluez bluez-utils pavucontrol`

Enable services:

`sudo systemctl enable --now bluetooth systemctl --user enable --now pipewire pipewire-pulse wireplumber`

Restart audio stack:

`systemctl --user restart pipewire pipewire-pulse wireplumber`

---

## 2. Verify Bluetooth Controller

`bluetoothctl show`

Must show:

`Powered: yes`

---

## 3. Check Audio Cards (MOST IMPORTANT)

`pactl list cards short`

### Expected

`alsa_card.... alsa_card.... bluez_card.XX_XX_XX_XX_XX_XX`

❌ If `bluez_card` is missing → Bluetooth audio is NOT integrated  
✅ If present → Bluetooth audio is ready

---

## 4. List Audio Output Sinks

`pactl list short sinks`

Example:

`alsa_output....Speaker__sink bluez_output.53:58:CA:1D:DC:35`

`SUSPENDED` is NORMAL when idle.

---

## 5. Switch TO Bluetooth Audio

### 5.1 Set Bluetooth Profile (A2DP)

`pactl set-card-profile bluez_card.53_58_CA_1D_DC_35 a2dp-sink`

### 5.2 Set Bluetooth as Default Output

`pactl set-default-sink bluez_output.53:58:CA:1D:DC:35`

Verify:

`pactl info | grep "Default Sink"`

---

### 5.3 Move Currently Playing Audio (IMPORTANT)

If audio is already playing:

`pactl list short sink-inputs`

Then:

`pactl move-sink-input <ID> bluez_output.53:58:CA:1D:DC:35`

Bluetooth sink will change:

`SUSPENDED → RUNNING`

---

## 6. Switch BACK to Laptop Speakers

### 6.1 Set Speaker as Default Sink

`pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink`

### 6.2 Move Active Audio

`pactl list short sink-inputs pactl move-sink-input <ID> alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink`

---

## 7. GUI Method (RECOMMENDED)

`pavucontrol`

### Use these tabs:

- **Output Devices** → choose Bluetooth or Speaker
    
- **Playback** → route apps manually
    
- **Configuration** → Bluetooth profile = A2DP
    

PipeWire remembers selections.

---

## 8. PipeWire Native Tool (Quick Switch)

List devices:

`wpctl status`

Set Bluetooth default:

`wpctl set-default <bluetooth-id>`

Set Speaker default:

`wpctl set-default <speaker-id>`

---

## 9. If Bluetooth Connects but NO Audio

### Check:

`pactl list cards short`

If `bluez_card` missing:

`ls /usr/lib/pipewire-0.3/ | grep bluez`

Fix by reinstalling:

`sudo pacman -S pipewire wireplumber bluez systemctl --user restart pipewire wireplumber`

Reconnect device:

`bluetoothctl disconnect <MAC> connect <MAC>`

---

## 10. Common Truths (Important)

- `SUSPENDED` ≠ broken
    
- Bluetooth connected ≠ audio routed
    
- Audio must be **moved** if already playing
    
- A2DP = music quality
    
- HSP/HFP = call quality (avoid for music)
    

---

## 11. One-Line Emergency Fixes

Force Bluetooth:

`wpctl set-default $(wpctl status | grep bluez | awk '{print $1}')`

Restart audio:

`systemctl --user restart pipewire pipewire-pulse wireplumber`

---

## 12. Stable Final State Checklist

- `bluez_card` visible
    

- `bluez_output` visible
    

- Default sink correct
    

- A2DP profile active
    

---

