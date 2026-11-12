# 1. Discarding an Edit

Sometimes an edit is simply wrong, and the right thing is to put the file back the way it was when you last saved it. `git restore` does that for a file in the working folder. It's the most direct undo in Git, and also the one that can't be reversed, so this step makes sure you know exactly what it takes.

## An edit to throw away

Here's a committed README, and then an edit that shouldn't be there. The edit is unstaged, so it lives only in the working folder.

~~~powershell
git add README.md
git commit -q -m "Add practice notes"
Add-Content -Path "C:\Development\git-practice\README.md" -Value "A line by mistake"
git diff --name-only
~~~

~~~text
Output:

README.md
~~~

The file has changed, and the diff names it. Check the lines first, as the last chapter showed, before you decide to discard them.

## Restoring the file

`git restore` takes a file name and puts that file back to its last committed text. Nothing else changes.

~~~powershell
git restore README.md
Get-Content -Path "C:\Development\git-practice\README.md"
~~~

~~~text
Output:

# Practice notes
~~~

The extra line is gone, and the file reads as it did at the last commit. Git can't bring back the line you discarded, so if you might want it again, copy it somewhere else before you restore.

> **Aside: the restore that didn't ask.**
> `git restore` doesn't confirm before it discards, and it doesn't move anything to a safe place. That's efficient on a good day, and it's why the diff should always be read first. If you're unsure whether a change matters, save a copy of the file, then restore it.

## Try it

This exercise commits a README, adds a line by mistake, and restores the file. The check compares the file's text.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Add the line `A line by mistake` to `README.md` with `Add-Content`.
4. Restore the file with `git restore README.md`.
5. Print the file's text with `Get-Content -Path "C:\Development\git-practice\README.md"`.

The expected output is `# Practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Restoring before the commit. A file that was never committed has no last committed text to return to, so `git restore` fails for it. Commit the file first, as the exercise does.

---
