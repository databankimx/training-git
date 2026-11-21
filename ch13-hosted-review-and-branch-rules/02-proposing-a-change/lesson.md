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
