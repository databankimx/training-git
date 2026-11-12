# 2. A Merge Commit

When both branches have moved on, Git can't simply advance one name, because neither line contains the other. It makes a merge commit instead: a new commit with two parents, one from each branch. The merge commit is how the history records that two lines of work were brought together, and it's the commit you'll see in a log when a branch was merged rather than moved.

## Two branches that diverge

Here `main` gets a commit on one file, and `notes` gets a commit on another. Neither contains the other's work, so a fast-forward isn't possible.

~~~powershell
git switch -c notes
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Third section"
git add README.md
git commit -q -m "Add third section"
git switch main
Set-Content -Path "C:\Development\git-practice\LICENSE.md" -Value "License text"
git add LICENSE.md
git commit -q -m "Add license note"
~~~

~~~text
Output:

(nothing)
~~~

Each branch now has a commit the other lacks. That's the point at which a merge stops being a pointer move, and starts being a combination.

## Merging with a commit

`git merge -q --no-edit notes` combines the two lines. The `--no-edit` switch accepts the standard message without opening an editor.

~~~powershell
git merge -q --no-edit notes
git log -1 --format=%s
~~~

~~~text
Output:

Merge branch 'notes'
~~~

`git log -1` shows only the newest commit, and its subject is the message Git wrote for the merge. The name of the branch is in it, so the history says where the work came from.

## Counting the parents

A merge commit has two parents. `git rev-list` lists a commit and the commits it came from, and counting them tells you which kind of commit you're looking at.

~~~powershell
$parents = (git rev-list --parents -n 1 HEAD).Split(" ").Count - 1
Write-Output "Parents: $parents"
~~~

~~~text
Output:

Parents: 2
~~~

Two parents is the mark of a merge. A normal commit has one, and the first commit on a branch has none. Chapter 11 returns to reading history, and this count is one of the things you'll use there.

> **Aside: what the merge commit doesn't contain.**
> A merge commit records the combination, and it doesn't hold any new text of its own, unless the merge had to resolve a conflict. The changes come from the two parents. That's why a merge commit with no conflicts is easy to review: there is nothing new to read in it.

## Try it

This exercise diverges two branches, merges them, and prints the subject and the parent count of the merge commit. The check compares both lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, add `Third section` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add third section`.
4. Switch back to `main`, create `LICENSE.md` containing `License text` with `Set-Content`, stage it, and commit it quietly with `Add license note`.
5. Merge with `git merge -q --no-edit notes`.
6. Print the subject of the newest commit with `Write-Output (git log -1 --format=%s)`.
7. Count the parents of `HEAD` with `$parents = (git rev-list --parents -n 1 HEAD).Split(" ").Count - 1`, then print `Parents: ` followed by `$parents`.

The expected output is two lines: `Merge branch 'notes'` and `Parents: 2`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Forgetting `--no-edit`. Git then tries to open a message editor, the reader accepts the default, and the merge completes. The check still passes, but the lesson wants you to see why the switch exists, so use it.

---
