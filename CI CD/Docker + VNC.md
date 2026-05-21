# Hosting an OS Online for Free Using Docker + VNC

## **Overview**
This guide will help you set up a lightweight Linux-based OS inside a **Docker container** and access it remotely using **VNC (Virtual Network Computing)**.

## **How It Works**
1. **Docker Container**: Runs a lightweight Linux OS (like Ubuntu, Debian, or Alpine).
2. **VNC Server**: Provides a graphical interface for remote access.
3. **NoVNC/Web-based Access**: Lets you interact with the OS via a browser.

---

## **1. Install Docker (If Not Installed)**
Run these commands on your **Fedora** machine:

```sh
sudo dnf update -y
sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo systemctl enable docker
```
For non-Fedora-based distros, use the respective package manager.

---

## **2. Pull a Docker Image with a Pre-installed Desktop**
Use a lightweight image like **`dorowu/ubuntu-desktop-lxde-vnc`**:

```sh
docker pull dorowu/ubuntu-desktop-lxde-vnc
```
This image contains:
- Ubuntu with LXDE (Lightweight X11 Desktop Environment)
- TigerVNC server for remote access
- NoVNC for web-based VNC access

---

## **3. Run the Container**
Start the container with VNC access:

```sh
docker run -d -p 5901:5901 -p 6080:6080 --name ubuntu-desktop dorowu/ubuntu-desktop-lxde-vnc
```
- `-p 5901:5901`: Maps VNC port for remote access.
- `-p 6080:6080`: Maps the NoVNC web interface.

---

## **4. Access the OS**
- **Via Web Browser (NoVNC)**:  
  Open **`http://localhost:6080`** in your browser.
- **Via VNC Client**:  
  Connect using a VNC client (e.g., TigerVNC) to **`localhost:5901`**.

---

## **Bonus: Host Online for Free**
If you want to **host it online**, you can use:
- **Cloudflare Tunnel**: Expose your local container securely.
- **Free VPS (like Oracle Cloud Free Tier)**: Run the container on a remote server.

