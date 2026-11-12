# 5. Undoing Safely

Everyone makes a change they wish they hadn't. A line is wrong, a file was edited by mistake, or a change is staged that belongs in a different commit. Git can undo most of these, but the undo commands differ in how much they can take back, and one of them can't take back anything at all. This chapter teaches the safe ones, and it's clear about the one that isn't.

## Three levels of undo

Work can be undone at three places, and each one has its own command.

- **In the working folder.** A change you haven't staged can be discarded with `git restore`. Discarding is permanent, because the change was never saved anywhere Git can return to.
- **In the staging area.** A change you've staged can be unstaged with `git restore --staged`. The change stays in the working folder, so nothing is lost.
- **In the history.** A commit that's already saved can be undone by making a new commit that reverses it. Rewriting the history itself is covered only as a warning in this chapter.

The rule that follows from this is simple. Unstaging is always safe. Discarding can't be undone, so check the diff before you discard anything.

## Discarding is permanent

`git restore` on a working file throws away its unsaved changes. Git doesn't keep a copy, the Recycle Bin doesn't hold it, and nothing in the history has it. That's why the diff is worth reading first.

~~~powershell
git diff --name-only
~~~

~~~text
Output:

README.md
~~~

The name is there, so the file has changes. Before you restore it, read `git diff` and make sure every line in it is one you want to lose.

## Unstaging keeps the change

`git restore --staged` moves a staged file back to the working folder. The change stays, so you can keep editing, or stage a different set of changes.

~~~powershell
git restore --staged README.md
git status --short
~~~

~~~text
Output:

 M README.md
~~~

The space before the `M` means the change is in the working folder and isn't staged. The file is still modified, and nothing was lost.

## Rewriting history is a warning

Git can also rewrite history: it can change a commit that's already saved, or remove one, with commands such as `git reset`, `git commit --amend`, and `git rebase`. Those commands are powerful, and on a commit that other people have already received, they cause real problems for them.

This tutorial doesn't teach them. The safe way to undo a saved commit is to make a new commit that reverses it, and the history then shows the undo along with everything else. If you're tempted by a rewriting command, ask someone on your team first.

> **Aside: the command with no undo.**
> `git reset --hard` throws away unsaved changes in the working folder and the staging area. It's sometimes recommended online, and it's the command that most often destroys a day's work. Treat it as a last resort, and never run it to make an error go away. Reading `git status` and `git diff` first is always the better habit.

## Try it

This chapter has three steps. The first discards an unwanted edit, the second unstages a change, and the third puts both together. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
