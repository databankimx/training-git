# 2. Two Edits, One Conflict

Alice and Bob start from the same commit, and each changes the status line on their own branch. Each change is reasonable on its own. Together they disagree, and Git can't choose between them. This step makes both edits, merges Alice's first, and then merges Bob's, which produces the conflict you'll resolve in the next step.

## Alice's edit

Alice branches from the starting commit, changes the status, and commits.

~~~powershell
git switch -c alice
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: in review (Alice)")
git add DOCUMENT.md
git commit -q -m "Update status from Alice"
git switch main
~~~

~~~text
Output:

(nothing)
~~~

## Bob's edit

Bob also branches from the starting commit, which is still where `main` is, and changes the same line differently.

~~~powershell
git switch -c bob
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: approved (Bob)")
git add DOCUMENT.md
git commit -q -m "Update status from Bob"
git switch main
~~~

~~~text
Output:

(nothing)
~~~

## Merging both

Alice's branch merges first. `main` hasn't moved since the start, so this is a fast-forward. Bob's branch then collides with it, because both changed the status line.

~~~powershell
git merge -q alice
git merge --no-edit bob *> $null
git status --short
~~~

~~~text
Output:

UU DOCUMENT.md
~~~

The `UU` means the file is in conflict, and the merge is waiting. The decision about what the status should say is the next step, and it's a decision that belongs to the people on the project.

> **Aside: the conflict that is a question.**
> A conflict is Git asking which text the project should have. Two honest edits can disagree, and the resolution is a decision about the work, not a choice of winner. The best resolutions usually keep what both people were trying to say.

## Try it

This exercise makes both edits, merges them, and prints the status mark. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `DOCUMENT.md` with `@("# Project notes", "Status: draft")`, stage it, and commit it quietly with `Start project notes`.
3. Create `alice`, set the status to `Status: in review (Alice)`, stage it, commit it quietly with `Update status from Alice`, and switch to `main`.
4. Create `bob`, set the status to `Status: approved (Bob)`, stage it, commit it quietly with `Update status from Bob`, and switch to `main`.
5. Merge with `git merge -q alice`, then merge with `git merge --no-edit bob *> $null`.
6. Print the status with `Write-Output (git status --short)`.

The expected output is `UU DOCUMENT.md`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Creating `bob` after Alice's merge. Bob's branch then starts from Alice's commit, so the merge is a fast-forward and there is no conflict. Create `bob` from the starting commit, before merging anything.

---
