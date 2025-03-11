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
