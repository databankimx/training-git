Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Second section"
Write-Output "Changed: $(git diff --name-only)"
git add README.md
Write-Output (git diff --staged --stat)
