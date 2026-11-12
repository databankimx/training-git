# 8. Merging

A branch is only useful if its work can come back. Merging takes the commits from one branch and brings them into another, so the line of history that holds the finished work is the one everyone reads. This chapter covers the two kinds of merge Git makes, shows what each one leaves in the history, and then explains how a shared team protects its main line.

## Two kinds of merge

When the branch you're merging is ahead of the branch you're merging into, and the second has no commits of its own, Git can simply move the pointer forward. That's a fast-forward merge, and it adds no commit of its own.

When both branches have new commits, Git has to combine them. It makes a merge commit, which has two parents: one from each branch. The merge commit records that the two lines of work came together.

~~~text
Fast-forward:   main: A -- B -- C          (notes merged, main moves to C)

Merge commit:   main: A -- B -- D -- M
                              \      /
                notes:         C ---
~~~

The picture shows one thing you can read directly: a merge commit has two parents, and a fast-forward has only the one line.

## A fast-forward merge

`git merge` takes the named branch and brings it into the one you're on. Here `notes` is one commit ahead of `main`, so the merge is a fast-forward.

~~~powershell
git merge -q notes
git log --format=%s
~~~

~~~text
Output:

Add second section
Add practice notes
~~~

`main` now has the notes branch's commits, and nothing extra was added. The `-q` switch keeps Git's usual summary quiet, so the output shows only the history.

## A merge commit

Now let both branches move on their own. `main` gets a commit on one file, and `notes` gets one on another, so the two histories have really diverged.

~~~powershell
git switch -c notes
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Third section"
git add README.md
git commit -q -m "Add third section"
git switch main
Set-Content -Path "C:\Development\git-practice\LICENSE.md" -Value "Licence text"
git add LICENSE.md
git commit -q -m "Add licence note"
git merge -q --no-edit notes
git log -1 --format=%s
~~~

~~~text
Output:

Merge branch 'notes'
~~~

Git made the merge commit, and gave it a standard message that names the branch. The `--no-edit` switch accepts that message without opening an editor, and the reader's settings would accept it anyway.

## Counting the parents

A merge commit has two parents, and a normal commit has one. `git rev-list` lists a commit and its parents, which lets you count them.

~~~powershell
$parents = (git rev-list --parents -n 1 HEAD).Split(" ").Count - 1
Write-Output "Parents: $parents"
~~~

~~~text
Output:

Parents: 2
~~~

Two parents is the mark of a merge. A commit with one parent is a normal commit, and a fast-forward doesn't create a new commit at all.

> **Aside: the merge that conflicts.**
> When both branches change the same lines, Git can't choose between them, and it stops the merge with a conflict. Chapter 9 covers how to read and resolve one. The merges in this chapter touch different files, so they complete on their own.

## Protecting main

Everything above works on a computer, and that's the first thing to understand about the rule in step 3. Git itself has no notion of a protected branch, and it won't stop you from merging into `main` on your own machine. A protected branch is a setting of the hosting service that holds the shared repository, and the service enforces it, not Git.

## Try it

This chapter has four steps. The first does a fast-forward merge, the second makes a merge commit, the third explains how the team's main branch is protected and checks the branch before a change is proposed, and the fourth puts the merge steps together. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
