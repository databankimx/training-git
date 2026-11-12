Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git switch -c notes
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Review note"
git add README.md
git commit -q -m "Add review note"
Write-Output (git log main..notes --format=%s)
Write-Output (git diff --stat main notes)
