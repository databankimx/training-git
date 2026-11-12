# 2. Your First Repository

A repository is a folder that Git is keeping a history for. Nothing about the folder changes when you make it a repository, except that a hidden `.git` folder appears inside it, and Git starts writing its records there. This chapter makes one, shows you what it contains, and teaches you to read its status, which tells you what Git sees and what it doesn't.

## What a repository is made of

Your files sit in the working folder, as they always did. The `.git` folder is Git's own record: the history, the staging area, and the settings for this repository. You'll use commands to read and change it, and you won't need to open it by hand. Editing files inside `.git` is a good way to break a repository, so leave them alone.

~~~text
C:\Development\git-practice\
    .git\        <- Git's records: history, staging area, settings
    README.md    <- your files, in the working folder
~~~

Everything Git knows about your work lives in that hidden folder, so if you copy or move the folder, the whole history goes with it. That's a useful property, and the reason `.git` is never deleted to make a problem go away.

## Making one

`git init` makes a repository in the folder you're in. The `-q` switch keeps it quiet, and `-b main` names the first branch.

~~~powershell
Set-Location "C:\Development\git-practice"
git init -q -b main
~~~

~~~text
Output:

(nothing)
~~~

Check that the `.git` folder is there with `Test-Path`, which you met in the PowerShell tutorial.

~~~powershell
Test-Path ".git"
~~~

~~~text
Output:

True
~~~

Run `git init` in a folder that is already a repository, and nothing is broken. Git says it reinitialized the existing repository and leaves the history alone. That's a safe thing to do, and a useful one to know when you're not sure whether a folder is tracked.

## Reading the status

`git status` tells you what Git sees in the working folder. It's the command you'll run most often, so learn what it reports.

In a new repository with no files, the answer is short. In the long form, it reads something like this:

~~~text
Output:

On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
~~~

The wording differs a little between Git versions, and the long form is for reading, not for scripts. The short form is what this tutorial uses, because it gives one line per file and it's easy to compare.

~~~powershell
git status --short
~~~

~~~text
Output:

(nothing)
~~~

An empty result means the folder is clean: everything Git can see is already accounted for. A repository with no files at all is clean.

## Untracked files

Put a file in the folder and the status changes. Git sees the file, but it isn't tracking it yet, so it reports the file as untracked. In the short form, untracked files are marked with two question marks.

~~~powershell
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git status --short
~~~

~~~text
Output:

?? README.md
~~~

The `??` means Git has seen a file it doesn't yet track. It hasn't saved the file anywhere, and it won't until you tell it to, which is the subject of Chapter 3. Until then, the file is only in the working folder.

> **Aside: why untracked is not the same as ignored.**
> Git reports every file in the working folder as untracked, unless a `.gitignore` file tells it to skip the file. Chapter 6 covers that. Until then, an untracked file is simply one Git has not been asked to remember.

## Try it

This chapter has three steps, and each one has an exercise. The first makes a repository and checks that its folder is there. The second adds a Markdown file and reads its status. The third puts both together.

Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first, so each check starts with no repository.

---
