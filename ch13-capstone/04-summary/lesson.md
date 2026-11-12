# 4. Summary: The Capstone

You've followed one shared document from its first version to a resolved, explained history. Along the way you used the snapshot model, status and diffs, branches, merges, conflict resolution, commit messages with bodies, and the history commands that read a story back. Those are the skills a team relies on every day, whatever hosting service it uses.

## What the story used

- **Snapshots.** Each step committed a state of the document with a subject, so every change had a place in the history.
- **Branches.** Alice and Bob each worked on their own line, and their edits stayed apart until they were merged.
- **Merges.** Alice's edit fast-forwarded into `main`, and Bob's produced the conflict.
- **Conflicts.** Git stopped and asked for a decision, and the decision was written into the file and then committed.
- **Messages.** The subject said what the document now says, and the body said why.
- **History.** `--first-parent` told the story of `main` to a newcomer, and `%b` gave the reason behind the current text.

## What the team would add

On a team, each person would work in a clone, push a branch, and propose it as a pull request, which a codeowner reviews before the change reaches `main`. The reviewer would read the diff and the messages you've just learned to write, and the history would show the reviewed decision. That is the team's process, and the habits underneath it are the ones in this tutorial.

## Try it

This exercise repeats the whole story and checks the result. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `DOCUMENT.md` with `@("# Project notes", "Status: draft")`, stage it, and commit it quietly with `Start project notes`.
3. Create `alice`, set the status to `Status: in review (Alice)`, commit it quietly with `Update status from Alice`, and switch to `main`.
4. Create `bob`, set the status to `Status: approved (Bob)`, commit it quietly with `Update status from Bob`, and switch to `main`.
5. Merge with `git merge -q alice`, then `git merge --no-edit bob *> $null`.
6. Resolve with the status `Status: approved, pending Alice's review`, stage it, and commit quietly with the subject `Combine status updates from Alice and Bob` and a body of `Bob approved the draft, and Alice's review is still open, so the status records both.`
7. Print the document with `Get-Content -Path "C:\Development\git-practice\DOCUMENT.md"`.
8. Print `History: ` followed by the number of first-parent commits, using `(git log --first-parent --format=%s).Count` inside `$(...)`.

The expected output is three lines: `# Project notes`, `Status: approved, pending Alice's review`, and `History: 3`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the capstone. Pick an answer, and read the explanation whichever way it goes.

```quiz
Why did the resolution's commit need a body, not just a subject?
○ Because Git refuses to commit a merge without a body.
→ Git doesn't require a body. The reason is a matter of practice, not a rule of the command.
◉ Because the reason for the status text is what a future reader needs, and the subject can't hold it.
→ Right. The subject says what the document now says, and the body keeps the reasoning with the change.
○ Because the body replaces the file, so the document is written from it.
→ The body is a note in the history. It doesn't change the file.
```

```quiz
A newcomer wants the story of main without the branches that were merged into it. Which command gives it?
◉ git log --first-parent --format=%s, because it follows only the main line.
→ Right. --first-parent skips the branches merged into main and shows the line the document followed.
○ git log --format=%s, because it always shows only the main line.
→ That shows every commit reachable from main, including those brought in by merges.
○ git branch --show-current, because it lists the commits on the current branch.
→ That prints one name, the branch you're on. It doesn't list history.
```

```quiz
On a team, where would a change like Bob's usually be proposed, and who would check it before it reached main?
○ Directly on main, and the team would review it afterward if they noticed.
→ On a protected main, a direct change isn't accepted. The change goes through review first.
○ In a file named after the person, so the change never meets anyone else's work.
→ Separate files would avoid some conflicts, but the review still happens through a branch and a pull request.
◉ On its own branch, as a pull request, and a codeowner would review it before it was merged.
→ Right. The rule is the team's, and the review and merge happen on the hosting service, with the same Git habits underneath.
```

---
