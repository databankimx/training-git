# 11. Good History

A history is only as useful as its messages and its commits. A repository full of commits named `fix`, `update`, and `stuff` can't tell anyone why anything changed, and a single commit that changes twenty unrelated things is almost impossible to review. This chapter covers what makes history readable: a clear message, commits that each do one thing, and the ways to find what you need afterward.

## What a good message says

A commit message has a subject and, when needed, a body. The subject is one short line, written as an instruction, such as `Add practice notes`. The body is for the reason, and for anything a reader needs that the subject can't hold.

The subject answers "what does this commit do?" and the body answers "why was it needed, and what did we consider?". A reader who only sees subjects should still know roughly what happened, and a reader who opens the body should learn why.

## Small commits

A commit should do one thing. A commit that adds a feature, fixes an unrelated bug, and reformats a file is three commits that were never separated. Small commits are easy to review, easy to revert, and easy to find later, because each subject describes exactly one change.

Staging is the tool for this, as Chapter 3 showed. Stage the files for one change, commit, then stage the next change.

## Finding things later

Three tools answer most questions about history.

- `git log -- <path>` lists the commits that touched one file.
- `git log -S "<text>"` lists the commits that added or removed a piece of text.
- `git blame <path>` shows, for each line of a file, the commit that last changed it.

`git blame` prints a hash, an author, and a date for every line, so its output differs from one machine to another. The exercises use the first two, which print only what the commits say.

## Try it

This chapter has four steps. The first writes a commit with a body, the second makes small commits, the third finds commits by file and by text, and the fourth puts the steps together. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
