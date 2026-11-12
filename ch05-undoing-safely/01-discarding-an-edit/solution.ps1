Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
Add-Content -Path "C:\Development\git-practice\README.md" -Value "A line by mistake"
git restore README.md
Get-Content -Path "C:\Development\git-practice\README.md"
