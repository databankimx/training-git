Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes" -m "Notes for the practice repository."
Set-Content -Path "C:\Development\git-practice\LICENSE.md" -Value "License text"
git add LICENSE.md
git commit -q -m "Add license note"
Write-Output (git log --format=%s -- README.md)
Write-Output "Body: $((git log -1 --format=%b -- README.md).Trim())"
