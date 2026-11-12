# Quick start

This guide gets the Git Basics reader open. The reader is a desktop window, so the tutorial needs no server, no browser, and no accounts. Once the reader is open, the lessons explain the rest.

## Quick setup with the script

The tutorial lives at [databankimx/training-git](https://github.com/databankimx/training-git).

`setup.ps1` does the whole setup. You can run it from anywhere. If it isn't inside the repository, it clones the repository into `C:\Development\training\training-git` and runs the cloned copy. It then:

- checks for Git, and installs it with winget if it's missing
- checks for PowerShell 7, and installs it with winget if it's missing. If the script was started in Windows PowerShell 5.1, it relaunches itself in PowerShell 7 once that's installed
- checks for Node.js 24 or later, and installs the LTS release with winget if it's missing
- checks for the C++ Build Tools, which are the fallback if Electron's download fails
- installs the reader's packages exactly as recorded in `lesson-runner\package-lock.json`
- makes sure the Electron binary is present, and if its download fails, rebuilds the native modules with the C++ environment and tries again
- runs the reader's tests, and stops at the first failure

It's safe to run more than once. Anything already in place is skipped. The script doesn't change your global Git settings, and it doesn't ask for an account or a credential.

Open PowerShell, and run:

```pwsh
powershell -NoProfile -ExecutionPolicy Bypass -File .\setup.ps1
```

The `-ExecutionPolicy Bypass` part lets this one script run. It doesn't change any setting on your machine.

The C++ Build Tools are about 4 to 5 GB and can take several minutes. They need an **Administrator** PowerShell. If you aren't an administrator, the script stops at that step and says so. Open PowerShell as Administrator, and run the script again.

If you only want to check your setup, without installing anything, add `-SkipInstall`:

```pwsh
powershell -NoProfile -ExecutionPolicy Bypass -File .\setup.ps1 -SkipInstall
```

When the script finishes, it prints a summary and the command to start the reader. Every line should say `ok`.

Installing uses winget. If winget isn't available, install **App Installer** from the Microsoft Store first. Company policy can block installs, in which case the script stops and you'll need IT.

## Requirements

- Windows 10 or 11
- Git. The script installs it if it's missing.
- PowerShell 7. The script installs it if it's missing.
- Node.js 24 or later, for the reader. The script installs it if it's missing.
- The Visual Studio Build Tools with the C++ workload, the fallback for Electron's download. The script installs them if they're missing.

No editor or account is needed.

## Start the reader

```pwsh
cd C:\Development\training\training-git\lesson-runner
npm start
```

The reader opens on the first chapter. It remembers the lesson you were on and opens there next time. Close the window normally to stop it.

Run `npm start` from the `lesson-runner` folder. The tutorial's root folder has no `package.json`, so `npm start` there fails.

## How the lessons work

- The **sidebar** lists the chapters, and the steps in the chosen chapter. Use **Next** and **Previous** to move through the tutorial in order.
- Read each lesson in the **Lesson** tab. Examples show the commands, then their output.
- Exercises use the **Source** tab. The first lines of the script are usually given. Type the rest, then press **Run** to see the output, or **Check** to compare it with the expected result.
- **Check** deletes everything in the practice repository, then runs your script, so each check starts with no repository. **Run** keeps what is there, so you can experiment.
- A failed check shows what was different, and a passed check shows a green message.
- After a check or run of a step that uses the practice repository, the output lists the text files in it. Each one has a button that opens it in your default editor.
- **Show solution (spoiler)** opens one correct answer, read-only. Try the exercise first. **Hide solutions** returns you to your own text.
- **Reset** puts back the text the exercise started with.
- Press Ctrl and move the mouse wheel to change the size of the lesson text.
- Ctrl+Left and Ctrl+Right move to the previous and next lesson, unless the cursor is in the editor.
- Tab in the editor inserts spaces to the next four-column stop. Shift+Tab removes spaces from the start of the line.
- Each code block has a copy button, which appears when you hover over it.

The chapter called **Appendix** is a cheat sheet, glossary, and troubleshooting guide. It has no exercises, and you can open it at any time.

## The practice repository

The exercises use `C:\Development\git-practice`. The reader creates it when a step needs it.

**Check deletes everything in the practice folder** before it runs your script. Copy anything you want to keep somewhere else before you press Check. Run keeps the files, so experiments survive until you press Check.

The reader runs Git with a practice identity, `Practice Learner`, and it turns off the pager and Git's colours. These settings apply only to the reader's runs. They don't change your own Git configuration.

The tutorial's own remote and clone folders, `shared.git` and `clone`, are ignored in the reader's runs, so they don't appear as untracked work.

## Your progress

The reader saves your progress as you go, in a file outside the repository, so it's never committed:

```
%APPDATA%\training-git-runner\
```

The saved progress includes which lessons you've visited, the spoiler solutions you've revealed, and the last lesson you opened. To reset it, press **Ctrl+Alt+Shift+Backspace** in the reader. The next start opens the first lesson.

## Troubleshooting

- **Setup says Git, PowerShell 7, or Node.js is missing and winget is not available.** Install **App Installer** from the Microsoft Store, or install the missing tool by hand, then run the script again.
- **Setup says Node.js is too old.** Install the current LTS release from [nodejs.org](https://nodejs.org), open a new PowerShell window, and run the script again.
- **Setup says the C++ Build Tools need an Administrator.** Open PowerShell as Administrator, then run the script again.
- **Setup says `npm ci` failed.** Check your network access to the npm registry, then run the script again. Don't delete `package-lock.json` to get past the error.
- **Setup says the Electron binary still won't download.** Check your network access to github.com, and that the C++ Build Tools are installed. Then run the script again.
- **Setup says the tests failed.** The message names the failing check. Send the full output to the tutorial's owner.
- **Setup says the folder is not a complete copy of the tutorial.** The folder at `C:\Development\training\training-git` exists but has no reader in it. Move or rename it, then run the script again, so the repository can be cloned into a new folder.
- **`npm start` fails with "package.json not found".** You're in the tutorial's root folder. Change to `lesson-runner` first.
- **The Chapter 1 check can't find Git.** Open a new window, because the `PATH` is read when a window opens. If it's still missing, run the setup script again.
- **Git asks for your name or email.** A practice run supplies one. In your own repository, see the Appendix on setting an identity.
- **A window hangs at a commit.** The reader never opens an editor. If it happens on your own machine, check that the commit has `-m`.
- **A check fails with "is missing" for a file you made.** Use the full path, `C:\Development\git-practice\...`. A bare file name is created in the folder the reader runs from, not in the practice repository.
- **The old exercise text shows after moving to another lesson.** Close and reopen the reader, and tell the tutorial's owner what you were doing.
