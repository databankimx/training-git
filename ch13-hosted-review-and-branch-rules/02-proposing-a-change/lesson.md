# 2. Proposing a Change

Once a change is on its own branch, it's ready to propose. You push the branch, and then you ask for it to be merged into `main`. The host shows the commits the branch adds, and reviewers read them before anything reaches `main`.

Before you push, check the commits yourself, the way a reviewer would. Chapter 12 showed `git log main..notes`. The same command works here, and it's the first thing a reviewer reads.

~~~powershell
git log main..feature/hosted-review --format=%s
~~~

~~~text
Output:

Add hosted review note
~~~

The list shows only the commits the branch adds, so `main`'s own history stays out of the way. If the list is longer than you expect, or it holds a commit you didn't mean to make, fix it before you propose the change. A reviewer shouldn't have to explain your history to you.

## What the host adds

On GitHub, the proposed change is a pull request. It shows the same commits, lets reviewers comment on specific lines, and records who approved it. The screens depend on the host, and your team's rules decide what a proposal needs before it can merge. The Git part is the same everywhere: a branch with commits that the reviewer can read.

## Worked example

This example commits a typo fix on a branch, then lists the commits it adds to main before proposing it. It runs in a scratch folder, so the practice folder is untouched. Read it, then write your own script in the practice folder.

~~~powershell
New-Item -ItemType Directory -Force -Path "C:\Development\scratch-example" | Out-Null
Set-Location "C:\Development\scratch-example"
git init -q -b main
git config user.name "Example Person"
git config user.email "example@example.invalid"
Set-Content -Path "draft.txt" -Value "Hello"
git add draft.txt
git commit -q -m "Add draft"
git switch -q -c hotfix-typo
Add-Content -Path "draft.txt" -Value "Typo fixed"
git add draft.txt
git commit -q -m "Fix typo in draft"
Write-Output (git log main..hotfix-typo --format=%s)
~~~

~~~text
Output:

Fix typo in draft
~~~

Check the list before you propose the change, the way a reviewer would. A proposed change on GitHub, a pull request, shows these same commits. The screens differ by host.

## Try it

This exercise makes a change on a branch, then prints the commits the branch adds. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `feature/hosted-review` with `git switch -q -c feature/hosted-review`.
4. Add the line `Hosted review note` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add hosted review note`.
5. Print the commits the branch adds with `Write-Output (git log main..feature/hosted-review --format=%s)`.

The expected output is one line: `Add hosted review note`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.
