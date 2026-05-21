# Inter-Process Communication (IPC) in Android and iPhone (iOS)

## 1. Android: Binder IPC  
- **Primary IPC Mechanism**: **Binder**  
- Android uses **Binder IPC**, a lightweight, high-performance IPC mechanism based on **Linux’s ioctl** system call.  

### Why Binder?  
- Designed for efficiency in mobile devices  
- Uses **object references** instead of raw memory sharing  
- Provides security via **UID-based permissions**  
- Supports **remote procedure calls (RPC)** between apps and system services  

### Other IPC Mechanisms in Android:  
- **Unix Domain Sockets** – Used for low-level communication  
- **Shared Memory (ashmem)** – Used for high-speed data exchange  
- **Intent System** – Used for messaging between apps  
- **Messenger & AIDL (Android Interface Definition Language)** – Used for structured IPC between services  

---

## 2. iPhone (iOS): XPC and Mach IPC  
- **Primary IPC Mechanism**: **Mach Ports (Mach IPC)**  
- iOS is based on **XNU (Darwin Kernel)**, which uses **Mach IPC** for inter-process communication.  

### Why Mach IPC?  
- **Message-passing model** – Uses **Mach ports** instead of traditional shared memory  
- Supports **cross-process communication** via a kernel-managed messaging system  
- Provides **security** through sandboxing  

### Other IPC Mechanisms in iOS:  
- **XPC (Cross-Process Communication)** – High-level API built on **Mach IPC** for secure, structured communication  
- **NSDistributedNotificationCenter** – Used for app notifications across processes  
- **Shared Memory & POSIX IPC (Semaphores, Message Queues)** – Used for low-level data exchange  
- **Darwin Notifications** – Lightweight, system-wide event broadcasting  

---

## Summary  

| Feature  | Android | iPhone (iOS) |
|----------|---------|-------------|
| **Main IPC** | Binder IPC | Mach IPC |
| **Secondary IPC** | Unix Sockets, AIDL, Shared Memory | XPC, Darwin Notifications |
| **Security Model** | UID-based permissions | Sandboxing via Mach Ports |

Both Android and iOS use **kernel-level IPC** but differ in implementation—Android uses **Binder**, while iOS relies on **Mach IPC and XPC**.
