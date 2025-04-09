# 🧠 Operating Systems — Pure Wisdom

## 💻 What is an Operating System?

An Operating System (OS) is system software that:
- Manages **hardware resources**
- Provides an **environment** for application execution
- Enables **user interaction** with the system

---

## 🔧 Core Components

### Kernel
- The heart of the OS
- Executes in **privileged mode**
- **Types**:
  - **Monolithic**: All services in kernel space (e.g., Linux)
  - **Microkernel**: Minimal kernel, rest in user space (e.g., Minix)
  - **Hybrid**: Combination (e.g., Windows, macOS)

### User Space vs Kernel Space
- **User Space**: Where applications run
- **Kernel Space**: Core OS operations

---

## 🧠 Process Management

### Process
- Instance of a program in execution
- Attributes: PID, registers, memory, open files

### Thread
- Lightweight process
- Shares memory space with parent process

### Context Switching
- Saves and restores process state during scheduling

### Scheduling Algorithms
- **FCFS** (First Come First Serve)
- **SJF** (Shortest Job First)
- **RR** (Round Robin)
- **MLFQ** (Multi-Level Feedback Queue)
- **Priority Scheduling**

### Process States
- New → Ready → Running → Waiting → Terminated

---

## 🧱 Memory Management

### Virtual Memory
- Allows processes to use more memory than physically available
- Uses **paging**, **segmentation**

### Paging
- Divides memory into fixed-size pages
- Uses **Page Table** and **TLB (Translation Lookaside Buffer)**

### Segmentation
- Divides memory logically into segments (code, data, stack)

### Swapping
- Moves inactive processes to disk (swap space)

---

## 📁 File Systems

### File System
- Manages creation, deletion, reading, writing of files
- Key structures: **Files**, **Directories**, **Inodes (Linux)**, **FAT (Windows)**

### Mounting
- Attaching a file system to a directory tree

### File Access Methods
- Sequential
- Direct
- Indexed

---

## 🔐 Security & Protection

### Access Control
- Users, groups, permissions (rwx)
- ACLs, SELinux, AppArmor

### Authentication
- Methods: Passwords, Tokens, Biometrics

### Protection Rings
- Ring 0 (Kernel) to Ring 3 (User)

---

## 💽 Storage Management

### Disk Scheduling Algorithms
- FCFS
- SSTF (Shortest Seek Time First)
- SCAN
- LOOK
- C-SCAN

### RAID Levels
- RAID 0: Striping
- RAID 1: Mirroring
- RAID 5: Parity-based redundancy

---

## 🔄 I/O Management

### I/O Devices
- Handled by **Device Drivers**

### I/O Techniques
- **Programmed I/O**
- **Interrupt-Driven I/O**
- **DMA (Direct Memory Access)**

---

## 🌐 Networking

### Sockets
- Endpoints for inter-system communication
- Types: TCP, UDP, UNIX domain

### IPC (Inter-Process Communication)
- Shared Memory
- Message Passing
- Pipes, FIFOs, Sockets
- Signals, Semaphores, Message Queues

---

## ⏱️ Synchronization & Concurrency

### Race Condition
- Occurs when multiple processes access shared data concurrently

### Critical Section
- Portion of code accessing shared resources

### Mutex vs Semaphore
- **Mutex**: Binary lock with ownership
- **Semaphore**: Counting lock without ownership

### Deadlock Conditions
- Mutual Exclusion
- Hold & Wait
- No Preemption
- Circular Wait

### Deadlock Handling
- **Prevention**
- **Avoidance** (e.g., Banker’s Algorithm)
- **Detection and Recovery**

---

## ⚙️ System Calls

### System Calls
- Interface between user programs and OS
- Categories:
  - Process Control
  - File Management
  - Device Management
  - Information Maintenance
  - Communication

---

## 💥 Boot Process

### Booting Steps
1. BIOS/UEFI
2. Bootloader (e.g., GRUB)
3. Kernel
4. `init` or `systemd`
5. Userland

---

## 🧪 OS Types

### Types of Operating Systems
- **Batch OS**
- **Time-Sharing OS**
- **Real-Time OS**
- **Distributed OS**
- **Embedded OS**
- **Mobile OS**

---

## 🏗️ System Architecture

### Layered Architecture
- Layers build on top of lower-level services

### Virtual Machines
- Emulate entire OS on host machine

---

## 🔍 Monitoring Tools

### Linux Tools
- `top`, `htop`, `vmstat`, `lsof`, `iotop`, `ps`, `netstat`, `strace`

### Windows Tools
- Task Manager
- Resource Monitor
- Event Viewer
- Sysinternals Suite

---

## 📈 Performance Metrics

- CPU Utilization
- Throughput
- Turnaround Time
- Waiting Time
- Response Time

---

## 🧰 Advanced Concepts

### Cgroups & Namespaces
- Basis for containers (e.g., Docker, LXC)

### Systemd
- Modern Linux init system managing services

### Signals
- Asynchronous notifications (e.g., `SIGINT`, `SIGKILL`, `SIGTERM`)

---

## 🖥️ Examples of Operating Systems

- **Linux**: Open-source, Unix-like
- **Windows**: Proprietary, GUI-heavy
- **macOS**: Unix-based, Apple-specific
- **Android**: Linux kernel-based mobile OS
- **FreeRTOS**, **VxWorks**: Real-time embedded OSes

---
