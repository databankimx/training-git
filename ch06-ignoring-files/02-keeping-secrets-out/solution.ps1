Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\.gitignore" -Value "secrets.txt"
Set-Content -Path "C:\Development\git-practice\secrets.txt" -Value "not for sharing"
Write-Output (git check-ignore secrets.txt)
