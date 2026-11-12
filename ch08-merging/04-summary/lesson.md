# 4. Summary: Merging

You can bring a branch into `main` in two ways, and you can tell which one happened from the history. A fast-forward moves the name forward, and a merge commit records two lines of work joining. You also know how the team protects `main`, and what Git does and doesn't handle in that process.

## What you learned

- A fast-forward happens when the target branch has no commits of its own. Git moves its name forward, and no commit is added.
- A merge commit happens when both branches have new commits. It has two parents, one from each branch.
- `git merge -q` merges quietly. `--no-edit` accepts the standard merge message without an editor.
- `git log -1 --format=%s` prints the subject of the newest commit only.
- `git rev-list --parents -n 1 HEAD` lists a commit and its parents, and counting them tells you whether a commit is a merge.
- On our team, `main` is protected. Changes arrive by pull request, and a codeowner reviews them before the merge.
- Pull requests, protected branches, and codeowners are features of the hosting service, not of Git. Other hosts have similar features under other names.
- Check that you're on a branch, and not on `main`, before you propose a change.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, add `Second section` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add second section`.
4. Switch back to `main`, and merge with `git merge -q notes`.
5. Print `Latest on main: ` followed by the subject of the newest commit, using `git log -1 --format=%s` inside `$(...)`.
6. Count the parents of `HEAD` with `$parents = (git rev-list --parents -n 1 HEAD).Split(" ").Count - 1`, then print `Parents: ` followed by `$parents`.

The expected output is two lines: `Latest on main: Add second section` and `Parents: 1`. The merge was a fast-forward, so the newest commit has one parent and no merge commit was made.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
After a merge, the newest commit has two parents. What kind of merge was it?
○ A fast-forward, because fast-forwards always have two parents.
→ Not quite. A fast-forward adds no commit, so the newest commit is the branch's own.
◉ A merge commit, because both branches had commits of their own.
→ Right. Two parents means two lines of work came together.
○ A rebase, because rebases always produce two parents.
→ A rebase is a different operation, and this chapter doesn't cover it.
```

```quiz
Which statement about protected branches is correct?
◉ The hosting service enforces protected branches, and Git itself has no notion of them.
→ Right. The rule lives on the hosting service, and the merge still uses Git.
○ Git enforces protected branches, so a local merge into main is always refused.
→ Git doesn't enforce them. A local merge into main works on your own machine.
○ A protected branch can't be merged, even by a codeowner.
→ A codeowner's review is how a protected branch is merged. The review is the rule's purpose.
```

```quiz
You're ready to propose a change, and the current branch is main. What should you do first?
○ Propose the change from main, because main is the branch that gets reviewed.
→ Changes are proposed from their own branch. Proposing from main is the mistake the rule guards against.
○ Merge into main locally, so the change is already in place when it's reviewed.
→ That's exactly what protecting main prevents. The review has to come before the merge.
◉ Move the work onto its own branch, then propose that branch.
→ Right. Every change starts on a branch, and the branch is what gets proposed.
```

---
