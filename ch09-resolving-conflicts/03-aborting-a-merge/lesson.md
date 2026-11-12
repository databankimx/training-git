# 3. Aborting a Merge

Sometimes a conflict shows that the merge shouldn't happen now. The branch needs more work first, the other side has to be discussed, or the change belongs in a different branch. `git merge --abort` takes you back to the state before the merge started, as if it had never begun. It's the safe way out of a conflicted merge, and it's the one to reach for when you're unsure.

## Backing out

Abort is only available while a merge is in progress, which is the state a conflict leaves behind. It puts every file back, and it clears the merge's record, so the branch is as it was before you ran the merge.

~~~powershell
git merge --abort
Get-Content -Path "C:\Development\git-practice\README.md"
~~~

~~~text
Output:

# Notes from main
~~~

The file reads as it did on `main` before the merge, without markers. The branch you started from is the same, and the other branch hasn't changed either.

## What abort throws away

Abort discards the merge, and that includes any edits you made to the conflicted files while you were resolving them. Those edits are lost, because the merge is undone and the files are restored to the branch's own versions.

Before aborting, decide whether you've done work you want to keep. If you have, copy the file somewhere else first, then abort, then decide what to do with the copy.

> **Aside: abort is not reset.**
> `git merge --abort` only undoes a merge in progress. It doesn't touch commits that were already made, and it doesn't rewrite history. That's a different job from the reset command, which the undoing chapter warned about. If you're unsure which one applies, stop and read `git status` before you run anything.

## Try it

This exercise sets up the conflicting merge, aborts it, and prints the file. The check compares the line, and then a clean status.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, set `README.md` to `# Notes from the branch`, stage it, and commit it quietly with `Change heading on notes`.
4. Switch back to `main`, set `README.md` to `# Notes from main`, stage it, and commit it quietly with `Change heading on main`.
5. Merge with `git merge --no-edit notes *> $null`, then abort it with `git merge --abort`.
6. Print the file with `Get-Content`, then print `Status: clean` using an `if` line with `-not (git status --short)`.

The expected output is two lines: `# Notes from main` and `Status: clean`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Running `git merge --abort` when no merge is in progress. Git reports that there's no merge to abort, and nothing changes. Check `git status` first if you're unsure whether a merge is still open.

---
