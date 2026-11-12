Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\.gitignore" -Value @("*.log", "secrets.txt")
Set-Content -Path "C:\Development\git-practice\app.log" -Value "started"
Set-Content -Path "C:\Development\git-practice\secrets.txt" -Value "not for sharing"
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
Write-Output (git status --short)
Write-Output (git check-ignore app.log)
