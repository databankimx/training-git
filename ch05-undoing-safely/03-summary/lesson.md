# 3. Summary: Undoing Safely

You can move a staged change back out of the staging area, and you can discard a change from the working folder. The first keeps your work and the second doesn't, so the habit that matters most is to read the diff before you discard anything.

## What you learned

- `git restore <file>` discards unstaged changes in the working folder, and it can't be reversed.
- `git restore --staged <file>` unstages a file, and keeps its change in the working folder.
- Unstaging can't lose work. Discarding can.
- `git diff --name-only` and `git diff` show what a restore would throw away, so read them first.
- The short status has two columns: the first for the staging area, the second for the working folder.
- ` M` means a change is in the working folder and isn't staged.
- `git reset --hard` discards unsaved work in both places, and it isn't a safe habit.
- Rewriting history is powerful and affects other people. Reverse a saved commit with a new commit, and ask your team before any rewriting.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Add the line `Second section` to `README.md` with `Add-Content`, then stage it with `git add README.md`.
4. Unstage it with `git restore --staged README.md`, and print `Write-Output (git status --short)`.
5. Discard the change with `git restore README.md`.
6. If `git status --short` prints nothing, print `Status: clean`, using an `if` line with `-not`.

The expected output is two lines: ` M README.md` and `Status: clean`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
You staged a change, then decided it belongs in a later commit. Which undo keeps the change?
○ git restore README.md
→ That discards the change from the working folder, so it's gone.
◉ git restore --staged README.md
→ Right. It moves the change out of the staging area, and the change stays in the working folder.
○ git reset --hard
→ That discards unsaved work in both places. It's the opposite of what you want here.
```

```quiz
Why is it sensible to read git diff before running git restore on a file?
◉ Because discarding can't be undone, and the diff shows exactly what would be lost.
→ Right. Once the changes are discarded, Git can't bring them back.
○ Because git restore asks for confirmation, and the diff gives you the answer.
→ It doesn't ask. Reading the diff is the only chance to check what you'd lose.
○ Because the diff restores the file, so you must run it first.
→ git diff only shows changes. It doesn't restore anything.
```

```quiz
A commit was pushed to a shared repository, and it has a mistake. What is the safest way to undo it?
○ git reset --hard, then force the change to the shared repository.
→ That rewrites shared history, and it causes trouble for everyone who has the old commit.
○ git commit --amend on the shared commit, without telling anyone.
→ Rewriting a shared commit affects other people, even when it looks small. Ask your team first.
◉ Make a new commit that reverses the mistake, so the history shows the undo.
→ Right. A new commit is safe to share, and it keeps the history honest.
```

---
