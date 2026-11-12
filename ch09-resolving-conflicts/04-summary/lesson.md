# 4. Summary: Resolving Conflicts

You can recognize a conflict, read the markers Git writes into the file, and resolve it by choosing the text, staging the file, and committing the merge. You can also abort a merge that shouldn't happen. A conflict is a decision waiting to be made, and these steps are how it gets made.

## What you learned

- A conflict happens when two branches change the same lines differently, and Git can't choose between them.
- Git writes both versions into the file, between `<<<<<<<`, `=======`, and `>>>>>>>` markers.
- `HEAD` in a marker is the branch you were on, and the other name is the branch being merged.
- `UU` in the short status marks a file that still needs resolving.
- Resolving means writing the text you want and removing every marker.
- `git add` marks a conflict as resolved, and `git commit` finishes the merge.
- `git merge --abort` undoes a merge in progress, but it also discards edits made to the conflicted files.
- `*> $null` discards everything a command prints, which is useful when the file is the only output you want.
- The conflict is a question about the work, and the person who knows the work should answer it.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, set `README.md` to `# Notes from the branch`, stage it, and commit it quietly with `Change heading on notes`.
4. Switch back to `main`, set `README.md` to `# Notes from main`, stage it, and commit it quietly with `Change heading on main`.
5. Merge with `git merge --no-edit notes *> $null`.
6. Print the status in the conflict state with `Write-Output (git status --short)`.
7. Resolve the file by setting `README.md` to `# Notes from both`, stage it, and commit it quietly with `Resolve heading conflict`.
8. Print `Merged: ` followed by the subject of the newest commit, using `git log -1 --format=%s` inside `$(...)`.

The expected output is two lines: `UU README.md` and `Merged: Resolve heading conflict`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
You finish editing a conflicted file, but git status still lists it as UU. What is missing?
◉ git add on the file, which marks the conflict as resolved.
→ Right. Staging the file is how the conflict is recorded as settled, and then the merge can be finished.
○ A second edit, because the first one didn't save the file.
→ The edit is saved. What's missing is a step that tells Git the conflict is settled.
○ A restart of the terminal, because Git caches the status.
→ Git doesn't cache the status between commands. The missing step is staging.
```

```quiz
You started a merge, then decided it shouldn't happen yet. What is the safe way out?
○ git merge --abort, which undoes the merge in progress and restores the files.
→ Right. Abort returns the branch to its state before the merge began.
○ git reset --hard, which throws everything away and starts again.
→ That discards more than the merge, and it's the command the undoing chapter warned about.
○ Delete the conflicted file, so Git has nothing left to merge.
→ Deleting the file changes your work and doesn't end the merge. Abort is the way out.
```

```quiz
In a conflict marker, what does the HEAD label mean?
○ The most recent commit of the other branch, which is being merged in.
→ That's the section below the marker, labeled with the other branch's name.
○ The first line of the file, which Git always labels that way.
→ HEAD isn't about line numbers. It names the branch you were on.
◉ The branch you were on when the merge started, such as main.
→ Right. HEAD names the current branch in the marker, whatever that branch is called.
```

---
