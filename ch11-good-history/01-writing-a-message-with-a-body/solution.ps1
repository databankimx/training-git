Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes" -m "Notes for the practice repository."
Write-Output "Subject: $(git log -1 --format=%s)"
Write-Output "Body: $((git log -1 --format=%b).Trim())"
