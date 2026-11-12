Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git init -q --bare -b main shared.git
git remote add origin "C:\Development\git-practice\shared.git"
git push -q -u origin main
git pull -q --ff-only origin main
if (-not (git status --short)) {
    Write-Output "Ready to start"
}
