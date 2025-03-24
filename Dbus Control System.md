# D-Bus (Desktop Bus) - Knowledge Dump

## 1. Overview
D-Bus (Desktop Bus) is an IPC (Inter-Process Communication) system that allows multiple programs to communicate with each other asynchronously. It's widely used in Linux for system services, desktop environments, and application communication.

## 2. Architecture
- **D-Bus Daemon**: Central message broker that routes messages.
- **Buses**:
  - **System Bus**: Used for system-wide communication (e.g., hardware events, system services).
  - **Session Bus**: Used for user-level applications (e.g., GNOME, KDE).
  - **Direct Communication**: Apps can also communicate directly (peer-to-peer) without the daemon.
- **Services**: Processes that expose methods, signals, and properties over D-Bus.

## 3. Communication Model
- **Messages**: Four types
  - **Method Calls**: Request a function from another process.
  - **Method Returns**: Response to a method call.
  - **Signals**: Broadcast notifications.
  - **Errors**: Indicate issues.
- **Message Format**: Uses a binary protocol with structured data types.

## 4. Addressing and Names
- **Bus Names**:
  - **Well-Known Names**: Assigned by convention (e.g., `org.freedesktop.NetworkManager`).
  - **Unique Names**: Auto-assigned by D-Bus (e.g., `:1.23`).
- **Object Paths**: Identifies an object inside a service (e.g., `/org/freedesktop/NetworkManager`).
- **Interfaces**: Defines methods, signals, and properties (e.g., `org.freedesktop.DBus`).

## 5. Tools for D-Bus
- `dbus-send`: Send messages via CLI.
- `dbus-monitor`: Monitor messages on a bus.
- `gdbus`: Higher-level CLI tool for GNOME D-Bus interaction.
- `qdbus`: Qt-based tool for D-Bus debugging.
- `busctl`: Systemd’s D-Bus debugging tool.

## 6. Language Bindings
- C: `libdbus` (low-level), `GDBus` (GLib-based)
- Python: `dbus-python`
- JavaScript: `node-dbus`
- Go: `github.com/godbus/dbus`
- Rust: `zbus`

## 7. Security
- D-Bus uses **Policy Files** (`/etc/dbus-1/system.d/` or `~/.dbus/session-bus/`) to define access control.
- Mandatory Access Control (MAC) integrations with AppArmor, SELinux.

## 8. Practical Use Cases
- GNOME/KDE apps (e.g., `org.gnome.SettingsDaemon`)
- NetworkManager (`org.freedesktop.NetworkManager`)
- Systemd (`org.freedesktop.systemd1`)
- Hardware events (e.g., `org.freedesktop.UPower`)

## 9. Example Commands
### List Services
```sh
dbus-send --print-reply --dest=org.freedesktop.DBus / org.freedesktop.DBus.ListNames
```

### Monitor Bus Traffic
```sh
dbus-monitor --system
```

### Invoke a Method
```sh
dbus-send --session --dest=org.freedesktop.Notifications /org/freedesktop/Notifications org.freedesktop.Notifications.Notify string:"Hello"
```

# How D-Bus Controls the System

## 1. System Bus vs. Session Bus
- **System Bus**: Controls system-wide services (e.g., NetworkManager, UPower, Systemd).
- **Session Bus**: Manages per-user applications (e.g., GNOME, KDE).
- **Direct Peer-to-Peer Communication**: Applications can bypass the bus daemon when needed.

## 2. Key Services Controlled via D-Bus
| **Service** | **D-Bus Name** | **Controlled Features** |
|------------|--------------|-----------------|
| **Systemd** | `org.freedesktop.systemd1` | Start/stop services, reboot, power off |
| **NetworkManager** | `org.freedesktop.NetworkManager` | Enable/disable Wi-Fi, connect to networks |
| **UPower** | `org.freedesktop.UPower` | Monitor battery, suspend system |
| **Logind** | `org.freedesktop.login1` | User sessions, shutdown, suspend |
| **Polkit** | `org.freedesktop.PolicyKit1` | Authorization handling |
| **Bluetooth** | `org.freedesktop.bluetooth` | Scan, pair, connect devices |
| **Notifications** | `org.freedesktop.Notifications` | Send desktop notifications |

## 3. Controlling the System with D-Bus Commands
### Restart the System Using Systemd
```sh
busctl call org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager Reboot b true
```

### Suspend the System
```sh
dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.Suspend boolean:true
```

### Start a Systemd Service (e.g., SSH)
```sh
busctl call org.freedesktop.systemd1 /org/freedesktop/systemd1 org.freedesktop.systemd1.Manager StartUnit ssv "sshd.service" "replace"
```

### Toggle NetworkManager Wi-Fi
#### Enable Wi-Fi
```sh
dbus-send --system --print-reply --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.NetworkManager.Enable boolean:true
```
#### Disable Wi-Fi
```sh
dbus-send --system --print-reply --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.NetworkManager.Enable boolean:false
```

### Adjust Screen Brightness Using UPower
```sh
dbus-send --system --print-reply --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.SetBrightness uint32:50
```

### Send a Notification
```sh
dbus-send --session --dest=org.freedesktop.Notifications /org/freedesktop/Notifications org.freedesktop.Notifications.Notify string:"Test" uint32:0 string:"" string:"D-Bus Control" string:"System Controlled via D-Bus" array:string:"" array:dict:string:"" int32:5000
```

## 4. Security and Access Control
D-Bus enforces **access policies** via:
- **Polkit (PolicyKit)**: Grants/denies method execution based on user roles.
- **D-Bus Policy Files** (`/etc/dbus-1/system.d/` and `/usr/share/dbus-1/system.d/`):
  - Defines access rules for system services.
  - Example policy (restricting `Reboot`):
    ```xml
    <policy user="root">
      <allow send_destination="org.freedesktop.login1" />
    </policy>
    ```
- **SELinux/AppArmor Integration**: Provides additional restrictions.

## 5. D-Bus in System Boot & Initialization
- D-Bus itself is **started early in boot** (`dbus-daemon` for system services).
- Systemd services use `dbus.service` for dependency management.
- Many system services register on **D-Bus** as part of initialization.

## Final Thoughts
- D-Bus provides **fine-grained system control** while enforcing security policies.
- **Tools like `busctl`, `dbus-send`, and `dbus-monitor`** help interact and debug D-Bus messages.


