Set-Location "C:\Development\git-practice"
git init -q -b main
Write-Output "Repository ready: $(Test-Path ".git")"
