# 4. Summary: Remotes and Sharing

You can name a remote, push to it, clone a copy, and bring a teammate's change into your own repository. Those four moves are how a team shares its work, and they're the same whether the shared copy is on your computer or on a hosting service.

## What you learned

- A remote is a named address for another copy of the repository. `origin` is the usual name, and it's a convention.
- A bare repository has no working folder. It exists to receive pushes and serve fetches.
- `git remote add origin <address>` names a remote, and `git remote` lists the names.
- `git push -u origin main` sends `main` to the shared copy and records it as the branch to compare against.
- `git clone` makes a complete copy in a new folder, and sets up `origin` for you. It refuses a folder that isn't empty.
- `git -C <folder>` runs Git in another folder without changing where you are.
- `git fetch` brings in commits and changes no branch.
- `git pull --ff-only` fetches and then fast-forwards your branch, and stops if the histories have diverged.
- A refused push means the shared copy has commits you don't have. Fetch, combine, and push again. Never force a push to get past it.

## Try it

This exercise puts the chapter together. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the bare repository `shared.git`, add it as `origin`, and push with `git push -q -u origin main`.
4. Clone it into `C:\Development\git-practice\clone` with `git clone -q`.
5. In the clone, add `Teammate note` to its `README.md`, stage it, commit it quietly with `Add teammate note`, and push with `git push -q`. Then return to `C:\Development\git-practice`.
6. Pull with `git pull -q --ff-only origin main`.
7. Print `Remote: ` followed by the result of `git remote`, then print the history with `Write-Output (git log --format=%s)`.

The expected output is three lines: `Remote: origin`, `Add teammate note`, and `Add practice notes`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

## Optional: a hosted remote

This section is optional, and it has no exercise and no check. It shows the same commands against a repository you create on a hosting service you already use. Use your own account, and never use another person's.

1. **Create a practice repository.** On the service, create an empty repository with a name such as `git-practice`. Leave it empty. Don't import company content, and don't add a README if the service offers one, because your first push would then need to combine with it.
2. **Copy its address.** The service shows the address to use for `git clone` and `git push`. It's usually an HTTPS address, similar in shape to `https://example.com/you/git-practice.git`.
3. **Name it and push.** In your practice repository, run `git remote add origin <address>`, then `git push -u origin main`.
4. **Sign in once.** Git's credential manager opens a sign-in prompt the first time you push. The tutorial never sees your credentials, and the prompt belongs to Git and the service.
5. **Keep it practice.** A practice repository holds no confidential content. Your team's policy applies to anything that goes into it, and the policy says what may be committed to a shared copy.
6. **Delete it afterwards.** Remove the practice repository on the service when you've finished, so nothing is left behind.

The commands are the ones you've just used, and only the address is different. Hosting services add their own features on top of this, such as access controls and review, and Chapter 8 covers how review works on a team.

> **Aside: the address you should not copy.**
> A repository address on a shared service can be read by everyone who has access to it. Don't put a password, a token, or a private key in an address, and don't paste one into a command. Git's credential manager exists so you don't have to.

## Quizzes

Three questions, one for each big idea in the chapter. Pick an answer, and read the explanation whichever way it goes.

```quiz
Why is the shared copy a bare repository?
○ Because bare repositories are faster to clone than ordinary ones.
→ Speed isn't the reason. The reason is that nobody edits files in the shared copy directly.
◉ Because a shared copy receives pushes and serves fetches, and has no working folder to edit.
→ Right. A bare repository exists to be shared, so it doesn't need files you can change.
○ Because a bare repository can't store commit history.
→ A bare repository stores the full history. It just has no working folder.
```

```quiz
You run git pull --ff-only and it stops with an error. What does that most likely mean?
◉ The histories have diverged, so a fast-forward isn't possible, and you need to fetch and combine first.
→ Right. --ff-only refuses to make a merge commit on your behalf, so you decide how to combine.
○ The network is down, and nothing else can be the cause.
→ A network problem gives a different error. This one is about the histories.
○ The remote is named wrong, and you need to rename it to origin.
→ A wrong remote name gives a different error. Check git remote if you're unsure.
```

```quiz
What is the difference between git fetch and git pull?
○ They do the same thing, and the names are interchangeable.
→ They differ in whether your branch changes, which is the important part.
○ Fetch sends your commits, and pull receives them.
→ That's push and pull. Fetch receives without combining.
◉ Fetch brings commits in and changes no branch, while pull fetches and then combines them into your branch.
→ Right. Fetch is the cautious step, and pull adds the combination.
```

---
