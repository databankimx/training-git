# 1. Setting Up Git

Before you can save a snapshot, Git has to be installed and it has to know who you are. Both take a minute, and the setup script has already done the installing. This chapter checks the install, explains the identity that goes on every commit, and shows where Git keeps its settings.

## What Git knows about you

Every commit records two things: the name and email address of the person who made it, and the moment it was made. Git can't check either one. It takes them from its settings, and it trusts you to fill them in honestly.

That's why the identity matters. A commit that says it was written by someone else is misleading, and in a shared repository it makes the history harder to trust. Set your own name and address, and use the one your team expects.

## Where settings live

Git reads its settings from three places, and a later place overrides an earlier one.

- **System.** Applies to every user on the computer. Rarely needed.
- **Global.** Applies to your account, on every repository you use. This is where your identity normally goes.
- **Local.** Applies to one repository only, and lives in that repository's `.git` folder.

You set the global level with `git config --global`, and the local level with `git config` inside a repository. The practice repository uses the local level, so you can see exactly what is set where.

## The practice identity

Every run in this tutorial gets a practice identity from the reader, so the commits you make in the practice folder work without any setup. That identity is not yours, and it's made up on purpose. The lessons that set an identity do it with the local level, so nothing changes outside the practice folder.

~~~text
Practice identity: Practice Learner <practice@example.invalid>
~~~

The `.invalid` ending is reserved, so no real address can end that way. If you ever see it on a commit outside the practice folder, something has gone wrong.

## Try it

This chapter has three steps, and each one has an exercise. The first checks that Git is installed. The second sets the identity inside the practice repository. The third puts both together.

Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder before it runs, so each check starts clean.

---
