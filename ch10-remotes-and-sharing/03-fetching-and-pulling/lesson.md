# 3. Fetching and Pulling

Sharing works in both directions. A teammate pushes a change to the shared copy, and you bring it into your own repository. Fetch and pull are the two ways to do that, and the difference between them is the most useful thing to know about them. Fetch brings the commits in and leaves your branches alone. Pull brings them in and then combines them into your branch.

## A change from someone else

In the clone, a teammate adds a line and pushes it. The shared copy now has a commit your repository doesn't.

~~~powershell
Set-Location "C:\Development\git-practice\clone"
Add-Content -Path "C:\Development\git-practice\clone\README.md" -Value "Teammate note"
git add README.md
git commit -q -m "Add teammate note"
git push -q
Set-Location "C:\Development\git-practice"
~~~

~~~text
Output:

(nothing)
~~~

The push went to `origin`, which is the shared copy. Your own repository hasn't heard about it yet, because nothing has fetched it.

## Pulling the change in

`git pull` fetches the new commits and brings them into the branch you're on. `--ff-only` asks for a fast-forward only. If the two histories had diverged, Git would stop and say so, rather than make a merge commit without your say.

~~~powershell
git pull -q --ff-only origin main
git log --format=%s
~~~

~~~text
Output:

Add teammate note
Add practice notes
~~~

Your `main` now has the teammate's commit on top. Because the change was simply added to the end of the history, the pull was a fast-forward.

## Fetch on its own

`git fetch` brings the commits in without changing any branch you have. It's the cautious version: you can look at what arrived, and then decide how to combine it.

~~~powershell
git fetch -q origin
git log origin/main --format=%s
~~~

~~~text
Output:

Add teammate note
Add practice notes
~~~

`origin/main` is the name Git uses for the shared copy's `main`. Read it with `git log` to see what someone else has done, before you merge anything.

> **Aside: the push that was refused.**
> A push is refused when the shared copy has commits you don't have. Git says the push is not a fast-forward. The fix is the same as before: fetch, combine the work, and push again. Pushing with force to get past the refusal would overwrite someone else's work, so don't do it.

## Try it

This exercise makes a shared copy, clones it, has the clone push a change, and pulls that change into the original. The check compares both lines.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the bare repository `shared.git`, add it as `origin`, and push with `git push -q -u origin main`.
4. Clone it into `C:\Development\git-practice\clone` with `git clone -q`.
5. In the clone, add the line `Teammate note` to its `README.md`, stage it, commit it quietly with `Add teammate note`, and push with `git push -q`. Then return to `C:\Development\git-practice`.
6. Pull with `git pull -q --ff-only origin main`.
7. Print the history with `Write-Output (git log --format=%s)`.

The expected output is two lines: `Add teammate note` and `Add practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Pulling from inside the clone, which is the teammate's copy, instead of the original. Pull brings changes into the folder you're in. Return to `C:\Development\git-practice` before you pull.

---
