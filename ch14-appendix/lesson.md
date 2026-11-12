# Appendix: Cheat Sheet, Glossary, and Troubleshooting

This appendix is reference material. Use the cheat sheet while you work, the glossary when a word stops making sense, and the troubleshooting section when Git won't behave. Nothing here is a new lesson, so there's no exercise.

## Cheat sheet

### Setting up

| You want | Write | Chapter |
|---|---|---|
| Check Git is installed | `Get-Command git` or `git --version` | 1 |
| Set your name for this repository | `git config user.name "Your Name"` | 1 |
| Set your name for your account | `git config --global user.name "Your Name"` | 1 |
| Read the name Git will use | `git config user.name` | 1 |
| Make a repository quietly | `git init -q -b main` | 2 |

### Status and staging

| You want | Write | Chapter |
|---|---|---|
| Full status | `git status` | 2 |
| One line per file | `git status --short` | 2 |
| Stage a file | `git add README.md` | 3 |
| Stage everything (check first) | `git add .` | 3 |
| Unstage a file | `git restore --staged README.md` | 5 |

### Saving and reading history

| You want | Write | Chapter |
|---|---|---|
| Commit with a subject | `git commit -q -m "Add notes"` | 3 |
| Commit with a body | `git commit -q -m "Subject" -m "Reason"` | 11 |
| Subjects, newest first | `git log --format=%s` | 3 |
| The body of the newest commit | `git log -1 --format=%b` | 11 |
| History of one file | `git log --format=%s -- README.md` | 11 |
| Commits that added a phrase | `git log --format=%s -S "phrase"` | 11 |
| Main line only | `git log --first-parent --format=%s` | 13 |

### Seeing changes

| You want | Write | Chapter |
|---|---|---|
| Unstaged changes | `git diff` | 4 |
| Names of changed files | `git diff --name-only` | 4 |
| Size of unstaged changes | `git diff --stat` | 4 |
| Staged changes | `git diff --staged` | 4 |
| Size of staged changes | `git diff --staged --stat` | 4 |
| Commits a branch adds to main | `git log main..notes --format=%s` | 12 |

### Undoing

| You want | Write | Chapter |
|---|---|---|
| Discard an unstaged edit (permanent) | `git restore README.md` | 5 |
| Unstage, keeping the change | `git restore --staged README.md` | 5 |
| Stop a merge in progress | `git merge --abort` | 9 |

### Ignoring files

| You want | Write | Chapter |
|---|---|---|
| Ignore a pattern | Add `*.log` to `.gitignore` in the repository folder | 6 |
| Test a rule against a file | `git check-ignore <file>` | 6 |

### Branches and merging

| You want | Write | Chapter |
|---|---|---|
| Create and switch | `git switch -c notes` | 7 |
| Current branch | `git branch --show-current` | 7 |
| Switch to an existing branch | `git switch main` | 7 |
| Merge quietly | `git merge -q notes` | 8 |
| Merge with the standard message | `git merge --no-edit notes` | 8 |
| Parents of a commit | `git rev-list --parents -n 1 HEAD` | 8 |

### Conflicts

| You want | Write | Chapter |
|---|---|---|
| Find conflicted files | `git status --short` (look for `UU`) | 9 |
| Mark a conflict resolved | `git add README.md` | 9 |
| Finish the merge | `git commit -q -m "Resolve conflict"` | 9 |

### Remotes and sharing

| You want | Write | Chapter |
|---|---|---|
| Name a remote | `git remote add origin <address>` | 10 |
| Push and record the branch | `git push -u origin main` | 10 |
| Copy a repository | `git clone <address> <folder>` | 10 |
| Read another folder's Git | `git -C <folder> log` | 10 |
| Bring in without merging | `git fetch origin` | 10 |
| Bring in and fast-forward | `git pull --ff-only origin main` | 10 |
| Commits you lack | `git rev-list --count HEAD..origin/main` | 12 |

## Glossary

Each term lists the chapter where it's introduced.

