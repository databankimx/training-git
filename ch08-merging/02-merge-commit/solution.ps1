Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git switch -c notes
Add-Content -Path "C:\Development\git-practice\README.md" -Value "Third section"
git add README.md
git commit -q -m "Add third section"
git switch main
Set-Content -Path "C:\Development\git-practice\LICENSE.md" -Value "License text"
git add LICENSE.md
git commit -q -m "Add license note"
git merge -q --no-edit notes
Write-Output (git log -1 --format=%s)
$parents = (git rev-list --parents -n 1 HEAD).Split(" ").Count - 1
Write-Output "Parents: $parents"
