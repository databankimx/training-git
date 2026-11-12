# 2. Reading the Status

`git status` is the command you'll run more than any other in this tutorial. It answers one question, which is "what has changed since the last snapshot?", and it answers it in a form you can read at a glance. Once you can read it, you'll always know what Git is about to do with your work.

## The long form

Plain `git status` prints a full report. It names the branch you're on, lists the files Git can see, and suggests the next command.

~~~text
Output:

On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md

nothing added to commit but untracked files present (use "git add" to track)
~~~

The report is useful the first time you read it, and it becomes slow to scan after that. The wording also changes a little between Git versions, so a script shouldn't depend on it. The lesson uses the short form instead.

## The short form

`git status --short` prints one line per file, with two marks in front. The first mark describes the staging area, and the second describes the working folder. Most of the time you'll see one mark, and a space for the other.

~~~text
Output:

?? README.md
~~~

Two question marks mean the file is untracked: Git sees it, and it isn't in any snapshot yet. The short form is the same on every version of Git, which makes it the form to use when you compare results.

## What a clean folder looks like

A clean folder prints nothing in the short form. Every file Git can see is already part of a snapshot, and no change is waiting to be saved. An empty result is a good result, and it's the state you want before you start a new piece of work.

~~~powershell
git status --short
~~~

~~~text
Output:

(nothing)
~~~

## Reading a few marks

Two-letter marks appear as work moves through the three areas. You'll meet most of them later, and they're easy to learn in order.

- `??` is untracked: Git sees the file, and isn't tracking it.
- `A ` is added: the file is in the staging area, ready for the next snapshot. Chapter 3 covers this.
- ` M` is modified in the working folder, and not yet staged. Chapter 4 covers this.
- `AM` is added, and then changed again. Some of the change is staged, and some isn't.

Learn the first three now. The others make sense once you've seen the three areas in action.

> **Aside: the status that changes when you look.**
> `git status` doesn't change your files, but it may update Git's own index, which records what's in the working folder. You can run it as often as you like without harm, and that's one reason it's the safe command to reach for when you're unsure.

## Try it

This exercise adds a Markdown file to the practice repository, then prints the short status. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`.
2. Make the repository quietly with `git init -q -b main`.
3. Create `C:\Development\git-practice\README.md` containing `# Practice notes`, using `Set-Content`.
4. Print the short status, with `Write-Output (git status --short)`.

The expected output is `?? README.md`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first, so the file is created fresh each time.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Using `git status` without `--short` and expecting the one-line answer. The long form is correct, but it isn't the line the check compares. Add `--short`.

---
