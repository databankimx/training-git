# 12. Working Together

Git is a tool for one person, and a team is several people sharing the same history. Most of what goes wrong on a shared repository isn't a Git problem. It's two people changing the same thing without knowing, a push that overwrites a colleague's work, or a change that lands without anyone reading it. This chapter covers the habits that prevent those, and it uses only commands you already know.

## Check before you start

Before you begin work, know where you stand. Is your folder clean? Is the branch you're on the one you expect? Has anyone shared new commits since you last looked? A two-second check at the start of a session saves a great deal of untangling later.

## Pull before you push

A push is refused when the shared copy has commits you don't have. The habit that avoids the refusal is to bring in what others have done before you send your own work. Pull first, check what came in, then commit and push.

## Reading a change as a reviewer

Review means reading a change before it becomes part of the shared history. The reviewer looks at what changed, whether it does what the subject says, and whether it fits the rest of the work. The author's job is to make that reading easy: small commits, honest subjects, and a body that explains the reason.

On many teams, review happens through a pull request, which is the word most hosting services use for a proposed change. A pull request is a feature of the hosting service, not of Git, and the rules for it are your team's. The habits underneath are Git's, and they're the ones in this chapter.

## Your team's tools and rules

Every team adds its own rules on top of Git. It may require a review before a merge, name the people who must approve changes to certain files, or ask for a particular format in messages. Those rules are real, and they're the team's, not Git's. When you're unsure what applies, ask the team before you push. Chapter 8 described how protected branches work, and the team's own guidance says how they apply to you.

## Try it

This chapter has four steps. The first checks the state before starting, the second pulls before pushing, the third reads a change the way a reviewer would, and the fourth puts them together. Press Run to see the output, and Check to compare it with the expected result. Check empties the practice folder first.

---
