## Install Bluetooth Drivers in Kali Linux (Hyprland)

### **1. Install Bluetooth Packages**
Run the following command to install the required Bluetooth utilities and drivers:

```bash
sudo apt update && sudo apt install -y bluetooth bluez bluez-tools pulseaudio-module-bluetooth
```

### **2. Enable and Start Bluetooth Service**
Enable and start the **Bluetooth** service:

```bash
sudo systemctl enable --now bluetooth
```

Check the status to confirm it's running:

```bash
systemctl status bluetooth
```

### **3. Load the Bluetooth Kernel Module**
Ensure the **Bluetooth kernel module** is loaded:

```bash
sudo modprobe btusb
```

If you are using a **Broadcom** or **Realtek** Bluetooth adapter, install additional firmware:

```bash
sudo apt install firmware-realtek firmware-brcm80211
```

Then reboot:

```bash
sudo reboot
```

### **4. Scan and Connect Bluetooth Devices**
1. Start the Bluetooth CLI:
   ```bash
   bluetoothctl
   ```
2. Turn on Bluetooth:
   ```bash
   power on
   ```
3. Enable scanning:
   ```bash
   scan on
   ```
4. Once you find your device, pair it (replace `XX:XX:XX:XX:XX:XX` with your device's MAC address):
   ```bash
   pair XX:XX:XX:XX:XX:XX
   ```
5. Connect to the device:
   ```bash
   connect XX:XX:XX:XX:XX:XX
   ```

### **5. Fix Common Issues**
If you face issues:
- Restart the Bluetooth service:
  ```bash
  sudo systemctl restart bluetooth
  ```
- If using PipeWire (instead of PulseAudio), install its Bluetooth module:
  ```bash
  sudo apt install pipewire-audio-client-libraries
  ```

