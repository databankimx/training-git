Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
git init -q --bare -b main shared.git
git remote add origin "C:\Development\git-practice\shared.git"
git push -q -u origin main
git clone -q "C:\Development\git-practice\shared.git" "C:\Development\git-practice\clone"
Set-Location "C:\Development\git-practice\clone"
Add-Content -Path "C:\Development\git-practice\clone\README.md" -Value "Teammate note"
git add README.md
git commit -q -m "Add teammate note"
git push -q
Set-Location "C:\Development\git-practice"
git fetch -q origin
Write-Output "Behind: $(git rev-list --count HEAD..origin/main)"
git pull -q --ff-only origin main
Write-Output "Behind after pull: $(git rev-list --count HEAD..origin/main)"
if (-not (git status --short)) {
    Write-Output "Status: clean"
}
