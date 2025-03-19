# Linux: The Essentials

## Kernel
- Linux is a monolithic, Unix-like kernel that manages hardware, processes, memory, and file systems.

## Distributions
Distros = Kernel + Userland (tools, libraries, package manager). Examples:
- **Debian-based**: Ubuntu, Kali, Parrot OS  
- **RHEL-based**: Fedora, CentOS, Rocky Linux  
- **Arch-based**: Manjaro, Garuda  
- **Others**: Gentoo, Alpine  

## File System Hierarchy
- `/` (root) → everything starts here  
- `/home` → user files  
- `/etc` → system config  
- `/var` → logs, dynamic data  
- `/boot` → bootloader, kernel  
- `/proc` → kernel info (virtual)  

## Permissions
- `chmod` (change permissions)  
- `chown` (change owner)  
- `ls -l` (view permissions)  
- User types: Owner (u), Group (g), Others (o)  

## Users & Groups
- `adduser <name>` / `useradd <name>`  
- `usermod -aG <group> <user>` (add user to group)  
- `passwd <user>` (set password)  

## Processes & Jobs
- `ps aux` (list processes)  
- `kill -9 <PID>` (force kill)  
- `top`, `htop` (monitoring)  
- `fg`, `bg`, `nohup`, `jobs` (job control)  

## Networking
- `ifconfig` / `ip a` (check IP)  
- `ping <host>` (check connectivity)  
- `netstat -tulnp` / `ss -tulnp` (list open ports)  
- `iptables` / `ufw` / `firewalld` (firewall control)  

## Package Management
- **Debian-based**: `apt`, `dpkg`  
- **RHEL-based**: `yum`, `dnf`, `rpm`  
- **Arch-based**: `pacman`, `yay`  
- **Universal**: `snap`, `flatpak`, `AppImage`  

## Init Systems
- [**systemd**](https://github.com/vishnus1793/Obsidian_Notes/blob/main/Systemd.md) (`systemctl status <service>`)
- **SysVinit** (`service <name> start`)  
- **OpenRC** (used in Alpine, Gentoo)  

## Scripting & Automation
- Bash scripting: `#!/bin/bash`  
- `cron` (scheduled tasks)  
- `sed`, `awk`, `grep`, `cut`, `find`, `xargs` (text processing)  

---

# Parrot OS: The Hacker’s Distro

## Overview
- **Based on Debian**: Uses APT for package management.
- **Security-Oriented**: Comes with tools for penetration testing, digital forensics, reverse engineering, cryptography, and anonymity.

## Parrot Editions
- **Home**: Lightweight, privacy-focused, general-purpose use.
- **Security**: Full pentesting suite (like Kali).
- **Cloud**: Headless version for remote pentesting.

## Key Tools
- **Penetration Testing**: Metasploit, SQLmap, Aircrack-ng, Nmap, Zphisher  
- **Digital Forensics**: Autopsy, Volatility, Binwalk  
- **Anonymity & Privacy**: Tor, ProxyChains, Anonsurf  
- **OSINT (Open-Source Intelligence)**: TheHarvester, Maltego  
- **Reverse Engineering**: Radare2, Ghidra  
- **Cryptography**: Hashcat, John the Ripper  

## Security Features
- **AppArmor** (security hardening)  
- **Firejail** (sandboxing applications)  
- **Tor & I2P** (anonymous browsing)  
- **Forensic Mode** (boot without touching the disk)  

## Virtualization & Compatibility
- Supports Docker, Podman, QEMU/KVM, VirtualBox, VMware  

---

Pure wisdom delivered.
