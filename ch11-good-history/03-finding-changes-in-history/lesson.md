# 3. Finding Changes in History

A history grows, and the question you bring to it is usually narrow. Which commits touched this file? When did this line of text first appear? Who last changed this line? Git answers each of those with a different tool, and knowing which one to reach for saves a lot of scrolling.

## The history of one file

Give `git log` a path after `--`, and it lists only the commits that changed that file. The `--` separates the options from the path, so a file name is never mistaken for an option.

~~~powershell
git log --format=%s -- README.md
~~~

~~~text
Output:

Add third section
Add practice notes
~~~

Commits to other files, such as the license, don't appear. That's the point: the history of a file is the story of that file, and it can be read on its own.

## The commit that added a piece of text

`git log -S` looks for commits that added or removed a given string. It's the best tool when you remember a phrase and want to know where it came from.

~~~powershell
git log --format=%s -S "Third section"
~~~

~~~text
Output:

Add third section
~~~

The search finds the commit where the number of occurrences of the text changed. It doesn't show the lines, so use `git show` or a diff from Chapter 4 once you know which commit you want.

## Who last changed a line

`git blame` shows, for each line of a file, the commit that last changed it. Here is what it prints, illustrated for a file with one line.

~~~text
Output (illustrative):

a1b2c3d4 (Practice Learner 2026-11-10 09:14:22 +0000 1) # Practice notes
~~~

Each line starts with a short hash, then the author, the date, and the line number, followed by the text. The hash, the date, and the time are different on every computer, so this output is for reading, not for checking. Use `blame` to answer "who changed this, and in which commit?", then read that commit with `git show` to see why.

> **Aside: the blame that blames the formatter.**
> A reformatting commit can make every line look as though it was changed last week, because the whole file was rewritten. When blame points at a formatting change, look at the commit before it, or ask blame to ignore whitespace. The answer is hidden under the noise, so check the commit before you trust the name.

## Try it

This exercise makes three commits, then finds the history of the README and the commit that added the third section. The check compares the three lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create `LICENSE.md` containing `License text`, stage it, and commit it quietly with `Add license note`.
4. Add the line `Third section` to `README.md` with `Add-Content`, stage it, and commit it quietly with `Add third section`.
5. Print the README's history with `Write-Output (git log --format=%s -- README.md)`.
6. Print the commit that added the text with `Write-Output (git log --format=%s -S "Third section")`.

The expected output is three lines: `Add third section`, `Add practice notes`, and `Add third section`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Leaving out the `--` before a file name when the name could also be a branch or a command. Git may read the name as something else, and the history comes back empty or wrong. The `--` tells Git that what follows is a path.

---
