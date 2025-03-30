# Fixing `su: Authentication failure` in CachyOS (Arch-based)

If you are encountering an **"Authentication failure"** error when using `su` on CachyOS (an Arch-based system), the issue could be due to:

1. Incorrect root password.
    
2. The root account being disabled.
    
3. `su` restrictions on non-wheel users.
    

## Solutions

### 1. Use `sudo` Instead of `su`

Instead of `su`, try:

```bash
sudo -i
```

Or

```bash
sudo su
```

If `sudo` works, it means your user has sudo privileges, and the root account might be locked.

### 2. Reset Root Password (If Needed)

If `sudo` works but you need to reset the root password, run:

```bash
sudo passwd root
```

Then, enter a new password for the root account.

### 3. Unlock the Root Account

If the root account is locked, unlock it using:

```bash
sudo passwd -u root
```

### 4. Ensure `su` is Not Restricted

Some Arch-based distros restrict `su` for non-wheel users. To allow your user to use `su`, add yourself to the `wheel` group:

```bash
sudo usermod -aG wheel $USER
```

Then, restart your session for the changes to take effect.

## Additional Checks

- Ensure `pam` settings are not restricting `su` access.
    
- Check `/etc/pam.d/su` for any restrictions on `wheel` users.
    
- If `su` is still fail