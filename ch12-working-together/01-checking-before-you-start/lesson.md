# 1. Checking Before You Start

Every working session starts with the same three questions: which branch am I on, is my folder clean, and has anyone shared new work since I last pulled. Git can answer each one in a single command, and a short script can answer them all at once. This step does that check, and then brings in what others have shared.

## Which branch, and is it clean

`git branch --show-current` names the branch. `git status --short` prints nothing when the folder is clean, which is the state you want before starting. Read both before you change a file.

~~~powershell
git branch --show-current
git status --short
~~~

~~~text
Output:

main
(nothing)
~~~

If the status lists files, you have unsaved work from an earlier session. Decide what to do with it first: commit it, stash it, or discard it. Starting new work on top of unknown changes is how people lose track of what they've done.

## What others have shared

`git pull --ff-only` brings in new commits from the shared copy, and refuses if your branch has diverged. That refusal is the signal to stop and think, rather than let Git guess.

~~~powershell
git pull -q --ff-only origin main
git log -1 --format=%s
~~~

~~~text
Output:

Add practice notes
~~~

Once the pull has run, the latest subject shows what the shared copy holds, and you can start work from a known point.

> **Aside: the check that takes two seconds.**
> These checks are fast, and they're easy to skip when a task feels small. Most of the messy situations in shared repositories start with a small task that was begun on top of something nobody checked. Make the three questions a habit, and the habit does the rest.

## Try it

This exercise sets up a shared copy, runs the checks, and prints a message when the start is clean. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the bare repository `shared.git`, add it as `origin`, and push with `git push -q -u origin main`.
4. Pull with `git pull -q --ff-only origin main`.
5. Use an `if` line with `-not (git status --short)` to print `Ready to start` when the folder is clean.

The expected output is `Ready to start`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Pulling with a plain `git pull` and no `--ff-only`. When the histories have diverged, a plain pull may create a merge commit without asking. The `--ff-only` makes it stop and show you the situation, which is the point of checking.

---
