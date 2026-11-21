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
Write-Output (git status --short)
