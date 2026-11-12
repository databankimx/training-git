# 1. Comparing with the Last Snapshot

`git diff` with no switches compares the working folder with the last snapshot. It answers the question "what have I changed since I last saved?", and it's the first thing to run before you stage anything. Changes you haven't staged appear here and nowhere else.

## A change after a commit

Here's a README that's been committed, then edited. The edit hasn't been staged, so the change is only in the working folder.

~~~powershell
git add README.md
git commit -q -m "Add practice notes"
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Second section"
~~~

~~~text
Output:

(nothing)
~~~

## Asking which files changed

Use `--name-only` when you want the list of files without the lines. Git names every file that differs from the last snapshot.

~~~powershell
git diff --name-only
~~~

~~~text
Output:

README.md
~~~

The output is just the name, so you can read the answer without reading the diff. That's the fastest check before you stage anything.

## Reading the change

The full diff shows the lines themselves. Here it is, from the same change, with the hash line that changes every time.

~~~powershell
git diff
~~~

~~~text
Output:

diff --git a/README.md b/README.md
index 3f2c1a9..7b0e4d2 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,2 @@
 # Practice notes
+Second section
~~~

The added line starts with `+`, and the unchanged line above it shows where the addition sits. Read the diff from the top: the file name first, then the changed lines.

> **Aside: the change you forgot to stage.**
> A diff with no output can mean nothing changed, or that the change is already staged. `git diff` shows only unstaged changes. Chapter 4, step 2 covers the staged side, so if a diff seems empty when you expect a change, check the staged side before you assume the edit was lost.

## Try it

This exercise commits a README, edits it, and prints the name of the file that changed. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it with `git add README.md`, and commit it quietly with `Add practice notes`.
3. Add the line `Second section` to `README.md` with `Add-Content`.
4. Print the name of the changed file with `Write-Output (git diff --name-only)`.

The expected output is `README.md`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Staging the edit with `git add` before running `git diff --name-only`. The edit then moves to the staged side, and the unstaged diff is empty. Leave it unstaged for this exercise.

---
