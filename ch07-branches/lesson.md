# 7. Branches

So far every commit has gone onto one line of history, the one called `main`. That works for one person, and it stops working as soon as two pieces of work need to happen at the same time. A branch gives each piece its own line. You can try an idea, write a draft, or fix something without disturbing the main line, and then decide whether the work belongs in it.

## What a branch is

A branch is a name that points to a commit. When you commit on a branch, Git adds a new commit after the one the branch points to, and then moves the branch's name forward. Nothing else moves. The other branches keep pointing where they were.

Creating a branch is cheap, because it only adds a name. The commits are shared, so a new branch doesn't copy your files, and switching between branches changes the working folder to match the commit the branch points to.

~~~text
main:     A -- B
                \
notes:       C -- D
~~~

In that picture, `notes` started from `B` and has two commits of its own, `C` and `D`. `main` still ends at `B`. The diagram is only a picture, and the commands below don't print it.

## Creating and switching

`git switch -c` creates a branch and moves you onto it in one step. `git switch` alone moves you to a branch that already exists.

~~~powershell
git switch -c notes
git branch --show-current
~~~

~~~text
Output:

notes
~~~

`--show-current` prints the branch you're on, and nothing else. Read it whenever you're unsure which line of history you're adding to, because the answer changes what your next commit does.

## Why the branch name matters

Every commit you make goes onto the current branch. A commit made on the wrong branch isn't lost, but it's in the wrong place, and moving it takes care. Check the branch before you commit, the same way you checked the location before you ran `git init` in Chapter 2.

> **Aside: the detached HEAD.**
> Sometimes Git tells you that you're in a "detached HEAD" state. That means you're looking at a commit rather than a branch, so new commits aren't attached to any branch name. It's safe to look around, but commits made there are easy to lose. Switch to a branch with `git switch` before you commit, and you won't meet this state by accident.

## Try it

This chapter has three steps. The first creates a branch and shows its name, the second commits on it, and the third switches back and checks what `main` holds. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
