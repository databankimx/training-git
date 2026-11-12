Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git switch -c notes
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Second section"
git add README.md
git commit -q -m "Add second section"
git switch main
Write-Output "Current: $(git branch --show-current)"
Write-Output (git log --format=%s)
