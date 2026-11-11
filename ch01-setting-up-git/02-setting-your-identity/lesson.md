# 2. Setting Your Identity

Every commit carries a name and an email address, and Git takes them from its settings. In this step you'll set them, and see where they're kept. The exercise uses a repository's local settings, so the practice identity stays inside the practice folder.

## Making a repository to configure

Git's settings belong to a repository, or to your account, so you need a repository before you can set a local value. `git init` makes one. It's the subject of Chapter 2, so for now, read it as "make an empty repository here".

~~~powershell
Set-Location "C:\Development\git-practice"
git init -q -b main
~~~

~~~text
Output:

(nothing)
~~~

The `-q` switch means quiet, so Git doesn't print its usual "Initialized empty repository" line. The `-b main` names the first branch `main`, which is what most teams use. Without it, Git uses whatever default it has been given, which can differ between machines.

## Setting the identity

`git config` sets a value. Give it a name and a value, and it writes the value to the settings.

~~~powershell
git config user.name "Practice Learner"
git config user.email "practice@example.invalid"
~~~

~~~text
Output:

(nothing)
~~~

Git prints nothing when a setting is saved. Read it back with the name alone.

~~~powershell
git config user.name
~~~

~~~text
Output:

Practice Learner
~~~

## Local, global, and the one that changes your machine

These two commands look alike, and they do very different things.

- `git config user.name "..."` writes to the local settings of the repository you're in. Only that repository is affected.
- `git config --global user.name "..."` writes to your account, and every repository you use afterwards takes that name.

The `--global` version is the one people normally want for their own work, and the one to avoid in a practice exercise. The exercises in this tutorial use the local version, so a practice name never leaks into your own settings.

> **Aside: the settings that override.**
> A local setting beats a global one, so a repository that sets its own identity ignores yours. If a commit shows the wrong name, check the local level first with `git config user.name`, which reads the value Git will actually use.

## Try it

This exercise makes a repository, sets the identity inside it, and prints the name Git will use. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`.
2. Create the repository quietly with `git init -q -b main`.
3. Set `user.name` to `Practice Learner` and `user.email` to `practice@example.invalid`, using `git config` without `--global`.
4. Print `Identity: ` followed by the value of `git config user.name`, using `$(...)` inside double quotes.

The expected output is `Identity: Practice Learner`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first, so the repository is made fresh each time.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Adding `--global` to the `git config` lines. It works, but it changes your own settings and not just the practice repository. The exercise checks the practice repository, so the local form is the right one.

---
