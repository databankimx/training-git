# 3. Summary: Setting Up Git

Git is installed, and it knows who you are. You can check for it from a script, make a repository, and set the identity inside that repository without touching your own settings. Those three things are the start of every Git job you'll do.

## What you learned

- `Get-Command git` finds Git if the terminal can see it, and `git --version` says which version it is.
- A script can check for a program quietly with `-ErrorAction SilentlyContinue` and an `if` line.
- Every commit records a name and an email address, and Git takes them from its settings.
- Settings live at three levels: system, global, and local. A local value beats a global one.
- `git config user.name` with no value reads the setting Git will use.
- `git config --global` changes your own account. Without it, the setting applies to one repository only.
- `git init -q -b main` makes a repository quietly, with its first branch named `main`.

## Try it

This exercise puts the chapter together. Your script must:

1. Check for Git, and print `Git is installed` when it's found, using an `if` line with `Get-Command git -ErrorAction SilentlyContinue`.
2. Move to `C:\Development\git-practice`.
3. Create the repository quietly with `git init -q -b main`.
4. Set `user.name` to `Practice Learner` and `user.email` to `practice@example.invalid`, without `--global`.
5. Print `Identity: ` followed by the value of `git config user.name`.

The expected output is two lines: `Git is installed` and `Identity: Practice Learner`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
Which command sets your name for every repository you use, on your own account?
○ git config user.name "Your Name"
→ That sets the name for the repository you're in, and only that one.
◉ git config --global user.name "Your Name"
→ Right. The global level applies to your account, on every repository you use afterwards.
○ git init user.name "Your Name"
→ git init makes a repository. It doesn't set a name, so this line does something else entirely.
```

```quiz
A commit shows a name you didn't expect, and your global setting is correct. What should you check first?
◉ The local setting of the repository, with git config user.name, because a local value beats a global one.
→ Right. The repository's own setting takes priority, so it's the first thing to read.
○ Your global setting again, because nothing else can change the name.
→ The global value is correct, so the cause is elsewhere. Look for a setting that overrides it.
○ The commit message, because the name is written into it.
→ The name comes from the settings, not from the message. Check the settings.
```

```quiz
A script checks for Git, and Git is missing. What should the script print by default?
○ A red error about the missing command, so the learner sees what went wrong.
→ A red error appears only if the script doesn't ask Git to stay quiet. The check should be quiet, and the if line decides what to print.
○ Git is installed, because the script always assumes it is.
→ That would be a false answer. The script should only print what it actually found.
◉ Nothing from the check, because the if line prints only when the program is found.
→ Right. With SilentlyContinue, a missing program gives an empty answer, and the if line prints nothing.
```

---
