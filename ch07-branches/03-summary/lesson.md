# 3. Summary: Branches

You can create a branch, switch between branches, commit on one without changing another, and read the history of any branch by name. A branch is a movable name for a commit, and it keeps your work separate until you choose to bring it back.

## What you learned

- A branch is a name that points to a commit. Committing moves the current branch forward, and no other branch moves.
- `git switch -c <name>` creates a branch and switches to it. `git switch <name>` switches to one that exists.
- `git branch --show-current` prints the branch you're on.
- Check the branch before every commit, because each commit goes onto the current branch.
- `git log <branch> --format=%s` lists the subjects on that branch, whatever branch you're on.
- Switching branches changes the files in the working folder to match the branch's latest commit.
- A detached HEAD means you're on a commit rather than a branch, so new commits can be lost. Switch to a branch first.
- Short, descriptive branch names, in lowercase with hyphens, are the easiest to read.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes` with `git switch -c notes`.
4. Add the line `Second section` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add second section`.
5. Switch back to `main` with `git switch main`.
6. Print `Current: ` followed by the current branch, then print the subjects of `main` with `Write-Output (git log --format=%s)`.

The expected output is two lines: `Current: main` and `Add practice notes`. The second commit is on `notes`, so it doesn't appear here.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
You want to start a new line of work from the current commit, and move onto it. Which command does that?
○ git branch-new notes
→ That isn't a Git command. Creating and switching is one command with a switch.
◉ git switch -c notes
→ Right. The -c creates the branch at the current commit, and switches to it.
○ git commit -m notes
→ That makes a commit with the message notes. It doesn't create a branch.
```

```quiz
You committed on notes, then switched to main and ran git log --format=%s. Why doesn't your commit appear?
○ The commit was lost when you switched, so it has to be made again.
→ Nothing is lost by switching. The commit is still on notes.
○ Git hides commits from the log until the branch is merged.
→ Git doesn't hide commits. The log shows what the branch actually contains.
◉ Each branch has its own history, and your commit is on notes, not on main.
→ Right. A commit moves only the branch you were on when you made it.
```

```quiz
What is the most useful first check before you make a commit?
◉ git branch --show-current, to confirm which branch the commit will go onto.
→ Right. Every commit goes onto the current branch, so that's the check that matters first.
○ Whether the commit message is long enough to explain the change.
→ That matters, but it's not the first check. Make sure the commit lands on the right branch first.
○ git log --format=%s, to see how many commits there are.
→ The log shows history, not where your next commit will go.
```

---
