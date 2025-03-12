# How to Terminate a TTY Terminal in Linux

## 1️⃣ Check Active TTY Sessions
To list all active TTY sessions, use:
```
who
```

## Force Kill TTY Using `fuser`
```
sudo fuser -k /dev/tty4
```
