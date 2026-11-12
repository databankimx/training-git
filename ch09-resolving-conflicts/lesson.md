# 9. Resolving Conflicts

Most merges complete without help. Git combines the two lines of work, and nobody has to think about it. A conflict is the exception. It happens when both branches changed the same lines since they split, and Git can't tell which version you want. Rather than guess, Git stops and asks you to decide.

Conflicts look frightening the first time, and they are mostly a question with two answers. This chapter shows what Git writes when it asks, how to answer it, and how to back out if you'd rather start again.

## Why conflicts happen

Git merges by line. If two branches changed different lines, the merge is clean. If they changed the same line in different ways, Git has two versions of one line and no rule for choosing. A conflict is that situation, and it's a sign that the two pieces of work overlap.

Conflicts are most common when two people edit the same paragraph, or when a branch lives for a long time while `main` moves on. Keeping branches short and merging often makes conflicts rarer and smaller.

## Reading the markers

When a merge conflicts, Git writes both versions into the file, separated by markers. The markers are plain text, and you can read them in any editor.

~~~text
<<<<<<< HEAD
# Notes from main
=======
# Notes from the branch
>>>>>>> notes
~~~

`<<<<<<< HEAD` starts the version from the branch you were on, which is `main` here. `=======` separates the two versions, and `>>>>>>> notes` ends the version from the branch being merged. The word `HEAD` is Git's name for the branch you're on, and it appears in the marker whatever that branch is called.

Your job is to write the text you want, and to remove the markers. Git doesn't do that for you.

## Finding conflicted files

`git status --short` marks a conflicted file with two letters, both `U` in the typical case, which means both sides changed it. That's how you find the files to resolve, without reading every file in the folder.

~~~text
Output:

UU README.md
~~~

The `UU` means unmerged, and it's the mark to look for after a conflict. Once you've resolved the file and staged it, the mark goes away.

> **Aside: the sides with the wrong names.**
> The names `ours` and `theirs` are used in some Git commands, and they mean different things depending on whether you're merging or rebasing. The markers avoid that confusion by naming the branches. Trust the names in the markers, and read `git status` to see what is in progress.

## Try it

This chapter has four steps. The first creates a conflict and reads the markers, the second resolves one, the third aborts a merge that you don't want, and the fourth puts the steps together. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
