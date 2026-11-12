# 13. Capstone

This is where the tutorial comes together. You'll follow one small shared document from its first version to a resolved, explained history, using nearly everything from the chapters before it: snapshots, status, diffs, branches, merges, conflicts, commit messages, and history filters.

The story has two people, Alice and Bob, and one document, `DOCUMENT.md`. Both of them edit the status line on their own branches. Their edits collide, a conflict appears, and the person resolving it writes down why the final text says what it does. The history is the record a later reader will rely on.

## The story

1. **Start the document.** A project notes file exists on `main`, with one status line.
2. **Two edits, one conflict.** Alice and Bob each change the status line on their own branch. Alice's change is merged first, and Bob's collides with it.
3. **Explain the decision.** The conflict is resolved with a text that holds both edits, and the commit message gives the reason.
4. **Read the history.** The first-parent history tells the story of `main` to someone who wasn't there.

## What the team would do

On a team, Alice and Bob would each work in their own clone, push a branch, and propose it through a pull request, as Chapter 8 described. Review would happen there, and a codeowner would approve the change before it reached `main`. This capstone uses local branches so every step can be checked, and each habit it teaches carries over to that setting unchanged.

## Try it

This chapter has four steps. The first starts the document, the second makes the two edits and the conflict, the third explains the decision in the history, and the fourth is the summary, with three quizzes. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
