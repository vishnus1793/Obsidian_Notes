# systemd - The Init System and Service Manager

## 1. Core Concepts

- **PID 1:** `systemd` is the first process (PID 1) started by the kernel.
- **Units:** Basic building blocks managed by `systemd`, defined as `.service`, `.socket`, `.target`, etc.
- **Cgroups:** Uses Linux control groups (cgroups) to manage processes.
- **Dependency Management:** Uses `Wants=`, `Requires=`, `After=`, `Before=` for service dependencies.

## 2. Unit Types

- **Service Units (`.service`)** – Manage system daemons.
- **Target Units (`.target`)** – Group units together (e.g., `multi-user.target`).
- **Socket Units (`.socket`)** – Activate services on-demand using sockets.
- **Timer Units (`.timer`)** – Replace `cron`, schedule tasks.
- **Mount Units (`.mount`)** – Automate mounting of filesystems.
- **Automount Units (`.automount`)** – Handle automatic mounting.
- **Path Units (`.path`)** – Monitor file changes.
- **Device Units (`.device`)** – Represent kernel-detected devices.
- **Swap Units (`.swap`)** – Manage swap space.

## 3. Essential Commands

### Service Management

```sh
systemctl start <service>      # Start a service
systemctl stop <service>       # Stop a service
systemctl restart <service>    # Restart a service
systemctl reload <service>     # Reload config without restart
systemctl status <service>     # Check service status
systemctl enable <service>     # Enable service on boot
systemctl disable <service>    # Disable service on boot
systemctl is-enabled <service> # Check if enabled
systemctl mask <service>       # Prevent service from starting
systemctl unmask <service>     # Remove mask
```

### System Management

```sh
systemctl reboot               # Reboot system
systemctl poweroff             # Power off system
systemctl suspend              # Suspend system
systemctl hibernate            # Hibernate system
systemctl default              # Load default target
systemctl isolate <target>      # Switch to target (like runlevel)
```

### Analyzing Boot

```sh
systemd-analyze blame          # Show startup time of services
systemd-analyze critical-chain # Show dependencies causing boot delays
systemctl list-jobs            # Show pending jobs
```

### Logging (journalctl)

```sh
journalctl -xe                 # Show logs for current boot
journalctl -u <service>         # Show logs for a service
journalctl --since "1 hour ago" # Logs since a specific time
journalctl -b -1                # Logs from previous boot
```

## 4. Unit File Structure (`.service` example)

```ini
[Unit]
Description=Example Service
After=network.target

[Service]
ExecStart=/usr/bin/example
Restart=always
User=nobody
Group=nogroup

[Install]
WantedBy=multi-user.target
```

- **[Unit]** – General service metadata.
- **[Service]** – How the service runs.
- **[Install]** – When the service starts.

## 5. Targets (Replacing Runlevels)

|**SysV Runlevel**|**systemd Target**|**Purpose**|
|---|---|---|
|0|`poweroff.target`|Shutdown|
|1|`rescue.target`|Single-user mode|
|3|`multi-user.target`|CLI, no GUI|
|5|`graphical.target`|GUI Mode|
|6|`reboot.target`|Reboot|

## 6. Debugging & Recovery

### Rescue Mode:

```sh
systemctl rescue
```

### Emergency Mode:

```sh
systemctl emergency
```

### Fix a Broken Boot:

- Add `systemd.unit=rescue.target` or `emergency.target` to kernel parameters.

## 7. Custom Service Example

### Create Service File:

```sh
sudo nano /etc/systemd/system/myapp.service
```

```ini
[Unit]
Description=My Custom App
After=network.target

[Service]
ExecStart=/usr/bin/myapp
Restart=always

[Install]
WantedBy=multi-user.target
```

### Enable & Start Service

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now myapp.service
```

## 8. systemd vs SysVinit

|Feature|systemd|SysVinit|
|---|---|---|
|Parallel Startup|✅|❌|
|Dependency Handling|✅|❌|
|Process Tracking|✅|❌|
|On-Demand Activation|✅|❌|
|Logs (`journalctl`)|✅|❌|

## 9. Disabling systemd (For Rebels)

- Use a different init system like **OpenRC** or **runit**, but this is **not recommended**.



