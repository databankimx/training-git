# 4. Seeing Changes

Saving snapshots is only useful if you can see what changed between them. `git diff` compares the working folder with the last snapshot, or with the staging area, and shows the difference line by line. It's the command reviewers rely on, and it's the one that tells you what you're about to save before you save it.

## What a diff shows

A diff marks each line that differs. A line with a minus sign was removed, a line with a plus sign was added, and unmarked lines around them give the context. Here's a change to a README: one line was added at the end.

~~~text
Output:

diff --git a/README.md b/README.md
index 3f2c1a9..7b0e4d2 100644
--- a/README.md
+++ b/README.md
@@ -1 +1,2 @@
 # Practice notes
+Second section
~~~

The line beginning with `+` is the new text, and the line with the `@@` is a position marker. The `index` line holds two short hashes, which are different every time, so the lessons don't compare the full diff. The summary forms in the exercises are the ones to check against.

## Reading the lines

A few rules make most diffs readable.

- A line that starts with `-` is in the old version and not the new one.
- A line that starts with `+` is in the new version and not the old one.
- A changed line appears twice, once with `-` and once with `+`, so you can see the before and after.
- Lines without a sign are context, and they're there to show you where the change sits.

A diff that's long is hard to read, so review changes in small pieces. A commit that changes one thing produces a diff that's quick to check.

## Naming what changed

Two switches give you the answer without the lines. `--name-only` lists the files that differ, one per line. `--stat` lists them with a count of changed lines, and a summary at the end.

~~~powershell
git diff --name-only
~~~

~~~text
Output:

README.md
~~~

~~~powershell
git diff --stat
~~~

~~~text
Output:

 README.md | 1 +
 1 file changed, 1 insertion(+)
~~~

The leading space in the `--stat` lines is part of Git's layout, and the checks compare it exactly. Both forms have no hashes, so they repeat on every machine.

## Try it

This chapter has three steps. The first compares a changed file with the last snapshot, and the second compares what's staged. The third puts both together. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
