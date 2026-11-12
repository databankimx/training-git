# 4. Summary: Good History

You can write a message with a subject and a body, keep each commit to one change, and find what you need in the history with the tools that answer each question. A history written this way explains itself, and it stays useful long after the people who wrote it have moved on.

## What you learned

- A commit message has a subject, which is one short line, and a body, which holds the reason.
- `git commit -m "subject" -m "body"` writes both parts, as two paragraphs.
- `%s` prints the subject, and `%b` prints the body.
- A commit should do one thing. Stage each change separately, and commit it on its own.
- `git log -- <path>` lists the commits that touched one file. The `--` keeps the path from being read as anything else.
- `git log -S "<text>"` finds the commits that added or removed a piece of text.
- `git blame` shows who last changed each line, and the commit that did it. Its output changes between machines, so read it, and then check the commit with `git show`.
- A formatting commit can make blame point at the wrong change, so check the commit before you trust the name.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `-m "Add practice notes"` and a second `-m` of `Notes for the practice repository.`
3. Create `LICENSE.md` containing `License text`, stage it, and commit it quietly with `Add license note`.
4. Print the README's history, with `Write-Output (git log --format=%s -- README.md)`.
5. Print `Body: ` followed by the trimmed body of the newest commit that touched `README.md`. Use `$((git log -1 --format=%b -- README.md).Trim())` inside double quotes, so the body comes from the README's commit and not the license's.

The expected output is two lines: `Add practice notes` and `Body: Notes for the practice repository.`

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
Which is the most useful content for a commit's body?
○ The name of the editor you used to write the change.
→ The editor isn't part of the change. The body should explain the change.
◉ The reason for the change, and anything a reader needs that the subject can't hold.
→ Right. The subject says what the commit does, and the body says why.
○ A copy of every line you changed, so the reader needn't open the diff.
→ The diff already shows the lines. The body is for the reason, not a copy of the change.
```

```quiz
You want the history of one file only. Which command does that, and why the double dash?
◉ git log -- README.md, because the double dash tells Git the name that follows is a path.
→ Right. The -- separates options from paths, so a file name can't be mistaken for something else.
○ git log README.md, because log always takes a file name.
→ That can be read as a branch or another name. The dashes make the difference clear.
○ git blame README.md, because blame is the only command that works on one file.
→ Blame shows who changed each line. It isn't the way to list a file's history.
```

```quiz
A line in a file looks as though it was changed last week, but you know it was not. What is the likely cause, and what should you do?
○ Git has a bug in blame, and the answer can't be trusted at all.
→ Blame is accurate about the commit it names. The question is which commit that is.
○ The file has never been committed, so blame invents a date.
→ A file that was never committed wouldn't show a commit in blame at all.
◉ A formatting commit rewrote the whole file, so check the commit before the one blame names.
→ Right. Blame names the last commit that touched the line, and a reformat touches every line.
```

---
