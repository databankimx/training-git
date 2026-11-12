# 2. Committing

A commit turns the staging area into a snapshot in the history. It's the step that makes a change permanent, as far as Git is concerned, and it's the one people most often rush. A commit takes a message, and the message is what someone reads six months later when they're trying to understand why a file changed.

## Committing with a message

`git commit -m` makes the commit and takes the message from the command. Staged changes go into the snapshot, and everything else waits.

~~~powershell
git commit -q -m "Add practice notes"
~~~

~~~text
Output:

(nothing)
~~~

The `-q` switch keeps the commit quiet. Without it, Git prints a short summary of what was saved. The commit still happened, and the history now has one entry.

## Reading the log

`git log --format=%s` lists the subjects of the commits, newest first. After one commit, there's one line.

~~~powershell
git log --format=%s
~~~

~~~text
Output:

Add practice notes
~~~

The log doesn't show the file's contents, only the message and the order. To see what a commit changed, Chapter 4 introduces `git show` and the diff.

## Nothing to commit

If nothing is staged, `git commit` has nothing to save, and it says so. It doesn't create an empty commit by default, which keeps the history free of noise.

~~~powershell
git commit -q -m "Nothing new"
~~~

~~~text
Output:

(nothing)
~~~

With `-q`, the refusal is silent, so check `git status --short` to see why nothing happened. A commit with nothing staged is not an error, but it's not a commit either.

> **Aside: the message that explains nothing.**
> A message such as `update` or `fix` tells the next reader nothing. Write the subject as a short instruction that says what the commit does, such as `Add practice notes`. Chapter 11 covers messages in more detail, and the habit starts now.

## Try it

This exercise creates a file, stages it, commits it with a message, and prints the subject from the log. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, using `Set-Content`.
3. Stage it with `git add README.md`.
4. Commit quietly with the message `Add practice notes`, using `git commit -q -m`.
5. Print the subjects with `Write-Output (git log --format=%s)`.

The expected output is `Add practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Leaving out `-m`. Git then opens a message editor. The reader's setting accepts the default, which is empty, and Git refuses an empty message, so the commit doesn't happen. Always pass `-m`.

---