- **Bare repository.** A repository with no working folder, used as a shared copy. *Chapter 10.*
- **Branch.** A movable name for a commit. Committing moves the current branch forward. *Chapter 7.*
- **Codeowner.** A person named as responsible for part of a repository, who reviews changes to it. A hosting-service feature, not part of Git. *Chapter 8.*
- **Commit.** A snapshot of the staged files, with a message, a time, and a link to the commit before it. *Chapter 3.*
- **Conflict.** A situation where two branches changed the same lines and Git can't choose between them. *Chapter 9.*
- **Detached HEAD.** A state where you're looking at a commit rather than a branch, so new commits aren't on any branch. *Chapter 7.*
- **Diff.** A comparison that shows the lines removed and added. *Chapter 4.*
- **Fast-forward.** A merge that moves a branch name forward, with no merge commit. *Chapter 8.*
- **Fetch.** Bringing in commits from a remote without changing your branches. *Chapter 10.*
- **First parent.** The chain of commits along the branch you were on, skipping merged branches. *Chapter 13.*
- **HEAD.** The commit you're currently on, usually the tip of the current branch. In a conflict marker, it names the branch you were on. *Chapter 9.*
- **Identity.** The name and email address written into each commit. *Chapter 1.*
- **Index.** The staging area, which holds the changes the next commit will include. *Chapter 3.*
- **Merge commit.** A commit with two parents, made when two branches with their own commits are combined. *Chapter 8.*
- **Practice repository.** The folder the tutorial's exercises change, `C:\Development\git-practice`. *Chapter 0.*
- **Protected branch.** A branch the hosting service won't accept direct changes to, so changes arrive by review. *Chapter 8.*
- **Pull.** Fetching and then combining the fetched commits into your branch. *Chapter 10.*
- **Pull request.** The common term for a proposed change that is reviewed before it's merged. A hosting-service feature. *Chapter 12.*
- **Push.** Sending your commits to a remote. *Chapter 10.*
- **Remote.** A named address for another copy of the repository. *Chapter 10.*
- **Repository.** A folder that Git keeps a history for, recorded in a hidden `.git` folder. *Chapter 2.*
- **Snapshot.** The state of the files at one commit, which Git stores and can return to. *Chapter 0.*
- **Stage.** Moving a change into the staging area, ready for the next commit. *Chapter 3.*
- **Subject.** The first line of a commit message, a short statement of what the commit does. *Chapter 3.*
- **Tracked.** A file Git is keeping a history for. An untracked file is one Git can see but hasn't been told to track. *Chapter 2.*
- **Untracked.** A file Git sees in the folder but isn't yet tracking. Shown as `??`. *Chapter 2.*
- **Working folder.** The files as you see and edit them, outside the `.git` folder. *Chapter 0.*

## When Git won't behave

Most problems come from one of a few causes. Work through them in order.

**Git is not recognized.** Open a new window, because the `PATH` is read when a window opens. If it's still missing, run the setup script again, which installs Git if it isn't there.

**Git asks for your name or email.** The identity isn't set. In a practice repository, the reader supplies one. In your own repository, set it with `git config user.name` and `git config user.email`, and use `--global` only for your own account.

**A command opens an editor and waits.** Press `Q` or close the editor, then pass `-m` to commits so no editor is needed. The reader's runs never open one, so if a window hangs on your own machine, check for a missing `-m` or `--no-edit`.

**The status says `HEAD` is detached.** You're looking at a commit rather than a branch. Make a branch from where you are with `git switch -c <name>`, and commit there, so the work has a name.

**A conflict won't go away.** Look for `UU` in `git status --short`. Each conflicted file needs its markers removed, a `git add`, and then a commit. If the merge should not happen, `git merge --abort` returns to the state before it, and it discards edits to the conflicted files.

**A push is refused.** The shared copy has commits you don't have. Run `git fetch`, read what arrived, combine it with `git pull --ff-only` or a merge, and push again. Never force a push to get past a refusal on a shared branch.

**The reader says "is missing" for a file you made.** Check the path. A bare file name is created in the folder the reader runs from, not in the practice repository.

**Status lists files you didn't make.** Look for `shared.git` or `clone` folders from a remote exercise. The reader ignores them in its own runs, so a status that lists them is coming from your own folder.

If none of these fixes the problem, copy the full text of the error, including its first line, and send it to the person who maintains the tutorial. The first line names the command and the problem, and it's the most useful part to share.

---
