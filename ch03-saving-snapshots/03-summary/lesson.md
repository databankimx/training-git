# 3. Summary: Saving Snapshots

You can stage a file, commit it with a message, and read the history. A commit is a snapshot of the whole folder at one moment, and the message says why it was saved. Those are the building blocks of every other chapter, and the next chapters show you how to see what changed between them.

## What you learned

- A commit is a snapshot, saved in two steps: stage with `git add`, then commit with `git commit`.
- Staging lets you choose which changes go into a snapshot, so related changes can be saved together.
- `git add` marks a file `A` in the short status, meaning it's staged and waiting for the next commit.
- Naming the files you add is safer than `git add .`, which stages everything.
- `git commit -q -m "..."` makes a commit quietly, with a message from the command.
- A commit with nothing staged isn't made, and Git says so.
- A good message is a short instruction, such as `Add practice notes`, and it's the first thing a reader sees.
- `git log --format=%s` prints each commit's subject, newest first, without the changing hash.

## Try it

This exercise makes two commits in the practice repository, then prints the subjects. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it with `git add README.md`, and commit it quietly with the message `Add practice notes`.
3. Add the line `Second section` to `README.md` with `Add-Content`, stage the file again, and commit it quietly with the message `Add second section`.
4. Print the subjects with `Write-Output (git log --format=%s)`.

The expected output is two lines: `Add second section` and `Add practice notes`. The newest commit comes first.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
Why does Git have a separate staging step, instead of committing straight from the working folder?
○ Staging is only a formality, and Git would work the same without it.
→ Not quite. The staging step is how you choose what goes into a snapshot.
◉ So you can choose which changes belong together in one commit, and leave the rest for later.
→ Right. Staging lets you build a snapshot from only the changes you pick.
○ Staging copies the files to a backup location, so they can be restored.
→ Staging doesn't copy files anywhere. It records what the next commit will include.
```

```quiz
What does the A in the short status mean for a file?
◉ The file is staged, and it's waiting for the next commit.
→ Right. A is the mark for a file that has been added to the staging area.
○ The file has been deleted from the folder.
→ A deleted file has a different mark. A means something else.
○ The file is ignored, and Git will never track it.
→ Ignored files are hidden, and they don't show an A. Chapter 6 covers them.
```

```quiz
You run git commit with no changes staged. What happens?
○ Git makes an empty commit with the message you gave.
→ Git doesn't make an empty commit by default, so the history stays free of noise.
○ Git commits every file in the folder, to be safe.
→ Git only commits what is staged, and it never commits everything on its own.
◉ Git says there's nothing to commit, and no commit is made.
→ Right. A commit needs staged changes, and without them Git reports that and stops.
```

---
