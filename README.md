# Git Basics

## License and Support

This repository is provided under the [MIT License](LICENSE). You are free to use, copy, modify, merge, publish, distribute, sublicense, and/or sell the materials in this repository, subject to the terms of that license.

This repository is provided for training and reference purposes only. DataBank IMX does not provide warranties, guarantees, maintenance, troubleshooting, implementation assistance, or technical support for this code or its use. Use it in any way permitted by the MIT License, but you are responsible for evaluating, adapting, testing, and supporting any use of it in your own environment.

## DataBank Responsibilities for Custom Code

All DataBank employees - including those working with AI-assisted tools - are bound by the [Development Rules of Engagement](development-rules-of-engagement.md). That document defines the rules for quoting, approving, developing, reviewing, scanning, storing, and delivering custom code for client work.

Key obligations that apply to everyone on every custom code engagement:

- **You own the code you deliver.** This applies equally to hand-written code, AI-assisted code, and AI-generated code. "The AI wrote it" is not an acceptable explanation for a production issue, a failed review, a security finding, or a support problem.
- **Code must be reviewed before delivery.** Review is interactive and must confirm that the code works, meets DataBank standards, is maintainable, and that the developer understands it well enough to explain, debug, and maintain it. Polished or well-formatted output - including AI-generated output - is not evidence of correctness.
- **Code must be in source control before delivery.** All custom code must be committed to the appropriate DataBank GitHub Enterprise repository before it is delivered to a client, regardless of whether the client receives source code, compiled binaries, or deployed functionality.
- **CI scanning must pass before delivery.** Required checks are the standards policy scan, SonarQube, and Snyk. A passing local build is not a substitute.
- **All third-party dependencies must be license-vetted.** The license must permit closed-source commercial use. Copyleft or unclear licensing must be escalated before use. Dependencies must not be added simply because an AI tool suggested them.
- **Only approved AI tools may be used.** Use only IT-approved tools through company accounts. All data entered into AI systems is subject to the [DataBank AI Acceptable Use Policy](https://workforcenow.adp.com/mascsr/wfncontenttools/file-management/file/JTJGc3RhdGljJTJGY2xpZW50cyUyRmNvbnRlbnQlMkZBSStBY2NlcHRhYmxlK1VzZStQb2xpY3kucGRmJTNGMTc3MTM0NzA4NjE4MQ==) and must be treated as confidential by default.
- **Custom code is billable work.** Code must be tied to an approved quote or engagement before commitment or delivery. Development quotes require approval from the Development Director or delegated development leadership before being sent externally.
- **Exceptions require explicit approval.** Time pressure alone is not a reason to bypass quote approval, source control, review, or CI scanning.

See the [Development Rules of Engagement](development-rules-of-engagement.md) for the full policy, including billing and quoting rules, source-code delivery rules, the delivery readiness checklist, and the exception process.

---

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

No prior experience with Git or a terminal is assumed. The Markdown tutorial is recommended reading, because the examples edit Markdown files. The introduction covers every PowerShell form the exercises use, so the PowerShell tutorial is optional.

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
13. **Hosted review and branch rules (optional).** The rules a hosting service adds on top of Git: protected branches, proposed changes, required checks, and codeowners. Your organization's rules are its own.
14. **Capstone.** Two people, one document, one conflict, and a history that explains the decision.
15. **Appendix.** A cheat sheet, a glossary, and what to do when Git won't behave.

Git itself has no pull requests, protected branches, or codeowners. Those are features of hosting services. Chapter 8 explains how the team protects `main`, and Chapter 13 describes the hosted rules in general terms.

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

## Folder layout

- `setup.ps1` prepares the reader and checks the tools it needs.
- `QUICKSTART.md` explains setup and the reader.
- `ch00-introduction\` through `ch14-capstone\` hold the chapters. Each chapter has a `lesson.md`, and its steps are folders with a `lesson.json`, a `lesson.md`, and, for exercises, a `starter.ps1`, a `sample.txt` with the expected output, and a `solution.ps1`.
- `ch15-appendix\` holds the appendix.
- `lesson-runner\` is the reader: a desktop window built with Electron.
- `resources\` holds the design notes for this tutorial, and it isn't published.

---

*Git Basics is a standalone tutorial. The other tutorials in this collection assume the setup it describes.*
