# **Mastering PTY Terminals Like an Expert**

## **Step 1: Understand PTY and How It Works**
- Learn what a **pseudoterminal (PTY)** is and how it differs from a **TTY**.
- Understand how **master-slave pairs** work (`/dev/pts/*`).
- Study the behavior of **interactive shells** inside a PTY.

---

## **Step 2: Master Essential Commands**
### **Process Management:**
```bash
ps aux | grep pts   # Check active PTY sessions
who                 # See logged-in users and their terminals
tty                 # Identify your current terminal
w                   # See who is using PTY
```

### **Session Multiplexing:**
```bash
tmux   # Advanced session management
screen # Alternative to tmux
nohup command &  # Keep processes running after logout
disown -h        # Detach process from shell
setsid command   # Run commands independently of a terminal
```

### **File and Device Handling:**
```bash
ls -l /dev/pts       # List active PTY devices
lsof | grep pts      # See processes using PTYs
```

---

## **Step 3: Automate PTY Interactions**
- Use `script` to log terminal sessions:
  ```bash
  script -a session.log
  ```
- Automate PTY-based programs with `expect`:
  ```tcl
  spawn ssh user@remote
  expect "password:"
  send "yourpassword\r"
  interact
  ```
- Manipulate PTYs in Python using `pty` module:
  ```python
  import pty
  pty.spawn("/bin/bash")
  ```

---

## **Step 4: Gain Advanced Control**
### **Hijacking Sessions (With Proper Permissions):**
```bash
cat /dev/pts/X  # Read output
echo "command" > /dev/pts/X  # Send input
```

- Use `reptyr` to move a running process to your PTY:
  ```bash
  reptyr <PID>
  ```

### **Reverse Shells & PTY Upgrades:**
- Convert a raw shell into a full PTY shell:
  ```bash
  python3 -c 'import pty; pty.spawn("/bin/bash")'
  ```
- Background a shell properly:
  ```bash
  # Press Ctrl+Z
  stty raw -echo
  fg
  ```

---

## **Step 5: Secure Your PTY Usage**
- Restrict PTY access with `chmod` and ACLs:
  ```bash
  chmod 600 /dev/pts/X
  ```
- Monitor suspicious PTY activity:
  ```bash
  auditctl -w /dev/pts/ -p rwxa
  ```
- Prevent session hijacking with `mesg n`.

---

## **Final Notes**
- Keep practicing **scripting, process management, and PTY interactions**.
- Explore **SSH escape sequences** (`~.` to disconnect, `~C` for command mode).
- Experiment with **containerized PTY environments** in Docker.


[Physical TTY (/dev/tty1)] → [Xorg/Wayland] → [Alacritty (Terminal Emulator)] → [PTY (/dev/pts/1)] → [Shell (bash, zsh)]
