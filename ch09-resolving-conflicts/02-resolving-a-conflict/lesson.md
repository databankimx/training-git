# 2. Resolving a Conflict

Resolving a conflict has three parts, and each one is a single decision. You edit the file so it says what you want, you stage it so Git knows the conflict is settled, and you commit so the merge is finished. The markers have to go, and the text between them has to be the text you choose. Git can't check that the text is right, so read the result before you commit.

## Editing the file

Open the conflicted file, and replace the whole block between the markers with the text you want. The markers themselves have to go, along with the lines that show both sides.

Sometimes you keep one side as it is. Sometimes you combine them, or write something new that covers both. The choice belongs to the person who understands the work, and a conflict is the place where that person has to say so.

~~~powershell
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Notes from both"
Get-Content -Path "C:\Development\git-practice\README.md"
~~~

~~~text
Output:

# Notes from both
~~~

The file now holds one line, with no markers, and the text is the decision.

## Staging the resolution

`git add` tells Git the conflict in that file is settled. Until you stage it, `git status` keeps listing the file as conflicted.

~~~powershell
git add README.md
git status --short
~~~

~~~text
Output:

M  README.md
~~~

The `UU` mark has become `M`, which means the file is modified and staged, ready for the merge commit. The merge itself isn't finished until you commit.

## Finishing the merge

`git commit` completes the merge. Because a merge is in progress, the commit gets two parents, one from each branch, just as in Chapter 8.

~~~powershell
git commit -q -m "Resolve heading conflict"
git status --short
~~~

~~~text
Output:

(nothing)
~~~

An empty status means the merge is complete and the folder is clean. The history now records the resolution, along with the two branches it joined.

> **Aside: the check that says you're still merging.**
> If you run `git status` without `--short` during a conflict, it says that you are in the middle of a merge, and lists the files still to resolve. The long form is useful there, because it tells you what Git is waiting for. When the list is empty, the commit finishes the merge.

## Try it

This exercise sets up the same two conflicting branches, resolves the file, stages it, commits the merge, and prints the result. The check compares both lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, set `README.md` to `# Notes from the branch`, stage it, and commit it quietly with `Change heading on notes`.
4. Switch back to `main`, set `README.md` to `# Notes from main`, stage it, and commit it quietly with `Change heading on main`.
5. Merge with `git merge --no-edit notes *> $null`.
6. Resolve the conflict by setting `README.md` to `# Notes from both`, staging it with `git add README.md`, and committing quietly with `Resolve heading conflict`.
7. Print the file with `Get-Content`, then print `Status: clean` using an `if` line with `-not (git status --short)`.

The expected output is two lines: `# Notes from both` and `Status: clean`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Committing without `git add`. Git won't finish the merge while the file is still unresolved, and `git status --short` keeps listing it with `UU`. Stage the file first, then commit.

---
