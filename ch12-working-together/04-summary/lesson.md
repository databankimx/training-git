# 4. Summary: Working Together

You can check the state of your work before you start, pull before you push, and read a change the way a reviewer would. None of that needs a command you haven't seen, and all of it keeps a shared history trustworthy. Most of the trouble on a team comes from skipping one of these checks, so make them a habit.

## What you learned

- Three questions start every session: which branch, is the folder clean, and what has the shared copy received.
- `git pull --ff-only` brings in shared work, and refuses to guess when the histories have diverged.
- `git rev-list --count HEAD..origin/main` counts the commits the shared copy has and you don't.
- A push is refused when the shared copy has commits you lack. Pull, read what came in, and push again.
- Forcing a push to get past a refusal overwrites a colleague's work, and that's never acceptable on a shared branch.
- `git log main..notes` lists the commits a branch adds, which is the first thing a reviewer reads.
- `git diff --stat main notes` summarizes the size of the change. Read it against the subject.
- Review happens through pull requests on many teams. That's a feature of the hosting service, and the habits under it are Git's.
- The team's own tools and rules apply to every shared change, and they're the first thing to check when you're unsure.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the bare repository `shared.git`, add it as `origin`, push with `git push -q -u origin main`, and clone it into `C:\Development\git-practice\clone` with `git clone -q`.
4. In the clone, add `Teammate note` to its `README.md`, stage it, commit it quietly with `Add teammate note`, and push with `git push -q`. Return to `C:\Development\git-practice`.
5. Fetch with `git fetch -q origin`, then print `Behind: ` followed by `git rev-list --count HEAD..origin/main` inside `$(...)`.
6. Pull with `git pull -q --ff-only origin main`, then print `Behind after pull: ` followed by the same count.
7. Use an `if` line with `-not (git status --short)` to print `Status: clean`.

The expected output is three lines: `Behind: 1`, `Behind after pull: 0`, and `Status: clean`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
Your push was refused, and the message says the shared copy has commits you don't have. What is the right response?
○ Force the push, so your commits replace the others.
→ That overwrites a colleague's work. It's the one response a shared branch must never allow.
◉ Pull, read what came in, combine if needed, and push again.
→ Right. The refusal is a signal, and the way through is to bring the shared work in first.
○ Delete your local branch and copy the files somewhere else.
→ That throws away your work without solving the refusal. The shared history still needs combining.
```

```quiz
You want to see the commits a branch adds before you review it. Which command gives that list?
◉ git log main..notes
→ Right. The range lists the commits on notes that aren't on main, which is what a merge would bring in.
○ git log notes..main
→ That lists the commits on main that notes lacks. It's the wrong side for a review.
○ git status --short notes
→ Status describes your folder, not the commits a branch adds.
```

```quiz
Why does a team's review habit matter more than the commands themselves?
○ Because Git can't check anything without a review, so the review is required.
→ Git can check many things. The review is about judgment, and Git can't supply that.
○ Because review is the only way to make a commit, and every commit needs one.
→ A commit doesn't need a review to exist. A review is the team's check before a change reaches shared work.
◉ Because a reviewer reads the change for what it does, which Git can show but not judge.
→ Right. The commands show the change, and the reviewer decides whether it is right.
```

---
