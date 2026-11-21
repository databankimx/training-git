# 3. Required Checks and Codeowners

Two rules shape who can approve a change. A required check is an automatic test that must pass before a change can be approved. A codeowners file names who must review changes to particular paths. Both are set by the host and your team, and neither one is part of Git.

## Required checks

Some teams add checks that run on every proposed change. A check might look for coding-standard violations, scan the code for problems, or look for dependencies with known vulnerabilities. The host runs the check and shows the result on the proposed change. A required check that fails blocks the approval until someone fixes the problem and the check passes again.

A check can't tell you whether the change is right. It can only tell you that the change meets the rules the team has set. Read a failing check's report before you change anything, because the report often says exactly what to fix.

## Codeowners

A codeowners file lives in `.github`, and it's named `CODEOWNERS`. Each line gives a path pattern and the owners for that path. The owners must review a change that touches a matching file.

~~~text
* @example-owner
.github/workflows/ @example-platform-team
~~~

The first line sets a default for the whole repository. The second names a different owner for the files in `.github/workflows`. When more than one line matches a file, the last matching line wins, so put the specific rules below the general ones. Your organization's file names its own owners, and you should ask your team who they are.

## Try it

This exercise adds a codeowners file to the practice repository, commits it, and prints the commit subject and the file. The names in the file are placeholders. Your script must:

1. Move to `C:\Development\git-practice`, and make the repository quietly with `git init -q -b main`.
2. Create `README.md` containing `# Practice notes`, stage it, and commit it quietly with `Add practice notes`.
3. Create the folder `.github` with `New-Item -ItemType Directory -Force -Path "C:\Development\git-practice\.github" | Out-Null`.
4. Create `.github\CODEOWNERS` containing `* @example-owner` with `Set-Content`, stage it, and commit it quietly with `Add codeowners file`.
5. Print the subject of the latest commit with `Write-Output (git log -1 --format=%s)`.
6. Print the file with `Get-Content "C:\Development\git-practice\.github\CODEOWNERS"`.

The expected output is two lines: `Add codeowners file` and `* @example-owner`.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.
