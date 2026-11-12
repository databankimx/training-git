# 1. Checking Git Is Installed

Git is a program, and like any program it has to be on the `PATH` before a terminal can find it. You met the `PATH` in the PowerShell tutorial. The setup script installed Git, and this step confirms that the terminal can see it.

## Asking the terminal

`Get-Command` looks up a program by name, and it finds Git if the terminal can see it.

~~~powershell
Get-Command git
~~~

~~~text
Output:

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Application     git.exe                                            2.53.0.1   C:\Program Files\Git\cmd\git.exe
~~~

The version and the location will differ on your computer. What matters is that a line appears at all. If `Get-Command` says the name isn't recognized, Git isn't on the `PATH` in this window. Open a new window first, as you learned in the PowerShell tutorial, and check again.

## Asking for the version

`git --version` asks Git which version it is. The answer is one line, and it's a useful thing to put in a bug report, because versions behave differently.

~~~powershell
git --version
~~~

~~~text
Output:

git version 2.53.0.windows.1
~~~

The exact version will differ on your computer. Any version from 2.31 onward supports the settings this tutorial uses, and newer is better.

## Checking in a script

A script can check for Git without printing anything about it, and then act on the answer. Chapter 9 of the PowerShell tutorial covered the pattern. `Get-Command` returns nothing when the program is missing, and `if` turns that into a decision.

~~~powershell
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Output "Git is installed"
}
~~~

~~~text
Output:

Git is installed
~~~

If Git were missing, the script would print nothing, which is the honest answer. A script that needs Git should say so when it's absent, and the setup script does exactly that.

## Try it

This exercise checks for Git in a script, and prints one line if it's there. The check compares the line.

Write your script in the starter file, below the comment. It must print:

~~~text
Git is installed
~~~

Use `Get-Command git -ErrorAction SilentlyContinue` in an `if` line, and `Write-Output` for the message inside it. The check runs on a machine that has Git, which the setup script installed.

Press Run (F5) to see your output. Press Check (Ctrl+F5) to compare it with the sample.

Stuck? Press Show solution (spoiler) to see one correct answer, after you've tried.

> **Common mistake.** Writing `Get-Command git` without `-ErrorAction SilentlyContinue`. On a machine without Git, a red error appears alongside the result, which makes a check harder to read. The option keeps the answer quiet, so the `if` line is all the script prints.

---
