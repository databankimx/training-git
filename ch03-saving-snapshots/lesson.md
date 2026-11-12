# 3. Saving Snapshots

A commit is Git's word for a snapshot: the state of your files at one moment, with a message saying why you saved it. Making commits is the core of Git, and most of what you do afterwards builds on it. This chapter covers the two steps every commit needs, staging and committing, and shows you how to read the history that results.

## The two steps

Saving a snapshot takes two steps, because Git lets you choose what goes in it.

1. **Stage** the changes you want to include, with `git add`. Staging moves them into the staging area.
2. **Commit** the staging area, with `git commit`. That turns the staged changes into a snapshot in the history.

The separation is deliberate. You may have edited three files and want to save only two of them, or you may want to save a fix separately from a new feature. Staging is how you say which changes belong together.

## What a commit records

Each commit holds the whole state of the files at that moment, not only what changed, so Git can rebuild any snapshot. It also holds the author, the time, the message, and a pointer to the commit before it. That pointer is what makes the history a chain, and it's why a commit can't be changed without changing everything after it.

You won't see that structure directly. The commands show you the parts you need, which are the message and the order.

## The message

A commit message is the explanation a future reader will see first. Git asks for one with `-m`, and a good message starts with a short subject, written as a short instruction, such as `Add practice notes`. Chapter 11 covers what makes a message good, and the examples here keep to the subject.

## Reading the history

`git log` lists the commits, newest first. Its default output includes a long hash for each commit, which is different every time, so the exercises print only the subject, using a format.

~~~powershell
git log --format=%s
~~~

~~~text
Output:

Add practice notes
~~~

`%s` means "the subject". The format keeps the output short and repeatable, and it's the form this tutorial uses when it shows history.

## Try it

This chapter has three steps. The first stages a file, the second commits it, and the third makes two commits and reads the history. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first, so each check starts with no repository.

---
