# Git Basics: Roadmap

This is the design for the Git tutorial. It sets the audience, the scope, the prerequisites, the practice repository, the reader, the chapter outline, the setup, and the decisions made. Content is written after the design is approved, and the decisions below are settled.

## Purpose

Git is where the collection's work lives. The repositories hold the code and the Markdown documents, the setup scripts are cloned with it, and the course's chapter on agentic workflows assumes a learner can read a diff. This tutorial teaches Git from the first snapshot to sharing work with others, so a learner can save, review, undo, and share changes without guessing.

It also explains why Markdown documents belong in version control with code, which the Markdown tutorial introduces, and it shows how Git's history makes a decision traceable.

## Audience

Absolute beginners on Windows. Some have used a graphical Git client and don't know what it is doing for them. Some have used Git once, from a tutorial, and are afraid of breaking something. Few have worked in a shared repository with other people. Some will grab this tutorial as the first repository they clone, so it has to work on a machine where nothing else is set up.

The tutorial assumes no programming background, and it doesn't assume the learner knows what a commit is. It defines each term the first time it appears, and it explains the model before the commands: a repository is a history of snapshots, not a list of edits.

## Prerequisites

The setup script installs everything the tutorial needs, so a learner doesn't have to complete the other tutorials first. The Markdown and PowerShell tutorials are recommended reading, and the Git tutorial links to them where a lesson depends on them: the examples edit Markdown files, and the commands are typed in PowerShell 7.

## Scope

In scope:

- what Git stores, and the three areas: working folder, staging area, and history
- installing Git, and setting the identity that goes on each commit
- creating repositories, reading status, staging, committing, and reading the log
- seeing changes with `git diff`, before and after staging
- undoing work safely: restoring files, unstaging, and the difference between a safe undo and a rewrite
- ignoring files with `.gitignore`, including what must never be committed
- branches, switching, and merging
- merge conflicts: why they happen, how to read them, and how to resolve or abort
- remotes, cloning, fetching, pulling, and pushing, using a local remote in every exercise
- writing good commit messages and keeping commits small
- reading history: filtering, blame, and tracing a line to the change that wrote it
- working with a shared repository, including checking before you start and what review means
- an optional section on using a hosted remote, with the learner's own account and credentials

Out of scope:

- the features of any particular hosting service, such as its web interface, its pull request screens, or its access rules. The lessons are generic and apply to any host
- rebasing and interactive rewriting of history, which are covered as a warning only
- Git internals such as objects and packfiles, beyond one introductory aside
- submodules, LFS, and hooks
- company policy text. Where a lesson depends on policy, it says that the team's policy applies, and it doesn't link to or copy it

## Accounts and credentials

No exercise needs an account, a token, or a password. Every exercise uses the local remote, which is a bare repository in the practice folder.

The optional hosted-remote section in Chapter 10 shows the same commands against a repository the learner creates on a hosting service they already use. It has no exercise and no check. The lesson says that:

- the learner signs in with their own account, through Git's credential manager, and the tutorial never sees their credentials
- the repository should be a practice repository with no confidential content, and the team's policy applies to anything that goes into it
- the learner creates and deletes that repository themselves

The reader never asks for, stores, or displays a credential, and it has no part in the hosted-remote section beyond what a terminal already does.

## Practice repository

Exercises run in a practice repository at `C:\Development\git-practice`. The reader creates it, and it's the only folder Git exercises change.

Each Check deletes and recreates the practice folder before the learner's script runs, so every check starts from the same empty state. A plain Run keeps what's there, so a learner can experiment, as in the PowerShell tutorial.

Exercises that need a remote create a bare repository inside the practice folder, and use its local path as the remote. The dummy identity used for practice commits belongs to no one, so it can't be mistaken for a real person's.

Git's identity is set through environment variables that the reader supplies to every run, so commits work on a machine where no identity is configured. The lessons teach the configuration commands in Chapter 1 and then use the variables in practice, with the reason explained.

The reader also sets two variables that prevent a script from waiting for input: the pager is turned off, and the commit editor is set to a command that accepts the default message. Every commit in the lessons uses `-m`, so the editor isn't needed, but the setting protects against a stray command that opens one.

## Reader

