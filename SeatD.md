# Multi-User Access in Linux Without `seatd`

## 1. What is `seatd`?
- `seatd` is a **seat management daemon** used for handling multi-seat setups.
- It assigns input/output devices dynamically to different users.
- It is commonly used in **Wayland compositors** and multi-seat configurations.

## 2. Does Linux Support Multiple Users Without `seatd`?
- **Yes, Linux is a multi-user OS by default.**  
- `seatd` is only required for **multi-seat (separate desktops per user with distinct input devices).**  
- **Without `seatd`, you can still have multiple users** but without automated seat management.

## 3. Methods to Access Multiple Users Without `seatd`
### **A. TTY (Virtual Terminals)**
- Use **`Ctrl + Alt + F1` to `F6`** to switch between different user logins.
- Each user gets a separate CLI session.

### **B. Graphical Login Managers (GDM, LightDM, SDDM)**
- Supports **multiple graphical user sessions** without `seatd`.
- Users can log out and switch accounts from the login screen.

### **C. SSH (Remote Login)**
- Multiple users can log in remotely using:
```
  ssh username@server-ip
```
