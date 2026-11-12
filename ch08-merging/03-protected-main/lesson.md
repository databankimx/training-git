# 3. Protected Main

On our team, `main` is a protected branch. Nobody commits to it directly, and nothing reaches it until it has been reviewed. A change is made on its own branch, proposed as a pull request, and a codeowner reviews it before it's merged. A codeowner is the person named as responsible for the files the change touches, so the review comes from someone who knows those files.

This step explains the rule, why it exists, and what your part in it is. The exercise checks the step you control locally, which is making sure your work is on a branch before you propose it.

## What the rule means for you

Three things follow from the rule.

- **You work on a branch.** Every change starts on a branch with a name that says what it does, such as `add-setup-steps`.
- **You propose the branch.** The branch is shared with the hosting service, and a pull request asks for it to be merged into `main`.
- **A codeowner reviews it.** The reviewer checks the change against the files it touches, and the merge happens only after that review is approved.

Because `main` is protected, the hosting service refuses a direct push to it. The refusal is the rule working, and the fix is always the same: move the work onto a branch, then propose it.

## What Git does and doesn't do

Git itself knows nothing about pull requests, protected branches, or codeowners. Those are features of the hosting service that holds the shared repository, and each service provides them under its own names and screens. Other hosts have similar features, and the words may differ. The rule and its purpose are the same wherever it applies.

The merge that finally brings the work into `main` is still a Git merge, and it's the one you learned in this chapter. The difference is who presses the button and when. Git does the combining, and the service decides whether the change is allowed in.

> **Aside: the file that names the owners.**
> A repository can include a file that lists which people or teams own which paths. The hosting service reads that file to decide who must review a change. It lives in the repository like any other file, so it's reviewed and versioned with the code it describes. Ask the team which file is used, and read it before you propose a change to files you don't know.

## Why the rule exists

A protected main keeps the history of the shared work reliable. Everyone reads `main` as the record of what was agreed, so a change that skipped review, or a half-finished experiment, would be hard to tell apart from a reviewed one. The review also catches mistakes that the author can't see in their own work, and it spreads knowledge of the code around the team.

## Checking before you propose

Before a branch is proposed, confirm that you're on it, and not on `main`. This exercise checks that habit: a script that refuses to treat `main` as ready for review, and reports the branch when it's ready.

## Try it

This exercise creates a branch with one commit, then checks whether the current branch is ready to propose. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, add `Second section` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add second section`.
4. Use an `if` line that tests whether `(git branch --show-current)` equals `main`. When it does, print `Work on a branch first`. When it doesn't, print `Ready for a pull request: ` followed by the current branch, using `$(...)` inside double quotes.

The expected output is `Ready for a pull request: notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Running the check while still on `main`. The script then prints `Work on a branch first`, which is the answer the rule wants. Move to a branch, and the check passes.

---
