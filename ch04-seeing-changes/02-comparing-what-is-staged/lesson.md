# 2. Comparing What Is Staged

Once you stage a change, it stops appearing in `git diff`. The staged change moves to a different comparison, which is the staging area against the last snapshot, and `git diff --staged` shows it. This step shows both sides, so you can check exactly what the next commit will include.

## Staging moves the change

Here's the same edit as before, now staged.

~~~powershell
git add README.md
git diff --name-only
~~~

~~~text
Output:

(nothing)
~~~

The unstaged comparison is empty, because nothing differs from the staging area. The change hasn't disappeared. It has moved to the staged side.

## Seeing the staged change

`--staged` compares the staging area with the last snapshot. It shows what the next commit will record.

~~~powershell
git diff --staged --name-only
~~~

~~~text
Output:

README.md
~~~

Check the staged side before every commit. It shows exactly what you're about to save, which is the last chance to notice a file you didn't mean to include.

## Staged with a summary

Combine `--staged` with `--stat` for a summary of the change, the same form as the last step but for the staged side.

~~~powershell
git diff --staged --stat
~~~

~~~text
Output:

 README.md | 1 +
 1 file changed, 1 insertion(+)
~~~

The summary has the file, the number of changed lines, and a total. Read it as a checklist: is the file right, and is the number of lines what you expected?

> **Aside: the diff that is empty for the wrong reason.**
> If `git diff` is empty and `git diff --staged` shows nothing, the change may never have been saved in the working folder, or it may have been committed already. Check `git status --short` to see where the file stands. The three comparisons, working folder, staging area, and last snapshot, answer different questions, and knowing which one you're in is most of the skill.

## Try it

This exercise commits a README, edits it, stages the edit, and prints the staged summary. The check compares both lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Add the line `Second section` to `README.md` with `Add-Content`, then stage the file with `git add README.md`.
4. Print the staged summary with `Write-Output (git diff --staged --stat)`.

The expected output is two lines: ` README.md | 1 +` and ` 1 file changed, 1 insertion(+)`. Both lines begin with a space. The check compares them exactly.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Leaving out `--staged`. Plain `git diff --stat` after staging prints nothing, because the staged change isn't in the unstaged comparison. Add `--staged` to see it.

---
