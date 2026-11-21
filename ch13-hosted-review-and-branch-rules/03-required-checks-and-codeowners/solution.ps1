Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
git add README.md
git commit -q -m "Add practice notes"
New-Item -ItemType Directory -Force -Path "C:\Development\git-practice\.github" | Out-Null
Set-Content -Path "C:\Development\git-practice\.github\CODEOWNERS" -Value "* @example-owner"
git add .github/CODEOWNERS
git commit -q -m "Add codeowners file"
Write-Output (git log -1 --format=%s)
Get-Content "C:\Development\git-practice\.github\CODEOWNERS"
