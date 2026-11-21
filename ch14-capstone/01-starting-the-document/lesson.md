# 1. Starting the Document

Every shared document starts with one version, committed to `main`, with a message that says what it is. Here the document is a short project note with a title and one status line. The status line is the one Alice and Bob will both change later, so it's worth reading carefully now.

## The first version

Create the file, stage it, and commit it with a clear subject.

~~~powershell
Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: draft")
git add DOCUMENT.md
git commit -q -m "Start project notes"
git log --format=%s
~~~

~~~text
Output:

Start project notes
~~~

The file has two lines, a heading and a status. Everything that follows is a change to one of those lines, so every later commit can be read against this one.

> **Aside: the file everyone edits.**
> A document that many people edit is where conflicts come from, and the usual cure is to keep each part of it small. A short document with a clear structure, one idea per section, produces smaller and clearer conflicts than a long document where everyone writes into the same paragraph.

## Try it

This exercise creates the document, commits it with a subject, and prints the history. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `DOCUMENT.md` with two lines, `# Project notes` and `Status: draft`, using `Set-Content` with `@("# Project notes", "Status: draft")` as the value.
3. Stage it, and commit it quietly with `Start project notes`.
4. Print the history with `Write-Output (git log --format=%s)`.

The expected output is `Start project notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Writing the two lines as one string with a space between them. The document then has one line instead of two, and the status line the next steps change doesn't exist. Use an array, with one string for each line.

---
