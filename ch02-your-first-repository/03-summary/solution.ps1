Set-Location "C:\Development\git-practice"
git init -q -b main
Set-Content -Path "C:\Development\git-practice\README.md" -Value "# Practice notes"
Write-Output "Repository ready: $(Test-Path ".git")"
Write-Output (git status --short)
