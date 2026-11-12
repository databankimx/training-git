# 10. Remotes and Sharing

Everything so far has lived in one folder on one computer. Sharing is what turns a repository into a team's record. A remote is another copy of the repository, somewhere else, that you can send your commits to and fetch other people's commits from. This chapter shows how remotes work, using a copy on your own computer, so you can see every step without an account or a network.

## What a remote is

A remote is a named address for another copy of the repository. The name `origin` is the usual one, and it's a convention, not a rule. Your repository and the remote hold the same kind of history, and they exchange commits to keep in step.

A remote copy is usually bare. A bare repository holds the history and no working folder, because nobody edits files in it directly. It exists to receive pushes and serve fetches, and it's the kind of repository a hosting service keeps.

## The four moves

Four operations move work between copies.

- **Clone** makes a new copy of a repository, with its history, and sets up the remote for you.
- **Fetch** brings in new commits from the remote, without changing your branches.
- **Pull** fetches, then merges what came in into the branch you're on.
- **Push** sends your commits to the remote, so others can fetch them.

Fetch is the safest of the four, because it changes nothing you have made. Pull and push change branches, so read `git status` before you use either.

## A local remote

This tutorial uses a bare repository in the practice folder as the remote. The commands are the same ones you would type against a hosted repository, and the bare repository behaves the same way. The difference is that nothing leaves your computer, so every exercise is repeatable. The reader ignores the `shared.git` and `clone` folders in its own runs, so they don't show up as untracked files in `git status`.

Chapter 10's last section describes the hosted case, with the same commands, and it's marked optional.

## Try it

This chapter has four steps. The first names a remote and pushes to it, the second clones it, the third has a second copy push a change that the first one pulls, and the fourth puts the moves together. The optional hosted-remote section comes at the end of the summary, with no exercise. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
