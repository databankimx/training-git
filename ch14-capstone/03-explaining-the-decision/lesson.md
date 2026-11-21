# 3. Explaining the Decision

The resolution is the decision, and the commit is where it's recorded for everyone who comes later. A resolved conflict with a vague message hides the reason, and the next person to read the status line will have to guess why it says what it says. This step resolves the conflict and writes the reason into the commit, then reads the history the way a newcomer would.

## Resolving with a reason

Both edits are partly right. Bob approved the draft, and Alice's review is still open, so the status should say both. The file gets that text, and the commit explains it.

~~~powershell
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: approved, pending Alice's review")
git add DOCUMENT.md
git commit -q -m "Combine status updates from Alice and Bob" -m "Bob approved the draft, and Alice's review is still open, so the status records both."
~~~

~~~text
Output:

(nothing)
~~~

The subject says what the commit does. The body says why, in the form a reader needs when they meet the status line months from now.

## Reading the history of main

`git log --first-parent` follows only the main line, and skips the branches that were merged into it. For a newcomer, that's the story of the document, with each change to `main` listed in order.

~~~powershell
git log --first-parent --format=%s
~~~

~~~text
Output:

Combine status updates from Alice and Bob
Update status from Alice
Start project notes
~~~

The newest entry is the resolution, the one before it is Alice's edit, and the first is the starting version. Bob's branch is still in the history, but it doesn't clutter this view. Use the full log when you need every branch, and `--first-parent` when you need the story.

## Reading the reason

The body is the part a newcomer reads to understand the status line.

~~~powershell
git log -1 --format=%b
~~~

~~~text
Output:

Bob approved the draft, and Alice's review is still open, so the status records both.
~~~

> **Aside: the message that only says resolved.**
> A subject such as `Resolve conflict` tells the next reader that a conflict existed, and nothing about the decision. Name what the document now says, and put the reason in the body.

## Try it

This exercise repeats the two edits and the conflict, resolves it with the combined text, and prints the first-parent subjects and the reason. The check compares the four lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `DOCUMENT.md` with `@("# Project notes", "Status: draft")`, stage it, and commit it quietly with `Start project notes`.
3. Create `alice`, set the status to `Status: in review (Alice)`, commit it quietly with `Update status from Alice`, and switch to `main`.
4. Create `bob`, set the status to `Status: approved (Bob)`, commit it quietly with `Update status from Bob`, and switch to `main`.
5. Merge with `git merge -q alice`, then `git merge --no-edit bob *> $null`.
6. Resolve by setting the status to `Status: approved, pending Alice's review`, staging the file, and committing quietly with `-m "Combine status updates from Alice and Bob"` and a second `-m` of `Bob approved the draft, and Alice's review is still open, so the status records both.`
7. Print the first-parent subjects with `Write-Output (git log --first-parent --format=%s)`.
8. Print `Why: ` followed by `(git log -1 --format=%b).Trim()` inside `$(...)`.

The expected output is four lines: `Combine status updates from Alice and Bob`, `Update status from Alice`, `Start project notes`, and `Why: Bob approved the draft, and Alice's review is still open, so the status records both.`

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Committing the resolution with only a subject. The `Why:` line is then empty, and the check fails on it, which is the point: the reason belongs in the history. Add the body with a second `-m`.

---
