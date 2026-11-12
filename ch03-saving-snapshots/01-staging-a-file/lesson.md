# 1. Staging a File

Staging is the step between editing a file and saving it. `git add` moves a file's current state into the staging area, where it waits to be committed. Until you commit, you can still change your mind, and nothing in the history has moved.

## Adding a file

Here's a file that Git sees but doesn't track yet. Before you add it, the short status marks it `??`, as Chapter 2 showed.

~~~powershell
git status --short
~~~

~~~text
Output:

?? README.md
~~~

`git add` moves it into the staging area.

~~~powershell
git add README.md
git status --short
~~~

~~~text
Output:

A  README.md
~~~

The `A` in the first column means added: the file is staged, and it's waiting for the next commit. The second column is blank, because nothing else has changed since it was staged. Chapter 2's short status table showed this mark.

## Staging is not saving

A staged file isn't in the history yet. It's in the staging area, which is a holding place, and you can unstage it or change it before you commit. Changing a staged file again shows up as a second mark, which Chapter 4 covers.

~~~powershell
git add README.md
git status --short
~~~

~~~text
Output:

A  README.md
~~~

Nothing in the output says the file is only staged, so the `A` is the thing to read. If the file had no commits before, that's the whole story: the history is still empty.

> **Aside: adding everything, and why it's risky.**
> `git add .` stages every change in the folder, including any file you didn't mean to include. It's quick, and it's how people accidentally commit a file that shouldn't be in the repository. Name the files you want, or check `git status --short` before you add everything. Chapter 6 covers files that should never be added at all.

## Try it

This exercise creates a file, stages it, and prints the short status. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, using `Set-Content`.
3. Stage it with `git add README.md`.
4. Print the short status with `Write-Output (git status --short)`.

The expected output is `A  README.md`. Note the two spaces between the `A` and the file name. The check compares the line exactly, so keep them.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Leaving out `git add`, which prints `?? README.md` instead. The file is still untracked, so the status hasn't changed. Stage it first.

---
