# 2. Cloning a Repository

Cloning is how a person joins a shared repository. It makes a complete copy, history and all, in a new folder, and it records the shared copy as `origin` for you. A new team member's first step is almost always a clone, and it's the step that's easiest to do wrong by making the folder by hand first.

## Making the copy

`git clone` takes the address of the shared repository and the folder to make. The folder is created, and filled with the history and the latest files.

~~~powershell
git clone -q "C:\Development\git-practice\shared.git" "C:\Development\git-practice\clone"
~~~

~~~text
Output:

(nothing)
~~~

The `-q` switch suppresses the progress lines Git prints while it copies. The new folder is complete, and it's a repository of its own, with its own `.git` folder.

## Reading the copy's history

`git -C` runs a Git command in another folder, without changing where you are. It's the easiest way to look at a copy you aren't standing in.

~~~powershell
git -C "C:\Development\git-practice\clone" log --format=%s
~~~

~~~text
Output:

Add practice notes
~~~

The clone has the same history as the shared repository, because it was copied from it. Its remote is already set, and the name is `origin`.

> **Aside: the folder that was already there.**
> `git clone` refuses to put a copy in a folder that already holds files. It's a safeguard, and it's the reason a clone should go into an empty folder. If a clone fails with a message about the folder, check what is in it before you delete anything.

## Try it

This exercise clones the shared repository into a second folder, and prints the copy's history. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the bare repository with `git init -q --bare -b main shared.git`, add it as `origin`, and push with `git push -q -u origin main`.
4. Clone it quietly with `git clone -q "C:\Development\git-practice\shared.git" "C:\Development\git-practice\clone"`.
5. Print the copy's history with `Write-Output (git -C "C:\Development\git-practice\clone" log --format=%s)`.

The expected output is `Add practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Putting a file in the `clone` folder before cloning. Git refuses to clone into a folder that isn't empty. Leave the folder for `git clone` to create.

---
