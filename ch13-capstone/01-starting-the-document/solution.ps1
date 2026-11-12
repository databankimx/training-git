Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\DOCUMENT.md" -Value @("# Project notes", "Status: draft")
git add DOCUMENT.md
git commit -q -m "Start project notes"
Write-Output (git log --format=%s)
