# 3. Summary: Ignoring Files

You can write a `.gitignore` that hides the files a repository shouldn't track, test a rule with `git check-ignore`, and recognize the files that must never be committed at all. The ignore file keeps the working folder tidy. It doesn't make a secret safe, and it doesn't remove anything that's already in the history.

## What you learned

- A `.gitignore` file in the repository's folder lists patterns, one per line.
- `*.log` matches every file ending in `.log`, and `build/` matches a folder and everything in it.
- An ignored file stays on disk. Only Git stops tracking it.
- `git check-ignore <file>` prints the file's name if a rule matches it, and nothing if none does.
- A `.gitignore` is committed like any other file, so everyone who clones the repository gets the same rules.
- A rule doesn't protect a file that's already in the history. Removing it from the working folder later doesn't remove it from the past.
- Passwords, tokens, private keys, and environment files are secrets, and they never go into a repository.
- A committed secret is handled by telling the repository's maintainers straight away, and by treating the secret as compromised. The team's policy says who to tell.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Write two patterns into `.gitignore` in that folder: `*.log` and `secrets.txt`. Use `Set-Content` with the two lines as an array, `@("*.log", "secrets.txt")`.
3. Create `app.log` with `started`, `secrets.txt` with `not for sharing`, and `README.md` with `# Practice notes`.
4. Print the short status with `Write-Output (git status --short)`.
5. Print the result of `git check-ignore app.log` with `Write-Output (git check-ignore app.log)`.

The expected output is three lines: `?? .gitignore`, `?? README.md`, and `app.log`. The log and secret files don't appear in the status.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
You committed a password by mistake, and then added a rule to .gitignore that hides it. What is the situation now?
○ The password is safe, because the rule hides it from the history.
→ A rule hides files from status, not from history. The commit still holds the password.
○ The password is removed, because deleting the file from the folder removes it from the history.
→ Deleting the file from the folder changes only the working folder. The history keeps the old commit.
◉ The password is still in the history, so the maintainers need to know and the secret must be replaced.
→ Right. Ignoring doesn't remove history, so the response is to tell the maintainers and treat the secret as compromised.
```

```quiz
What does git check-ignore secrets.txt print when a rule matches the file?
◉ The file name, which tells you the rule applies to that file.
→ Right. A printed name means the file is hidden by a rule.
○ Nothing, which means the file is safe.
→ Nothing is what it prints when no rule matches. A match prints the name.
○ The full contents of the file, so you can check it.
→ It prints only the name. It never shows the contents of a file.
```

```quiz
Which file should never be committed, however it's named?
○ A README that describes how to run the program.
→ A README is documentation, and it's meant to be shared.
○ A log file that a program writes on every run.
→ A log is usually ignored, because it's noise. It isn't a secret, though it's a reason for a rule.
◉ A file holding a password or an access token.
→ Right. Secrets are never committed, and the ignore rule is only the first defence.
```

---
