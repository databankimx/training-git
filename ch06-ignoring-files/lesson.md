# 6. Ignoring Files

A working folder collects things that should never be saved. Logs grow every time a program runs. Build output is regenerated from the source. Editors leave backup files behind, and dependency folders can hold thousands of files that someone else can download again. If Git tracked all of it, the history would fill with noise, and the important changes would be hard to find.

`.gitignore` is the file that tells Git what to leave alone. This chapter shows how it works, and it's clear about the one kind of file that never belongs in a repository at all.

## How .gitignore works

A `.gitignore` file lives in the repository's folder, and it lists patterns. Each line is one pattern, and any file whose name matches a pattern is hidden from `git status`, so it can't be added by accident.

~~~text
*.log
build/
node_modules/
~~~

`*.log` matches every file that ends in `.log`. `build/` matches a folder called `build`, and everything inside it. `node_modules/` does the same for a folder that holds downloaded packages. The star matches any text, as it did in the PowerShell tutorial.

The `.gitignore` file is itself a file, so you commit it like any other. Everyone who clones the repository gets the same rules.

## Ignoring is not hiding a secret

A `.gitignore` rule keeps a file out of `git status`, which keeps it out of a casual `git add .`. It doesn't remove a file that has already been committed, and it doesn't make a file private. A file that's been committed once stays in the history, even after it's ignored.

That's why the rule for secrets is stronger than a pattern. Passwords, access keys, and private certificates never go into a repository, even temporarily, and even in a file that's ignored. If one is committed by mistake, the history keeps it, so the fix has to be done with the people who run the repository, not with a quick delete.

## What the team's policy decides

Your team's policy sets what may be committed to a repository, and the lesson isn't a substitute for it. Read the policy before you commit anything you're unsure about, and ask when it doesn't say. A file can be harmless in one repository and forbidden in another, and the policy is the place that difference is recorded.

> **Aside: the file already in the history.**
> Adding a pattern to `.gitignore` doesn't remove a file that's already tracked. Git keeps tracking it until it's removed from the index, which is a separate step, and one that's easy to get wrong. If you find a tracked file that should be ignored, ask the people who maintain the repository before changing it.

## Try it

This chapter has three steps. The first writes a `.gitignore` and shows a file being hidden, the second is about files that must never be committed, and the third puts them together. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
