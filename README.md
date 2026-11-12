# Git Basics

Git keeps a history of your work, so every change has a record of what it did and why. This tutorial teaches Git from the first snapshot to sharing work with other people, and to reading a shared history with confidence. It also covers the habits that keep a team's work trustworthy: checking before you start, pulling before you push, and reading a change the way a reviewer would.

## Quick start

The tutorial is at [databankimx/training-git](https://github.com/databankimx/training-git). Run the setup script once from the tutorial's folder, then start the reader:

```pwsh
powershell -NoProfile -ExecutionPolicy Bypass -File .\setup.ps1
cd lesson-runner
npm start
```

The script installs what's missing, including Git, PowerShell 7, and Node.js, and it clones the repository if you run it from elsewhere. You don't need any other tutorial first, and you don't need an account. [QUICKSTART.md](QUICKSTART.md) has the details.

## What you need

- Windows 10 or 11
- Git, PowerShell 7, and Node.js 24 or later. The setup script installs any that are missing.
- The Visual Studio Build Tools with the C++ workload, the fallback if Electron's download fails. The setup script installs them if they're missing. They need an Administrator PowerShell.

No prior experience with Git or a terminal is assumed. The Markdown and PowerShell tutorials are recommended reading, because the examples edit Markdown files and are typed in PowerShell.

## The chapters

Work through them in order. Each chapter has a short introduction, a few steps, and a summary with three quizzes. Most steps end with an exercise: you type a script in the Source pane, and the check compares its output with the expected result.

0. **Introduction.** What version control is, the snapshot model, and why documents belong with code. No exercise.
1. **Setting up Git.** Checking the install, and setting the identity that goes on each commit.
2. **Your first repository.** Making a repository, and reading its status.
3. **Saving snapshots.** Staging, committing, and reading the log.
4. **Seeing changes.** Diffs before and after staging, and the summary forms.
5. **Undoing safely.** Discarding an edit, unstaging a change, and why rewriting history is a warning.
6. **Ignoring files.** `.gitignore`, `git check-ignore`, and keeping secrets out.
7. **Branches.** Creating and switching branches, and committing on one.
8. **Merging.** Fast-forward and merge commits, and how the team protects `main`.
9. **Resolving conflicts.** Reading the markers, resolving, and aborting a merge.
10. **Remotes and sharing.** Pushing to a shared copy, cloning, fetching, and pulling. The chapter ends with an optional section on a hosted remote, which has no exercise.
11. **Good history.** Messages with a body, small commits, and finding changes later.
12. **Working together.** Checking before you start, pulling before you push, and reading a change as a reviewer.
13. **Capstone.** Two people, one document, one conflict, and a history that explains the decision.
14. **Appendix.** A cheat sheet, a glossary, and what to do when Git won't behave.

Git itself has no pull requests, protected branches, or codeowners. Those are features of hosting services, and the lessons describe them in general terms. Chapter 8 explains how the team protects `main`.

## The reader

The reader is a window, built on the same runner as the other tutorials in this collection. Each lesson shows its examples in source, then the output.

- **Run** (F5) runs your script in PowerShell 7. The output appears below the editor.
- **Check** (Ctrl+F5) compares the output with the expected result.
- **Show solution (spoiler)** shows one correct answer, after you've tried.
- **Reset** puts back the starter text of an exercise.
- Each code block has a copy button, which appears when you hover over it.

## The practice repository

Every exercise works in `C:\Development\git-practice`. The reader creates it when a step needs it.

**Check deletes everything in the practice folder, then runs your script.** Each check starts with no repository, so anything you made there by hand is removed when you press Check. Copy anything you want to keep somewhere else first.

**Run keeps what's there.** A plain run leaves the repository as it is, so you can experiment and look at the results with `git status` and `git log`.

The reader sets a practice identity, `Practice Learner`, for every run. It belongs to no one, so practice commits don't carry anyone's name. The exercises never set `--global` settings, so your own Git configuration is left alone.

## Accounts and credentials

No exercise needs an account, a token, or a password. Every exercise uses a local remote, which is a bare repository inside the practice folder. Chapter 10 has an optional section on pushing to a hosting service you already use, with your own account. The reader never asks for, stores, or displays a credential, and that section has no exercise and no check.

## Conventions used in this tutorial

The lessons follow a few rules that make documents easier to review:

- Use hyphens, not em dashes.
- Use plain text symbols, not emojis.
- End each lesson with a horizontal rule.

These are good habits in any document, not only in this tutorial.

## Folder layout

- `setup.ps1` prepares the reader and checks the tools it needs.
- `QUICKSTART.md` explains setup and the reader.
- `ch00-introduction\` through `ch13-capstone\` hold the chapters. Each chapter has a `lesson.md`, and its steps are folders with a `lesson.json`, a `lesson.md`, and, for exercises, a `starter.ps1`, a `sample.txt` with the expected output, and a `solution.ps1`.
- `ch14-appendix\` holds the appendix.
- `lesson-runner\` is the reader: a desktop window built with Electron.
- `resources\` holds the design notes for this tutorial, and it isn't published.

---

*Git Basics is a standalone tutorial. The other tutorials in this collection assume the setup it describes.*
