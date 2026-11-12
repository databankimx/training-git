# 1. Writing a Message With a Body

A commit message has two parts, and Git keeps them apart. The subject is the first line, and the body is everything after a blank line. `git commit -m` can be given twice, and the second value becomes the body, with a blank line between the two.

## A subject and a body

Each `-m` adds a paragraph to the message. The first paragraph is the subject, and the second is the body.

~~~powershell
git commit -q -m "Add practice notes" -m "The README holds notes for the practice repository, so the next reader knows what it is for."
~~~

~~~text
Output:

(nothing)
~~~

The commit is saved with both parts. The subject stays short, and the body explains the reason, in whatever length the reason needs.

## Reading the two parts

`%s` is the subject, and `%b` is the body. Asking for each one separately shows where the message divides.

~~~powershell
git log -1 --format=%s
git log -1 --format=%b
~~~

~~~text
Output:

Add practice notes
The README holds notes for the practice repository, so the next reader knows what it is for.
~~~

The subject is the line you see in `git log --oneline` and most tools. The body appears when someone opens the commit, which is where the reasoning belongs.

> **Aside: the subject that became a paragraph.**
> A subject that runs on for a sentence, or a body that's crammed into the subject line, makes every list of history harder to read. Keep the subject to one short line that says what the commit does, and move the reasons into the body.

## Try it

This exercise writes a commit with a subject and a body, then prints both parts. The check compares the two lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, and stage it.
3. Commit quietly with `-m "Add practice notes"` and a second `-m` of `Notes for the practice repository.`
4. Print `Subject: ` followed by `git log -1 --format=%s` inside `$(...)`.
5. Print `Body: ` followed by `(git log -1 --format=%b).Trim()` inside `$(...)`.

The expected output is two lines: `Subject: Add practice notes` and `Body: Notes for the practice repository.`

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Putting the body in the same `-m` as the subject, separated by a line break inside the quotes. It works in some shells and not others, and it's harder to read in a script. Use two `-m` switches.

---
