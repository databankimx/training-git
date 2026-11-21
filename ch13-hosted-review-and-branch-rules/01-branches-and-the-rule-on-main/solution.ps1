Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git switch -q -c feature/hosted-review
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Hosted review note"
git add README.md
git commit -q -m "Add hosted review note"
Write-Output (git branch --show-current)
