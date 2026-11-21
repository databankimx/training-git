# 2. Making Small Commits

Two changes that happened at the same time are not always two changes to commit together. A README and a license file have nothing to do with each other, so they belong in two commits, even though you wrote them in one sitting. Small commits are the habit that keeps history readable, and the staging area is what makes them possible.

## One change, one commit

Stage only the files for one change, then commit with a subject that describes it. Then stage the next change, and commit again.

~~~powershell
git add README.md
git commit -q -m "Add practice notes"
git add LICENSE.md
git commit -q -m "Add license note"
git log --format=%s
~~~

~~~text
Output:

Add license note
Add practice notes
~~~

Each subject names one change, so a reader scanning the list knows what each commit did. If the license note had to be reverted later, the README would be untouched.

## Why a big commit hurts

A single commit that adds the README and the license, and then fixes a typo in an unrelated file, gives a subject that has to describe three things. The reviewer has to read everything to find the parts they care about, and a revert takes all three with it. Splitting the work costs a few extra commands, and it saves the reader far more time than that.

> **Aside: the commit that could not be split.**
> Sometimes a change really is one thing, and it touches many files. That's fine. The test is not the number of files, but whether the subject could describe the whole commit honestly. If it can't, split the change.

## Worked example

This example makes two small commits, one for each change, so each can be read or reverted alone. It runs in a scratch folder, so the practice folder is untouched. Read it, then write your own script in the practice folder.

~~~powershell
New-Item -ItemType Directory -Force -Path "C:\Development\scratch-example" | Out-Null
Set-Location "C:\Development\scratch-example"
git init -q -b main
git config user.name "Example Person"
git config user.email "example@example.invalid"
Set-Content -Path "draft.txt" -Value "Hello"
git add draft.txt
git commit -q -m "Add draft"
Set-Content -Path "notes.txt" -Value "Meeting notes"
git add notes.txt
git commit -q -m "Add meeting notes"
Add-Content -Path "draft.txt" -Value "Second line"
git add draft.txt
git commit -q -m "Add second line to draft"
Write-Output (git log --format=%s)
~~~

~~~text
Output:

Add second line to draft
Add meeting notes
Add draft
~~~

Small commits keep each change separate. Each subject names one change, so a reader can see what happened without opening every file.

## Try it

This exercise writes two files and commits each one separately. It prints the subjects, and then the number of commits. The check compares the three lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage only that file, and commit it quietly with `Add practice notes`.
3. Create `LICENSE.md` containing `License text`, stage only that file, and commit it quietly with `Add license note`.
4. Print the subjects with `Write-Output (git log --format=%s)`.
5. Print `Commits: ` followed by `git rev-list --count HEAD` inside `$(...)`.

The expected output is three lines: `Add license note`, `Add practice notes`, and `Commits: 2`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Running `git add .` before the first commit, which stages both files together. The two changes then go into one commit, and the subject has to cover both. Name each file in its own `git add`.

---
