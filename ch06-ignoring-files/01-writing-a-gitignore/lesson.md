# 1. Writing a .gitignore

The simplest `.gitignore` is one line. Write a pattern in it, and the files that match the pattern disappear from `git status`. This step writes one, creates a file it should hide, and shows the result. The effect is immediate, and it's the easiest way to see what a pattern does.

## A file that should be hidden

Here's a log file, which a program writes every time it runs. Git sees it, and it reports it as untracked.

~~~powershell
Set-Content -Path "C:\Development\git-practice\app.log" -Value "started"
git status --short
~~~

~~~text
Output:

?? app.log
~~~

The log file isn't something anyone should commit. Its contents change on every run, and nobody reviewing a change needs it in the history.

## Writing the rule

Create a `.gitignore` file in the repository's folder with the pattern `*.log` in it. The star matches any name, so the pattern covers every log file in the folder and below.

~~~powershell
Set-Content -Path "C:\Development\git-practice\.gitignore" -Value "*.log"
git status --short
~~~

~~~text
Output:

?? .gitignore
~~~

The log file is gone from the status, and the `.gitignore` itself appears, because it's a new file that hasn't been committed. The rule did its job, and the file it hides is still on disk, where the program that writes it expects to find it.

> **Aside: a pattern that matches more than you meant.**
> `*.log` matches a file called `error.log` in any folder, and also one called `important.log` that you might have wanted to keep. Patterns are broad by design. Write the most specific pattern that does the job, and check `git status` after each change to see what it hides.

## Try it

This exercise writes a `.gitignore`, creates a log file and a README, and prints the short status. The log file must be hidden, and the other two files must show.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Write `*.log` into `.gitignore` in that folder, using `Set-Content`.
3. Create `app.log` with the text `started`, and `README.md` with the text `# Practice notes`, both with `Set-Content`.
4. Print the short status with `Write-Output (git status --short)`.

The expected output is two lines: `?? .gitignore` and `?? README.md`. The log file doesn't appear.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Writing the `.gitignore` in the folder above the repository. Git reads the `.gitignore` in the repository's own folder, so the log still shows in the status. Check that the file is at `C:\Development\git-practice\.gitignore`.

---
