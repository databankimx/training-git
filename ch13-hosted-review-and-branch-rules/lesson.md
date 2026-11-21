# 13. Hosted Review and Branch Rules

This chapter is optional. It covers the rules a hosting service can add on top of Git. Git itself has none of them. They live in the hosting service, and the people who set it up decide which ones apply to your team. Most people meet them once they share a repository with others.

Your organization sets its own rules, and this chapter can't tell you what they are. Some organizations allow direct commits to `main`. Others require a review and passing checks before anything merges. If you work for an organization, follow its rules and standards, and ask your team which ones apply to you before you push. If you are learning on your own, you can use a personal account, and the rules here are the common ones that most teams use.

The examples use GitHub's names, because GitHub is widely used and many organizations choose it. Other hosts, such as Bitbucket and GitLab, offer the same ideas under other names. The concepts carry over, but the screens and settings differ, and this chapter doesn't describe any host's interface.

Nothing in this chapter needs an account. Every exercise is local, and nothing is pushed. Hosted features aren't checked, because they depend on the host and on your team.

## The rules you may meet

**A protected branch.** The host refuses direct commits to `main`, so nobody can add a change to the shared history without going through the review process. Changes arrive as proposed changes instead.

**A proposed change.** You push a branch and ask for it to be merged into `main`. GitHub calls this a pull request. Reviewers read the commits, using the commands from Chapter 12, and they can comment or approve. You will see the same idea on other hosts under other names.

**Required checks.** Some teams add automatic checks that run on every proposed change. They might check coding standards, scan the code for problems, or look for dependencies with known vulnerabilities. A required check must pass before the change can be approved, so a failing check blocks the merge until someone fixes it.

**A codeowners file.** This file names who must review changes to which paths. The file usually lives in `.github`, and each line gives a path pattern and one or more owners. When more than one line matches a file, the last matching line wins. A line with `*` names the default owners for the whole repository.

**Limits on creating repositories.** Some organizations allow only administrators to create repositories. If you need a new one, ask an administrator, and don't assume you can create it yourself.

## Try it

The chapter ends with a single exercise in its summary. Each step before it has a smaller exercise, so you can see one rule at a time. Each step's check empties the practice folder first, so every run starts from the same place.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample. Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

---
