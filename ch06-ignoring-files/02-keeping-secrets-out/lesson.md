# 2. Keeping Secrets Out

Some files should never reach a repository, however they're named and wherever they sit. A password, an access token, a private key, or a certificate that includes its private half is a secret, and a secret in a repository is a secret that everyone with access to the history can read, now and in every copy of it made later. Ignoring the file is a first defence. It's not the whole answer.

## What counts as a secret

A secret is anything that lets someone act as you, or as a system, without being asked. Common examples are:

- passwords, and text that holds them, such as a settings file with a connection string
- access tokens and API keys, which often look like a long string of letters and numbers
- private keys, which are usually in files with names such as `id_rsa` or `.pem`
- environment files, such as `.env`, which tend to collect several of the above

If you're unsure whether something is a secret, treat it as one, and ask before you commit it.

## Checking whether a rule matches

`git check-ignore` tests a file name against the rules, and prints the name back if a rule matches. It's the quickest way to confirm that a rule works, before you rely on it.

~~~powershell
Set-Content -Path "C:\Development\git-practice\.gitignore" -Value "secrets.txt"
git check-ignore secrets.txt
~~~

~~~text
Output:

secrets.txt
~~~

The file name is printed because the rule matches it. If nothing matches, `git check-ignore` prints nothing, which is the answer that tells you the file isn't hidden.

## Ignoring is a first defence, not the last

A rule keeps a secret out of `git status`, so a casual `git add .` won't pick it up. It doesn't stop someone who deliberately adds the file, and it doesn't protect anything that was committed before the rule existed. Once a secret has reached a shared repository, the history has it, and deleting the file in a later commit doesn't remove it from the past.

That's why the response to a committed secret is not a quick delete. Tell the people who run the repository straight away, and treat the secret as compromised, so it's replaced. The rest of the team's process applies, and your team's policy says who to tell.

> **Aside: a secret in a file with an ordinary name.**
> Secrets don't always live in files with obvious names. A settings file called `config.json` can hold a password, and so can a script. Read a file before you commit it, rather than trusting its name, and keep secrets out of files altogether where you can, for example by reading them from the environment.

## Try it

This exercise writes a rule for a secret file, creates the file, and checks that the rule matches it. The check compares the line.

Write your script in the starter file, below the comment. It must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Write `secrets.txt` into `.gitignore` in that folder, using `Set-Content`.
3. Create `secrets.txt` with the text `not for sharing`, using `Set-Content`.
4. Print the result of `git check-ignore secrets.txt` with `Write-Output (git check-ignore secrets.txt)`.

The expected output is `secrets.txt`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Check empties the practice folder first.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Treating `.gitignore` as protection after the fact. If a secret was committed before the rule existed, the rule does nothing for the history. Check before you commit, and tell the repository's maintainers straight away if you find a secret that has already gone in.

---
