# 2. Committing on a Branch

A commit goes onto whichever branch you're on, and only that branch moves. This step makes a commit on `notes`, then looks at `main` to show that it didn't move. The contrast is the whole lesson: a branch keeps its work to itself until you decide to join it.

## A commit on the branch

You're on `notes`, so this commit goes there.

~~~powershell
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Second section"
git add README.md
git commit -q -m "Add second section"
git branch --show-current
~~~

~~~text
Output:

notes
~~~

The commit is on `notes`, and the branch name confirms it. Read the branch before you commit, as the last step said, and you'll know where the work landed.

## Asking another branch

`git log` takes a branch name, and lists that branch's commits. Naming `main` shows the history of `main` no matter which branch you're on.

~~~powershell
git log main --format=%s
~~~

~~~text
Output:

Add practice notes
~~~

`main` still has one commit. The second commit exists only on `notes`, so `main` hasn't been changed by the work you did there.

## Seeing both histories

Naming `notes` shows the branch's own history, which includes everything `main` had and the new commit as well.

~~~powershell
git log notes --format=%s
~~~

~~~text
Output:

Add second section
Add practice notes
~~~

The newest commit is first, and the shared commit underneath is the one the branches started from. That's the picture from the lesson: two commits on `notes`, and one on `main`.

> **Aside: which branch a file is on.**
> The files in your working folder always match the branch you're on, because switching changes them. A file you can see on `notes` may be absent on `main`. If a file seems to vanish, check the branch first, because nothing has been deleted from the history.

## Try it

This exercise commits a README on `main`, creates `notes`, commits a second section there, and prints the branch and the `main` history. The check compares both lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes` with `git switch -c notes`.
4. Add the line `Second section` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add second section`.
5. Print `Branch: ` followed by the current branch, then print the subjects of `main` with `Write-Output (git log main --format=%s)`.

The expected output is two lines: `Branch: notes` and `Add practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Making the second commit before switching to `notes`. It then lands on `main`, and `main` shows two subjects instead of one. Check `git branch --show-current` before every commit.

---