The reader is the PowerShell tutorial's runner, copied and adjusted, so each tutorial owns its reader. It keeps the same parts: the sidebar, the lesson pane with rendered blocks, the Source pane, Run and Check, Reset, the spoiler solution, the hint after a failed check, the copy buttons, and progress saved outside the repository.

Differences from the PowerShell reader:

- The practice folder is `C:\Development\git-practice`, and the reset empties it by deleting and recreating it, on Check only.
- The Git identity, the pager setting, and the editor setting are supplied to every run.
- Exercises use the same three kinds of check. The output check compares what the script prints. The files check compares the practice folder's files, including files that must be gone. A repository check uses the output of Git commands that report state, such as `git log` with a format and `git status --short`, so the output check covers history and status without a new check type.
- Output from Git commands that include commit hashes is avoided in expected output. Lessons use `--format` or `--oneline` with the subject only, or print a value the script chooses, so the check is repeatable.
- Git's own colors are turned off in the reader, so the expected output holds on every machine.

The file buttons, the copy buttons, and the rule that a bare file name is created in the wrong folder carry over from the PowerShell tutorial, and the lessons explain them the same way.

## Chapter outline

Each chapter has a short introduction, a few steps, and a summary with three quizzes. The appendix is reference only.

**Chapter 0. Introduction.** What version control is, the snapshot model, why documents belong with code, the practice repository, and what to expect from the exercises. No exercise.

**Chapter 1. Setting up Git.** Checking that Git is installed, the identity that goes on commits (`git config user.name` and `user.email`), the difference between global and local settings, and the default branch name. Exercise: set the identity in the practice repository and print it.

**Chapter 2. Your first repository.** `git init`, the working folder, `git status`, and what untracked and clean mean. Exercise: create a repository, add a Markdown file, and print its status.

**Chapter 3. Saving snapshots.** Staging with `git add`, committing with `git commit -m`, the log, and the subject line. Exercise: make two commits and print the subjects.

**Chapter 4. Seeing changes.** `git diff` before staging and `git diff --staged` after, reading the `+` and `-` lines, and `--stat` and `--name-only`. Exercise: change a file, and print which file the diff names.

**Chapter 5. Undoing safely.** `git restore` for a working file, `git restore --staged` to unstage, and the warning about rewriting history. Exercise: discard an unwanted edit, and check the file is back to its committed text.

**Chapter 6. Ignoring files.** `.gitignore` patterns, why build output and logs are ignored, and why secrets must never be committed. The lesson says that the team's policy sets what may be committed, and that the learner should check it before committing anything. Exercise: ignore a log file, and show that status no longer lists it.

**Chapter 7. Branches.** Creating and switching branches, what a branch is, and committing on one. Exercise: create a branch, commit, and print the current branch.

**Chapter 8. Merging.** Fast-forward and merge commits, `git merge`, and the team's protected main. Protected main is taught as a rule of the hosting service, not of Git: changes reach `main` by pull request, and a codeowner reviews them. The chapter says so, and it checks only the step a learner controls locally, which is working on a branch before a change is proposed. Four steps, the last a summary.

**Chapter 9. Resolving conflicts.** Why conflicts happen, the conflict markers, choosing the text, `git add` after resolving, and `git merge --abort`. Exercise: resolve a conflict in a Markdown file, and check the file's final text.

**Chapter 10. Remotes and sharing.** Clone, remote, fetch, pull, and push, using a local bare repository as the remote. Exercise: push to the bare repository, clone it, and print the clone's log. The chapter ends with an optional section on a hosted remote, described in Accounts and credentials above, with no exercise.

**Chapter 11. Good history.** Commit messages with a subject and a body, small commits, `git log` filters, `git blame`, and tracing a line to the change that wrote it. Exercise: write a commit with a body, then print its subject.

**Chapter 12. Working together.** Checking before you start, pulling before you push, what review of a change means, and how the team's own tools and rules apply. Exercise: pull a teammate's change, then print the log. No new commands.

**Chapter 13. Capstone.** A small shared document: several people edit a Markdown file on branches, a conflict appears, the conflict is resolved, and the history explains the decisions. The exercise is the resolved history, checked by output.

**Appendix.** A one-page cheat sheet, a glossary that points to the chapter where each term appears, and a section on what to do when Git won't behave.

## Setup script

