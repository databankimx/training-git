Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git switch -c notes
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Notes from the branch"
git add README.md
git commit -q -m "Change heading on notes"
git switch main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Notes from main"
git add README.md
git commit -q -m "Change heading on main"
git merge --no-edit notes *> $null
git merge --abort
Get-Content -Path "C:\Development\git-practice\README.md"
if (-not (git status --short)) {
    Write-Output "Status: clean"
}
