Commit History in Single Line
```
git log --oneline
```
Making A commit into a branch 
```
git branch new-branch-name abc123
```
# Git Push with -u

- `git push -u origin branch_name` pushes the branch to the remote repository.
- `-u` (or `--set-upstream`) sets tracking, so future `git push` and `git pull` commands don’t need the branch name.
- `origin` refers to the remote repository.
- `branch_name` is the local branch you are pushing.
- After using `-u`, you can just run `git push` next time.
- Check tracking branches with `git branch -vv`.
## view local branches and their tracking information
```
git branch -vv
```

# **shallow cloning**
## Git Clone with Depth Option

## What is `--depth=1` in Git Clone?
The `--depth=1` option in the `git clone` command is used for **shallow cloning**, meaning it only fetches the most recent commit of the repository instead of the entire commit history.

## Why is `--depth=1` Used?
1. **Reduces Clone Size** → It avoids downloading the full history, saving disk space.
2. **Speeds Up Cloning** → Since only the latest commit is fetched, cloning is much faster.
3. **Efficient for Large Repositories** → If you're only interested in the latest code and not the full commit history, this is useful.

## Example
```bash
git clone --depth=1 https://github.com/htr-tech/zphisher.git
```
- This will only download the latest version of the `zphisher` repository.
- It **won’t include** old commits, branches, or history.

## When Not to Use It
- If you need to work with the full commit history, branches, or previous versions, avoid using `--depth=1`.
- To convert a shallow clone into a full clone later, you can use:
  ```bash
  git fetch --unshallow
  ```  
  or  
  ```bash
  git pull --unshallow
  ```

----------------------------------------------------------------------
# Why is Octocat in the GitHub Icon?

Octocat is GitHub’s mascot and branding icon. It represents GitHub’s playful and creative culture. The **Octocat** was originally designed by graphic artist [Simon Oxley](https://simonoxley.com/), who also created the original Twitter bird. 

## Why an Octocat?

1. **Unique Identity** – GitHub wanted a memorable and quirky mascot to represent their platform.
2. **Combination of "Octo" (Octopus) & "Cat"** – The Octocat has tentacles like an octopus but a cat’s face, symbolizing flexibility and curiosity.
3. **Open-Source Culture** – GitHub supports collaboration and creativity, which the Octocat embodies.

The Octocat has since become an iconic part of GitHub’s branding, appearing in stickers, merchandise, and Easter eggs across the platform.

-----------------------------------------------------------------------

## Fixing LazyGit Authentication Issue with GitHub CLI

If LazyGit is not recognizing your GitHub authentication, follow these steps to configure Git properly.

### **1. Check Current Credential Helper**

Run the following command to see if any credential helper is set:

```bash
git config --global credential.helper
```

If it returns nothing, proceed with the next steps.

### **2. Set Git to Use GitHub CLI for Authentication**

Run this command to configure Git to use `gh` as the credential helper:

```bash
git config --global credential.helper '!gh auth git-credential'
```

Then restart LazyGit and try again.

### **3. Alternative: Use Git Credential Store**

If the above method does not work, set Git to store credentials:

```bash
git config --global credential.helper store
```

Then, push or pull a repository. Git will prompt for your GitHub credentials, and they will be saved for future use.

### **4. Verify Remote URL Format**

Ensure your repository is using HTTPS instead of SSH:

```bash
git remote -v
```

If it shows SSH (`git@github.com:...`), switch it to HTTPS:

```bash
git remote set-url origin https://github.com/your-username/your-repo.git
```

Replace `your-username` and `your-repo` with your actual GitHub username and repository name.

### **5. Re-authenticate with GitHub CLI**

Try logging out and logging in again with `gh`:

```bash
gh auth logout
gh auth login
```

Then restart LazyGit and test again.

### **6. Run LazyGit in Debug Mode**

If issues persist, run LazyGit in debug mode to check for specific errors:

```bash
lazygit --debug
```

This will provide detailed logs for troubleshooting.

---

git reflog -> Recovering a Lost Commit

# Types of Git Clone

## 1. Full Clone (Default)

- Downloads the entire repository, including all branches, commits, tags, and history.
    
- **Command:**
    
    ```sh
    git clone <repository_url>
    ```
    
- **Example:**
    
    ```sh
    git clone https://github.com/vishnus1793/linux.git
    ```
    
- **Use case:** When you need the complete repository history for development.
    

---

## 2. Shallow Clone (`--depth <N>`)

- Downloads only the latest `N` commits instead of the full history.
    
- **Command:**
    
    ```sh
    git clone --depth <N> <repository_url>
    ```
    
- **Example (latest commit only):**
    
    ```sh
    git clone --depth 1 https://github.com/vishnus1793/linux.git
    ```
    
- **Use case:** When you need only the latest code and want to save time and storage.
    

---

## 3. Sparse Clone

- Clones the repository but downloads only specific folders or files instead of everything.
    
- **Commands:**
    
    ```sh
    git clone --no-checkout <repository_url>
    cd <repo_name>
    git sparse-checkout init
    git sparse-checkout set <folder_name>
    git checkout <branch>
    ```
    
- **Example:**
    
    ```sh
    git clone --no-checkout https://github.com/vishnus1793/linux.git
    cd linux
    git sparse-checkout init
    git sparse-checkout set drivers/net
    git checkout master
    ```
    
- **Use case:** When working with large repositories but need only a subset of files.
    

---

## 4. Mirror Clone (`--mirror`)

- Creates a **bare** clone (without a working directory) but also includes remote-tracking branches, tags, and refs.
    
- **Command:**
    
    ```sh
    git clone --mirror <repository_url>
    ```
    
- **Example:**
    
    ```sh
    git clone --mirror https://github.com/vishnus1793/linux.git
    ```
    
- **Use case:** For **repository backups** or mirroring to another remote server.
    

---

## 5. Bare Clone (`--bare`)

- Clones only the Git database (no working directory, no checked-out files).
    
- **Command:**
    
    ```sh
    git clone --bare <repository_url>
    ```
    
- **Example:**
    
    ```sh
    git clone --bare https://github.com/vishnus1793/linux.git
    ```
    
- **Use case:** Useful for **Git servers** or when setting up a remote repository.
    

---

## 6. Single Branch Clone (`--branch <branch_name> --single-branch`)

- Clones only a specific branch without fetching others.
    
- **Command:**
    
    ```sh
    git clone --branch <branch_name> --single-branch <repository_url>
    ```
    
- **Example:**
    
    ```sh
    git clone --branch dev --single-branch https://github.com/vishnus1793/linux.git
    ```
    
- **Use case:** When working on a specific branch and don't need the rest.
    

---

## 7. Partial Clone (`--filter=blob:none`)

- Fetches only the repository structure without all file contents immediately. Files are downloaded **on-demand** when accessed.
    
- **Command:**
    
    ```sh
    git clone --filter=blob:none <repository_url>
    ```
    
- **Example:**
    
    ```sh
    git clone --filter=blob:none https://github.com/vishnus1793/linux.git
    ```
    
- **Use case:** Ideal for large repositories where you want to download files as needed.
    

---

Each type serves a different purpose. Choose the one that best fits your needs! 🚀