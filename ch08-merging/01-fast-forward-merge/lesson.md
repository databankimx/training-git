# 1. A Fast-Forward Merge

A fast-forward is the simplest merge there is, and it's the one that happens most often when a branch is short-lived. The branch got its commits while `main` stood still, so `main` has nothing to combine. Git moves `main` forward to the branch's latest commit, and that's the whole merge.

## The situation before the merge

Here's a `notes` branch with one commit that `main` doesn't have. `main` is still at the commit `notes` started from.

~~~powershell
git switch main
git log --format=%s
~~~

~~~text
Output:

Add practice notes
~~~

`main` has one subject. The `notes` branch has the same subject plus its own, which the merge will bring across.

## Merging

Switch to the branch that should receive the work, and name the branch to merge in. `git merge -q` runs the merge without the usual summary.

~~~powershell
git merge -q notes
git log --format=%s
~~~

~~~text
Output:

Add second section
Add practice notes
~~~

`main` now shows the same history as `notes`. Git didn't create a commit, because nothing needed combining: it only moved the name `main` forward. That's the fast-forward, and it leaves no trace of the merge in the history, which is sometimes exactly what you want.

> **Aside: the merge you can't see.**
> A fast-forward looks, in the history, as though the commits were made on `main` all along. Nothing in the log says a branch was involved. When you need to show that work came from a branch, a merge commit does it, which the next step makes.

## Try it

This exercise makes a `notes` branch with one commit, switches to `main`, merges it, and prints the history. The check compares both lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes` with `git switch -c notes`.
4. Add the line `Second section` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add second section`.
5. Switch back to `main` with `git switch main`, merge with `git merge -q notes`, and print the history with `Write-Output (git log --format=%s)`.

The expected output is two lines: `Add second section` and `Add practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Running the merge while still on `notes`. The command then brings `main` into `notes`, which is the wrong way round, and the history of `main` doesn't change. Switch to `main` first, and check it with `git branch --show-current`.

---
