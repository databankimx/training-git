# 2. Unstaging a Change

Staging is a choice about what goes into the next commit, and choices get revised. You stage a change, then notice that it belongs in a different commit, or that you want to think about it longer. `git restore --staged` moves the change back out of the staging area, and it keeps the change in the working folder. Nothing is discarded.

## The change in the staging area

Here's an edit that's been staged, so the next commit would include it.

~~~powershell
git add README.md
git status --short
~~~

~~~text
Output:

M  README.md
~~~

The `M` in the first column means the change is staged. The blank second column means nothing more has changed since it was staged.

## Moving it back out

`git restore --staged` takes a file out of the staging area, and leaves its change in the working folder.

~~~powershell
git restore --staged README.md
git status --short
~~~

~~~text
Output:

 M README.md
~~~

The `M` has moved to the second column. A space in the first column and an `M` in the second means the change is in the working folder and isn't staged. The text of the file hasn't moved, and the change is still there to be edited, restaged, or discarded.

## Why this is the safe undo

Unstaging can't lose work, because it changes only what the next commit will include. The change still exists in the working folder, so you can read it with `git diff`, edit it, or stage a different part of it.

That makes it the first undo to reach for when a staging choice was wrong. Discarding is the one to hold back, as the last step showed.

> **Aside: the first column and the second.**
> The short status has two columns, one for the staging area and one for the working folder. `M ` means staged and unchanged since. ` M` means unstaged and changed. `MM` means changed, staged, and changed again. Reading the columns separately tells you where the change is, which is more useful than remembering each combined mark.

## Try it

This exercise commits a README, stages an edit, unstages it, and prints the short status. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Add the line `Second section` to `README.md` with `Add-Content`, then stage it with `git add README.md`.
4. Unstage it with `git restore --staged README.md`.
5. Print the short status with `Write-Output (git status --short)`.

The expected output is ` M README.md`. The space at the start is part of the answer, so keep it.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Using `git restore README.md` without `--staged`. That discards the change from the working folder, which is the permanent undo, and the status is then empty. To unstage, the `--staged` switch is what keeps the change.

---
