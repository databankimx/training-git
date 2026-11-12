# 1. Creating a Branch

A branch starts from wherever you are, and it takes its name from you. Creating one is a single command, and it takes you onto the new branch as well, so the next commit goes there. This step creates a branch from a commit that already exists on `main`, and confirms which branch you're on.

## Starting from the current commit

First, a commit on `main`, so there's something for the branch to start from.

~~~powershell
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git branch --show-current
~~~

~~~text
Output:

main
~~~

The repository starts on `main` because of the `-b main` in the `git init` command from Chapter 2. You're on `main` now, and the commit you just made is its latest.

## Creating the branch

`git switch -c notes` creates a branch called `notes` at the current commit, and switches to it. The `-c` means "create".

~~~powershell
git switch -c notes
git branch --show-current
~~~

~~~text
Output:

notes
~~~

Nothing in the files changed, because the new branch points to the same commit `main` does. The difference is the name, and what you commit next will go onto `notes`.

## Naming a branch

Use a short name that says what the work is for, such as `notes`, `fix-typo`, or `add-setup-steps`. Lowercase words with hyphens are easy to read and easy to type. A name with spaces is possible, but it's awkward in every command that uses it, so avoid spaces.

> **Aside: the branch that matches its work.**
> A branch name is not a permanent label, and you can rename or delete a branch later. Still, a name that describes the work makes the list of branches readable for everyone on the team, and it's the one thing they see before they open the commits.

## Try it

This exercise commits a README on `main`, creates a `notes` branch, and prints the current branch. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to a branch called `notes` with `git switch -c notes`.
4. Print the current branch with `Write-Output (git branch --show-current)`.

The expected output is `notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Using `git switch notes` without `-c`. Git then looks for an existing branch called `notes`, finds none, and reports an error. The `-c` is what creates the branch as well as switching to it.

---
