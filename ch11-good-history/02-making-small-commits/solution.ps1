Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
Set-Content -Path "C:\Development\git-practice\LICENSE.md" -Value "License text"
git add LICENSE.md
git commit -q -m "Add license note"
Write-Output (git log --format=%s)
Write-Output "Commits: $(git rev-list --count HEAD)"
