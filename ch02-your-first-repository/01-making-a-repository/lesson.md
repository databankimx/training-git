# 1. Making a Repository

Making a repository is one command, and it's quick enough that people sometimes do it without thinking. It's worth thinking about, because a repository decides where history is kept, and a folder that's accidentally a repository can hold a surprising amount of old work. This step makes one on purpose, and checks that Git created the folder it needs.

## Choosing the folder

Run `git init` in the folder you want tracked, and nowhere else. Git makes the repository wherever you are, so the first habit is to check where you are with `Get-Location`, as you learned in the PowerShell tutorial.

~~~powershell
Set-Location "C:\Development\git-practice"
(Get-Location).Path
~~~

~~~text
Output:

C:\Development\git-practice
~~~

The path is the folder that will become the repository. If it's the wrong one, nothing is lost, because `git init` only adds a `.git` folder. Removing that folder undoes it, but it also removes the history, so take that step only when the history is empty.

## Making the repository

Now make it. The switches are the same as in Chapter 1, quiet and with a named first branch.

~~~powershell
git init -q -b main
~~~

~~~text
Output:

(nothing)
~~~

Git printed nothing, which is what `-q` asks for. The work happened in the hidden `.git` folder, so the folder looks the same to File Explorer, except for that folder.

## Confirming it

`Test-Path` answers yes or no about a path. A repository has a `.git` folder, so checking for it is a reliable way to confirm that a folder is one.

~~~powershell
Test-Path ".git"
~~~

~~~text
Output:

True
~~~

If the answer is `False`, the repository wasn't made here. Check your location again, because the command runs in the folder you're in and nowhere else.

> **Aside: the folder that was already a repository.**
> Running `git init` in a folder that's already a repository is harmless. Git reports that it reinitialized the existing repository, and nothing in the history changes. It's a good way to check whether a folder is tracked, but a command that looks for `.git` is clearer, and it doesn't create anything.

## Try it

This exercise moves to the practice folder, makes the repository, and prints whether the `.git` folder is there. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`.
2. Make the repository quietly with `git init -q -b main`.
3. Print `Repository ready: ` followed by the result of `Test-Path ".git"`, using `$(...)` inside double quotes.

The expected output is `Repository ready: True`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first, so the repository is made fresh each time.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Running `git init` from the wrong folder, such as the repository's parent. The repository then covers a folder you didn't mean to track. Check `(Get-Location).Path` first, every time.

---
