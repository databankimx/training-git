# 3. Reading a Change as a Reviewer

A reviewer reads the change before it's merged. They don't need to know everything about the code, but they do need to see what the change says it does, which files it touches, and how big it is. Git gives you each of those answers without opening an editor, so you can review a branch from the command line before you ask anyone else to.

## The commits a branch adds

`git log main..notes` lists the commits that are on `notes` but not on `main`. That's the set of commits a merge would bring in, and it's the first thing a reviewer reads.

~~~powershell
git log main..notes --format=%s
~~~

~~~text
Output:

Add review note
~~~

One subject, one change. The subject says what the change does, so a reviewer knows what to look for before they open a single file.

## The files and size of the change

`git diff --stat main notes` compares the two branches, and reports each changed file with a count of lines. It's a summary, so you can judge the size of the change at a glance.

~~~powershell
git diff --stat main notes
~~~

~~~text
Output:

 README.md | 1 +
 1 file changed, 1 insertion(+)
~~~

One file, one line added. If the summary had shown twenty files and a thousand lines under a subject about a typo, the mismatch would be the first thing to question. Read the summary against the subject, and a reviewer has already learned a lot.

## Reading the lines

After the summary, the diff shows the lines, as Chapter 4 described. A reviewer reads `+` and `-` lines, checks each against the subject, and looks for anything the subject doesn't mention. The author's job is to make that reading short, and the reviewer's job is to read it carefully.

> **Aside: the review you did not need to do.**
> A change to a file you've never read, with a subject you can't interpret, is a reason to ask questions, not a reason to approve. A review is a judgment about the change, and a reviewer who doesn't understand it should say so, rather than assume it is fine.

## Try it

This exercise makes a change on a `notes` branch, then reads it the way a reviewer would: the commits it adds, and the size of the change. The check compares the three lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create and switch to `notes`, add the line `Review note` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add review note`.
4. Print the commits the branch adds with `Write-Output (git log main..notes --format=%s)`.
5. Print the size of the change with `Write-Output (git diff --stat main notes)`.

The expected output is three lines: `Add review note`, ` README.md | 1 +`, and ` 1 file changed, 1 insertion(+)`. The summary lines begin with a space, which the check compares exactly.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Reversing the branches in the range, as `git log notes..main`. That lists the commits on `main` that `notes` lacks, which is the wrong set for a review. The range reads left to right: the commits on the right that aren't on the left.

---
