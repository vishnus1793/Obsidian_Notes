If Commit is typed incorrectly
```
git commit --amend -m "Corrected commit message"

```

Beeper Security Key
EsTv tcne aVMH RXSw cG2B WvWM dPwy 5uTn 6SQr 48Hc ci9Y j55Y



Software development typically follows these **stages of production**:

1. **Pre-Alpha** – Initial development with incomplete features, mostly internal testing.
2. **Alpha** – Basic functionality implemented; internal or limited external testing begins.
3. **Beta** – Feature-complete but with potential bugs; open or closed testing for users.
4. **Release Candidate (RC)** – Final version before official launch; mostly bug fixes.
5. **Stable / Production** – Official release for the public, fully tested and supported.
6. **Maintenance / Updates** – Regular patches, security updates, and feature improvements.

Beeper is currently in the **Beta** stage, meaning it is mostly functional but still being tested and improved before full public release. 🚀

## Appimage Manager
=="Gear Lever" is a free and open-source== tool designed to manage AppImages on Linux, simplifying their installation, organization, and integration with the system menu
https://github.com/mijorus/gearlever

https://tldr.inbrowser.app/pages/common/lsd used to learn about linux commands

https://github.com/yt-dlp/yt-dlp => Audio/Video Downloader

----------------------------
## Command to open files
[vishnu@Vishnu ~]$ nautilus
** Message: 22:08:04.874: Connecting to org.freedesktop.Tracker3.Miner.Files

----------
Command to Show command history

```
cat ~/.bash_history
```



```
upower -i $(upower -e | grep BAT) | grep --color=never -E "percentage"
```


## Set config for QuteBrowser
```
qutebrowser --config ~/.config/qutebrowser/config.py
```

## Removing the Last Commit in GitHub

### **1. Remove Last Commit Locally and Push the Change**
```bash
git reset --hard HEAD~1
git push origin --force
```
This completely removes the last commit from your local and remote repository.

---

### **2. Keep Changes but Remove Commit**
```bash
git reset --soft HEAD~1
git push origin --force
```
This removes the commit but keeps the changes in your working directory.

---

### **3. Revert the Last Commit (Recommended for Shared Repositories)**
```bash
git revert HEAD
git push origin
```
This creates a new commit that undoes the changes without rewriting history.

---

**Note:** Be cautious when using `git push --force`, especially in a shared repository, as it rewrites history and can affect others working on the same branch.

