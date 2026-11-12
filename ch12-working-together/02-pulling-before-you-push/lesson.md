# 2. Pulling Before You Push

A push succeeds only when the shared copy has no commits you lack. If a teammate has already pushed, your push is refused, and the way through is always the same: pull, check what came in, and then push. Doing the pull first, before you've committed anything, is the simplest case, because it's a fast-forward and it can't conflict with your work.

## A teammate has pushed

Here the shared copy holds a commit from a teammate, and your repository doesn't have it yet. Your own work is still uncommitted, so there's nothing to combine.

~~~powershell
git fetch -q origin
git log origin/main --format=%s
~~~

~~~text
Output:

Add teammate note
Add practice notes
~~~

`origin/main` shows what the shared copy holds, and your `main` is one commit behind. Read it before you pull, so you know what is about to arrive.

## Pull, then commit, then push

Pull first, so your `main` includes the teammate's commit. Then make your change on top of it, and push.

~~~powershell
git pull -q --ff-only origin main
Add-Content -Path "C:\Development\git-practice\README.md" -Value "My note"
git add README.md
git commit -q -m "Add my note"
git push -q
git log --format=%s
~~~

~~~text
Output:

Add my note
Add teammate note
Add practice notes
~~~

The push was accepted, because your history now includes everything on the shared copy. If you had committed first and pulled afterward, the two histories would have split, and the push would have been refused until you combined them.

> **Aside: the push that is refused for a good reason.**
> A refused push is not an error to fight. It means someone else's work is on the shared copy that you haven't seen. Pull, read what came in, and push again. Forcing the push would replace their commits with yours, and that is the one thing a shared branch must never allow.

## Try it

This exercise sets up a shared copy and a clone, has the clone push a teammate's change, then pulls it into the original, adds its own change, and pushes. The check compares the three lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the bare repository `shared.git`, add it as `origin`, push with `git push -q -u origin main`, and clone it into `C:\Development\git-practice\clone` with `git clone -q`.
4. In the clone, add `Teammate note` to its `README.md`, stage it, commit it quietly with `Add teammate note`, and push with `git push -q`. Return to `C:\Development\git-practice`.
5. Pull with `git pull -q --ff-only origin main`, then add `My note` to `README.md`, stage it, commit it quietly with `Add my note`, and push with `git push -q`.
6. Print the history with `Write-Output (git log --format=%s)`.

The expected output is three lines: `Add my note`, `Add teammate note`, and `Add practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Committing your own change before pulling. The histories then split, and the push is refused. Pull first, then commit. If you've already committed, pull again and combine the histories before you push.

---
