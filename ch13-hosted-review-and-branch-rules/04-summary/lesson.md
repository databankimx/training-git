# 4. Summary: Hosted Review and Branch Rules

A hosting service can protect `main`, require a review, require passing checks, and name owners for particular paths. None of that is Git, and the rules belong to the host and to your organization. Your job is to know which ones apply to you, and to work within them.

## What you learned

- A protected branch refuses direct commits to `main`, so changes arrive as proposed changes.
- A proposed change shows the commits its branch adds. On GitHub it's called a pull request, and other hosts have their own names for it.
- `git log main..branch --format=%s` lists the commits a proposal adds, which is the first thing to check before you push.
- A required check must pass before a change can be approved, so read a failing check's report before you change anything.
- A codeowners file names who must review changes to which paths. The last matching line wins.
- Some organizations allow only administrators to create repositories. Ask before you assume you can.
- Your organization's rules are its own. Follow them, and ask your team which ones apply before you push.

## Worked example

This example creates a branch, commits on it, then prints the branch name and the commits it adds. It runs in a scratch folder, so the practice folder is untouched. Read it, then write your own script in the practice folder.

~~~powershell
New-Item -ItemType Directory -Force -Path "C:\Development\scratch-example" | Out-Null
Set-Location "C:\Development\scratch-example"
git init -q -b main
git config user.name "Example Person"
git config user.email "example@example.invalid"
Set-Content -Path "draft.txt" -Value "Hello"
git add draft.txt
git commit -q -m "Add draft"
git switch -q -c hotfix-typo
Add-Content -Path "draft.txt" -Value "Typo fixed"
git add draft.txt
git commit -q -m "Fix typo in draft"
Write-Output (git branch --show-current)
Write-Output (git log main..hotfix-typo --format=%s)
~~~

~~~text
Output:

hotfix-typo
Fix typo in draft
~~~

This is the exercise's pattern in a different setting: branch, commit, then check the branch and its commits before you propose anything.

## Try it

This exercise puts the chapter together, using only commands you have already seen. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `feature/hosted-review` with `git switch -q -c feature/hosted-review`.
4. Add the line `Hosted review note` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add hosted review note`.
5. Print the current branch with `Write-Output (git branch --show-current)`.
6. Print the commits the branch adds with `Write-Output (git log main..feature/hosted-review --format=%s)`.

The expected output is two lines: `feature/hosted-review` and `Add hosted review note`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
A teammate says they committed straight to main on their own computer and nothing was shared. Why does the host still refuse the same change when it's pushed?
○ Git doesn't allow commits to main at all.
→ Git does allow it locally. The refusal comes from the host's protected branch rule.
◉ The host protects main, so a change must arrive as a proposed change that others can review.
→ Right. The protection belongs to the host, so the change goes on a branch and is proposed for merging.
○ The host refuses any change made on a laptop.
→ The host checks what is pushed, not where it was made. Any direct push to a protected main is refused.
```

```quiz
A required check reports a failure on your proposed change. What is the right response?
○ Approve the change anyway, because the reviewer can override the check.
→ Overriding a required check defeats the rule the team set. Fix the problem instead.
◉ Read the report, fix what it names, and let the check run again.
→ Right. The report usually says what to fix, and the check must pass before approval.
○ Remove the check from the repository, so the change can merge.
→ Removing a required check is a change to the team's rules. Only the people who set them should make it.
```

```quiz
A codeowners file has these lines in order: `* @example-owner` and then `.github/workflows/ @example-platform-team`. Who must review a change to `.github/workflows/ci.yml`?
○ @example-owner, because the first line matches everything.
→ The first line does match, but the last matching line wins, so the second line takes precedence.
◉ @example-platform-team, because it is the last matching line.
→ Right. When more than one line matches, the last one is the owner.
○ Both owners, always, because the file names both.
→ The last matching line decides. The file doesn't require both owners for every match.
```

---
