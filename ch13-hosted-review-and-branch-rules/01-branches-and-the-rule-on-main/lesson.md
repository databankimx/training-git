# 1. Branches and the Rule on Main

A protected branch is a branch the host won't let you change directly. On many teams, `main` is protected. You can't commit to it, and you can't push to it. The change goes on a branch of its own, and the branch is proposed for merging, as Chapter 8 described.

This is a rule of the hosting service, not of Git. Git will happily commit to `main` on your own computer. The host refuses the push when you try to share the commit. That's why the habit matters even on your own machine: make the change on a branch, and leave `main` alone.

## Make the change on a branch

`git switch -c` creates a branch and moves you onto it in one step. Your commits go on that branch, and `main` stays where it was.

~~~powershell
git switch -c feature/hosted-review
~~~

To see which branch you're on, use `git branch --show-current`. It prints just the name, which is useful in a script.

~~~powershell
git branch --show-current
~~~

~~~text
Output:

feature/hosted-review
~~~

## Try it

This exercise creates a branch, commits on it, and prints the branch name. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `feature/hosted-review` with `git switch -q -c feature/hosted-review`.
4. Add the line `Hosted review note` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add hosted review note`.
5. Print the current branch with `Write-Output (git branch --show-current)`.

The expected output is one line: `feature/hosted-review`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.
