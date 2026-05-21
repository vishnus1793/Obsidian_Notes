# Automating Package Installation After OS Change

Since you frequently switch OSes, you can automate package reinstallation by backing up installed packages and using a script to reinstall them in one command.

---

## **For Arch (Garuda) Linux (pacman)**

### **Backup installed packages:**

```bash
pacman -Qqe > pkglist.txt
```

- This saves all explicitly installed packages to `pkglist.txt`.
    

### **Restore on new OS:**

```bash
sudo pacman -S --needed - < pkglist.txt
```

- Installs all packages in `pkglist.txt`.
    

---

## **For AUR Packages (yay)**

### **Backup AUR packages:**

```bash
pacman -Qqm > aurlist.txt
```

### **Restore AUR packages:**

```bash
yay -S --needed - < aurlist.txt
```

---

## **For Debian-based OS (Ubuntu, Kali, etc.)**

### **Backup installed packages:**

```bash
dpkg --get-selections | awk '{print $1}' > pkglist.txt
```

### **Restore on new OS:**

```bash
xargs sudo apt install -y < pkglist.txt
```

---

## **For Fedora (dnf)**

### **Backup installed packages:**

```bash
rpm -qa --qf "%{NAME}\n" > pkglist.txt
```

### **Restore on new OS:**

```bash
sudo dnf install -y $(cat pkglist.txt)
```

---

## **Automating Everything with a Script**

Save this script as `install.sh`:

```bash
#!/bin/bash

if [ -f "/etc/arch-release" ]; then
    echo "Detected Arch-based system"
    sudo pacman -S --needed - < pkglist.txt
    yay -S --needed - < aurlist.txt
elif [ -f "/etc/debian_version" ]; then
    echo "Detected Debian-based system"
    xargs sudo apt install -y < pkglist.txt
elif [ -f "/etc/fedora-release" ]; then
    echo "Detected Fedora-based system"
    sudo dnf install -y $(cat pkglist.txt)
else
    echo "Unknown OS"
fi
```

### **Run it on a new OS:**

```bash
chmod +x install.sh
./install.sh
```

This will detect your OS and install all previously used packages automatically! 🚀