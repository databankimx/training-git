# 3. Summary: Your First Repository

You can make a repository, confirm that its `.git` folder is there, and read its status. A repository is a folder that Git is keeping a history for, and the status tells you what Git sees in it. That's the starting point for every other chapter.

## What you learned

- `git init -q -b main` makes a repository in the folder you're in, quietly, with `main` as the first branch.
- Git keeps its records in a hidden `.git` folder, which you use through commands and not by hand.
- `Test-Path ".git"` confirms that a folder is a repository.
- `git status` reports what Git sees, and `git status --short` gives one line per file.
- An empty short status means the folder is clean.
- `??` marks an untracked file: Git sees it, but it isn't in any snapshot yet.
- `A `, ` M`, and `AM` mark files that are staged, modified, or both. The next chapters cover them.
- Running `git init` in an existing repository is harmless.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` in that folder, containing `# Practice notes`.
3. Print `Repository ready: ` followed by the result of `Test-Path ".git"`.
4. Print the short status with `Write-Output (git status --short)`.

The expected output is two lines: `Repository ready: True` and `?? README.md`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
You run git init in a folder that is already a repository. What happens?
○ The existing history is deleted, and the folder starts again.
→ That's the danger people fear, but Git doesn't do it. The history is kept.
◉ Git reports that it reinitialized the repository, and the history is left alone.
→ Right. Running it again is harmless, and it's a safe way to check whether a folder is tracked.
○ A second repository is created inside the first one.
→ Git doesn't nest repositories that way. It reports the existing one instead.
```

```quiz
The short status shows ?? next to a file. What does that mean?
◉ Git can see the file, but it isn't tracking it, so it's in no snapshot yet.
→ Right. Two question marks mark an untracked file, which becomes tracked when you add it.
○ The file is in the history, and it has no changes.
→ That's what a clean file looks like, and it isn't printed at all in the short form.
○ The file is ignored, and Git will never show it.
→ Ignored files are hidden from status. Chapter 6 covers that, and ?? is not the sign for it.
```

```quiz
Why does the exercise check the short status and not the long form?
○ The long form is wrong, and the short form is the only correct answer.
→ The long form is correct. It's just too long to compare, and its wording changes between versions.
○ The long form needs an internet connection to print, and the short form doesn't.
→ Neither form needs a connection. The short form is chosen for its steady output.
◉ The short form gives one line per file, and it looks the same on every version of Git.
→ Right. A check compares lines, so the short form is the one that stays steady.
```

---
