# 0. Introduction

Most people have, at some point, saved a document as `report_final.docx`, then `report_final2.docx`, then `report_final_REALLY_final.docx`. Each copy holds a bit of history, and none of them tells you what changed between the copies, or why. Version control is the tool that solves that problem, and Git is the version control system this collection uses.

This tutorial teaches Git from the first snapshot to sharing work with other people. You'll save, compare, undo, branch, merge, resolve a disagreement, and share, and by the end you'll be able to read the history of a shared document and understand every decision in it.

## What Git does

Git keeps a history of snapshots. Each time you commit, Git records the state of your files at that moment, with a message saying why you made the change. The history is a chain of those snapshots, and you can move back along it, compare any two points, or branch off to try something without touching the rest.

Git is not a backup, although it protects your work. It's not a shared drive, although it shares your work. It's a record of change, and that record is what makes review, undo, and collaboration possible.

## Why documents belong with code

The Markdown tutorial showed you that Markdown is plain text. Plain text is what Git is built for. A change to a Markdown file shows up as lines removed and lines added, so a reviewer can read exactly what changed, in seconds.

A Word document is different. Git can store it, but it can't show you the change inside it, so the history says only that the file changed. Keeping your documents as Markdown, next to the code they describe, means the history of the words and the history of the code can be read in the same way.

## Three areas

Every change moves through three places. Learning to see which place a change is in is most of what this tutorial teaches.

- **The working folder** holds the files as you see and edit them.
- **The staging area** holds the changes you've chosen to include in the next snapshot.
- **The history** holds every snapshot you've committed.

A change starts in the working folder, moves to the staging area when you add it, and becomes part of the history when you commit it. Each chapter tells you which of the three you're looking at.

## Repositories, and where they live

A repository is a folder that Git tracks. Git keeps its records in a hidden folder called `.git`, and the rest of the folder is your work. You'll make a repository from scratch in Chapter 2, and clone one from elsewhere in Chapter 10.

Git works on your computer without anything else. A hosting service, such as the one your team uses, is a place where repositories are shared. The lessons are generic, so they apply to any hosting service, and the features of a particular service are not covered here. Your team's own tools and rules apply to anything you share.

## The practice repository

Every exercise in this tutorial runs in one folder, `C:\Development\git-practice`. The lessons use that path, and you can read it as your own path if you change it. Two buttons treat that folder differently, so read this part before you press either one.

**Run** keeps what's in the practice folder, so you can try commands and look at the results.

**Check** deletes everything in the practice folder, then runs your script, then compares the result with the expected output. Check always starts from an empty folder, so anything you made there by hand is removed when you press it. If you want to keep something, copy it somewhere else first.

The reader sets a practice identity for every run. It's a made-up name and address, so your commits in the practice folder don't carry anyone's real name. You'll set your own identity in Chapter 1, when you choose to.

## What you'll need

Nothing beyond the setup script. It installs Git, PowerShell 7, and the reader, and it doesn't ask you for an account or a password. You won't need a hosting account for any exercise. Chapter 10 has an optional section on using one, and it's clearly marked as optional.

## Rules your team sets

Git will happily commit anything you tell it to, including a password, a key, or a file that belongs to someone else. The team's policy decides what may be committed, and you should check it before you commit anything you're unsure about. Chapter 6 covers the habits that keep the wrong file out of a repository.

## How the tutorial works

Each chapter has a short introduction, a few steps, and a summary with three quizzes. Most steps end with an exercise. You type a script in the Source pane, press Run to see the output, or Check to compare it with the expected result. Commands are typed in PowerShell 7, which the PowerShell tutorial teaches, so if a line puzzles you, that tutorial covers the terminal.

When you're ready, move on to Chapter 1.

---
