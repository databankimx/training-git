Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: draft")
git add DOCUMENT.md
git commit -q -m "Start project notes"
git switch -c alice
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: in review (Alice)")
git add DOCUMENT.md
git commit -q -m "Update status from Alice"
git switch main
git switch -c bob
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: approved (Bob)")
git add DOCUMENT.md
git commit -q -m "Update status from Bob"
git switch main
git merge -q alice
git merge --no-edit bob *> $null
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: approved, pending Alice's review")
git add DOCUMENT.md
git commit -q -m "Combine status updates from Alice and Bob" -m "Bob approved the draft, and Alice's review is still open, so the status records both."
Write-Output (git log --first-parent --format=%s)
Write-Output "Why: $((git log -1 --format=%b).Trim())"
