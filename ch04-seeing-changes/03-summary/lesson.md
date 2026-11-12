# 3. Summary: Seeing Changes

You can compare the working folder with the last snapshot, and the staging area with the last snapshot, and read what each one reports. Those two comparisons answer the questions you'll ask before every commit: what have I changed, and what am I about to save?

## What you learned

- `git diff` compares the working folder with the last snapshot, and shows only unstaged changes.
- `git diff --staged` compares the staging area with the last snapshot, and shows what the next commit will include.
- In a diff, `+` marks an added line and `-` marks a removed one. A changed line appears as one of each.
- The `@@` line gives the position of a change, and the `index` line holds hashes that change every time.
- `--name-only` lists the changed files, one per line.
- `--stat` lists the changed files with counts, and a summary line.
- Staging a change moves it from the unstaged comparison to the staged one.
- An empty diff means nothing differs in that comparison, not that the work is gone.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Add the line `Second section` to `README.md` with `Add-Content`. Do not stage it yet.
4. Print `Changed: ` followed by the result of `git diff --name-only`, using `$(...)` inside double quotes.
5. Stage the file with `git add README.md`, then print the staged summary with `Write-Output (git diff --staged --stat)`.

The expected output is three lines: `Changed: README.md`, ` README.md | 1 +`, and ` 1 file changed, 1 insertion(+)`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
You edited a file and ran git diff, which printed nothing. What is the most likely explanation?
○ The edit was lost, and the file is back to its last saved text.
→ Not quite. An edit that's still in the working folder is never lost by a diff.
◉ The change is already staged, so it's in git diff --staged and not in git diff.
→ Right. The unstaged comparison shows only changes that haven't been staged.
○ Git is broken, and the diff command needs reinstalling.
→ Git is fine. The diff compares a specific pair of places, and the change is in the other one.
```

```quiz
In a diff, what does a line beginning with a plus sign mean?
◉ The line is in the new version, and it isn't in the old one.
→ Right. A plus marks text the change added.
○ The line was removed from the file.
→ That's the minus sign. A plus sign means the opposite.
○ The line is a comment, and Git ignores it when committing.
→ Git doesn't treat lines as comments in a diff. The plus sign marks an addition.
```

```quiz
Which command shows only the names of the changed files, with no lines?
○ git diff
→ That shows the lines themselves, not only the names.
○ git log --format=%s
→ That lists commit subjects, not changed files.
◉ git diff --name-only
→ Right. The switch gives one file name per line, and nothing else.
```

---
