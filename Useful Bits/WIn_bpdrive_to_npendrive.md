
# 🧹 Convert Bootable USB Drive to Normal Storage using CMD (Windows)

> ⚠️ **Warning**: This process will **erase all data** on the USB drive. Make sure to back up any important files before proceeding.

---

## ✅ Steps to Clean and Format the USB Drive Using Command Prompt

### 1. Open CMD as Administrator
- Press `Win + S`, type `cmd`
- Right-click **Command Prompt** → click **Run as administrator**

### 2. Launch DiskPart
```cmd
diskpart
```

### 3. List all Disks
```cmd
list disk
```
> Identify your USB drive by its size (e.g., 14 GB = Disk 1)

### 4. Select the USB Drive
```cmd
select disk X
```
Replace `X` with the disk number of your USB drive.

### 5. Clean the Drive
```cmd
clean
```

### 6. Create a Primary Partition
```cmd
create partition primary
```

### 7. Select the New Partition
```cmd
select partition 1
```

### 8. Format the Drive

#### ✅ If your drive is **less than or equal to 32 GB**, format with FAT32:
```cmd
format fs=fat32 quick
```

#### ❌ If you get this error:
```
Virtual Disk Service error:
The volume size is too big.
```

It means your drive is **larger than 32 GB**, and Windows does not support formatting FAT32 for volumes >32 GB using DiskPart.

---

## 🛠 Workarounds

### 🔁 Format as exFAT (Recommended for cross-platform support)
```cmd
format fs=exfat quick
```

### 🔁 Or format as NTFS
```cmd
format fs=ntfs quick
```

---

## ✅ Finish Setup

### 9. Assign a Drive Letter
```cmd
assign
```

### 10. Exit DiskPart
```cmd
exit
```

---

## 🧩 Optional: Format Large Drives as FAT32

If you **must use FAT32** on a large drive (>32 GB), use a third-party tool like:

- [Rufus](https://rufus.ie/)
- [GUIFormat (FAT32 Format)](https://www.ridgecrop.demon.co.uk/index.htm?guiformat.htm)

---

### 🥳 Your USB drive is now cleaned and ready for normal use!

Let me know if you'd like a script or `.bat` file to automate this.