`setup.ps1` does everything, because a learner may grab this tutorial as the first repository they clone. It follows the collection's standard pattern: it runs Git, then the repository, then relaunches from inside the repository.

It installs, with winget, whatever is missing:

- Git
- PowerShell 7, which the lessons are typed in
- Node.js 24 or later, for the reader
- the C++ Build Tools, which are the fallback when Electron's download fails

It then installs the reader's packages from the lockfile, makes sure the Electron binary is present, and runs the reader's tests. It doesn't change the learner's global Git settings. The practice identity comes from the reader, and the learner's own identity is set only when they choose to in Chapter 1.

The setup script doesn't ask for any account or credential, and it doesn't create one.

## Milestones

1. **Reader.** The copied runner, with the practice repository reset on Check and the Git variables supplied to every run.
2. **Checks.** Output, files, and the repeatable Git output described above.
3. **Chapters 0 to 4.** Introduction through seeing changes, with exercises and quizzes, tested on a clean machine.
4. **Chapters 5 to 9.** Undoing through conflicts.
5. **Chapters 10 to 13 and the appendix.** Sharing through the capstone, including the optional hosted-remote section.
6. **Setup and quickstart.** Written: `setup.ps1`, `README.md`, and `QUICKSTART.md`. The setup script still needs a run on a clean machine with nothing else installed.
7. **Publish.** Repository content reviewed, `resources/` ignored, and pushed to GitHub.

Each milestone is tested before the next begins.

## Decisions

Settled at design time:

1. **Accounts and credentials.** No exercise requires an account, a token, or a password. The hosted remote is an optional, unchecked section in Chapter 10, with the learner's own account and Git's credential manager. The reader never handles credentials.
2. **Remote.** Every exercise uses a local bare repository. The hosted section shows the same commands against a repository the learner creates.
3. **Hosting service.** The lessons are generic and apply to any host. They don't describe one service's screens, and they don't name internal hosts.
4. **Policy.** Chapter 6 says the team's policy sets what may be committed, and the learner should check it first. The lesson doesn't link to or copy the policy.
5. **Rewriting history.** Rebase and amending published commits are mentioned only as a warning. The tutorial stops short of them.
6. **Practice folder.** `C:\Development\git-practice`, deleted and recreated on Check.
7. **Setup.** `setup.ps1` installs everything the tutorial needs, including PowerShell 7, Git, Node.js, and the Build Tools fallback, so the tutorial works as a first repository on a clean machine.
8. **Practice identity.** The reader supplies a dummy identity to every run. It belongs to no one.

Settled during the design:

9. **Output without hashes.** Expected output never includes commit hashes, so the checks repeat on every machine.
10. **Git's colors off.** The reader turns off Git's colors, so the expected output holds everywhere.
11. **Protected main.** On the team, `main` is protected. Changes reach it only by pull request, reviewed by a codeowner. Git has no pull requests, protected branches, or codeowners. Those are features of the hosting service, so Chapter 8 teaches the rule as a team practice, and Chapter 12 describes review in general terms, naming pull requests as the common word without describing any service's screens.

12. **The tutorial's own folders are ignored in reader runs.** Testing showed that the bare `shared.git` folder and the `clone` folder appeared as untracked files in `git status`, so a status check on a clean repository failed. The reader now writes an ignore file, listing those two folders, and passes it to Git on every run, through `core.excludesFile`. The setting applies only to the reader's runs, and the local-remote section of Chapter 10 says so.
13. **Reset per step.** Every Git step sets `resetOnCheck` in its `lesson.json`, so Check always starts with no repository, even where the step has no files expectation. Run keeps the repository. The reader's PowerShell rules are unchanged, because the flag defaults to off.
14. **Capstone shape.** Chapter 13 tells one story, Alice and Bob editing one status line on separate branches, with a conflict and a resolution whose reason is written in the commit body. It uses local branches, so every step can be checked. The chapter describes the team's clone and pull request process in words, and the summary checks the resolved document and the first-parent history.
15. **Setup script.** `setup.ps1` is the PowerShell tutorial's script, with this tutorial's repository address and folder. It installs Git, PowerShell 7, Node.js, and the Build Tools fallback, and it doesn't touch global Git settings.

---

*This roadmap records the design. Changes after the content is built should be added to the decisions list, with the reason.*
