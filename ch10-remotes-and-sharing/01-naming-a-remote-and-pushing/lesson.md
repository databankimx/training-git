# 1. Naming a Remote and Pushing

A remote is a name that points at another repository, and a push sends your commits to it. Before you can push, the remote has to exist and have a name. This step makes a bare repository to act as the shared copy, names it `origin`, and pushes `main` to it. Once the push has happened, the shared copy holds the same history as your repository.

## A bare repository to share with

The shared copy is a bare repository. The `--bare` switch makes one with no working folder, which is what a shared repository should be, because nobody edits files in it directly.

~~~powershell
Set-Location "C:\Development\git-practice"
git init -q --bare -b main shared.git
~~~

~~~text
Output:

(nothing)
~~~

The folder is named `shared.git` by convention, which tells a reader that it's bare. It sits inside the practice folder for this tutorial. In a real setup it would live on a server, and your work would reach it through the same commands.

## Naming it and pushing

`git remote add` gives the address a name. The name `origin` is the usual one, and a push names the remote and the branch to send.

~~~powershell
git remote add origin "C:\Development\git-practice\shared.git"
git push -q -u origin main
git remote
~~~

~~~text
Output:

origin
~~~

The `-u` switch on the push records `origin/main` as the branch to compare against, so later `git status` and pull commands know where `main` is shared. `git remote` lists the names, and it doesn't show the addresses, which keeps the output the same on every machine.

> **Aside: the name that is only a name.**
> `origin` is a convention, and Git doesn't give it special treatment. You can name a remote anything, and a team usually agrees on one name so everyone's commands match. If a command refers to `origin` and fails, check `git remote` to see what the remote is actually called.

## Try it

This exercise makes a bare repository, names it `origin`, pushes `main` to it, and prints the remote's name. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the bare repository with `git init -q --bare -b main shared.git`.
4. Add it as `origin` with `git remote add origin "C:\Development\git-practice\shared.git"`.
5. Push with `git push -q -u origin main`.
6. Print the remote's name with `Write-Output (git remote)`.

The expected output is `origin`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Leaving out `--bare`. A repository with a working folder refuses pushes to its checked-out branch, and the push fails with a message about it. A shared copy should be bare.

---
