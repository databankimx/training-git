# 1. Reading a Conflict

The quickest way to understand a conflict is to make one. This step sets up two branches that change the same line, merges them, and reads what Git writes into the file. The merge fails, which is expected, and the file is left with both versions in it, waiting for you to choose.

## Two branches, one line

Start from a README that both branches will edit. Then give each branch its own version of the first line.

~~~powershell
Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git switch -c notes
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Notes from the branch"
git add README.md
git commit -q -m "Change heading on notes"
git switch main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Notes from main"
git add README.md
git commit -q -m "Change heading on main"
~~~

~~~text
Output:

(nothing)
~~~

Both branches have changed the first line since they split, and differently. Neither has the other's change, so the merge can't decide.

## The merge that stops

Merge the branch. Git tries, finds the conflict, and stops. The message it prints is long, and the exercise sends it away, because the file is what matters.

~~~powershell
git merge --no-edit notes *> $null
Get-Content -Path "C:\Development\git-practice\README.md"
~~~

~~~text
Output:

<<<<<<< HEAD
# Notes from main
=======
# Notes from the branch
>>>>>>> notes
~~~

Both versions are in the file, between the markers, and the merge is waiting for you. The `*> $null` discards everything the merge printed, so the file is the only output. Read the markers from the top: the `HEAD` section is `main`, the middle line divides the two, and the `notes` section is the branch.

> **Aside: the merge message you'll never need.**
> A conflicted merge prints a message that names the conflicted file and says the automatic merge failed. It's accurate, and `git status` says the same thing more usefully. Read the file, then the status, and you won't need the message.

## Try it

This exercise sets up the two branches, merges them, and prints the conflicted file. The check compares the four lines of the file.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, set `README.md` to `# Notes from the branch`, stage it, and commit it quietly with `Change heading on notes`.
4. Switch back to `main`, set `README.md` to `# Notes from main`, stage it, and commit it quietly with `Change heading on main`.
5. Merge with `git merge --no-edit notes *> $null`, so the merge's own output is discarded.
6. Print the file with `Get-Content -Path "C:\Development\git-practice\README.md"`.

The expected output is the file's five lines: `<<<<<<< HEAD`, `# Notes from main`, `=======`, `# Notes from the branch`, and `>>>>>>> notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Writing `git merge --no-edit notes` without `*> $null`. The merge prints its conflict message, and that message appears in the output above the file, so the lines no longer match. Discard it as the exercise does.

---
