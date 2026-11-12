Set-Location "C:\Development\git-practice"
git init -q -b main
git config user.name "Practice Learner"
git config user.email "practice@example.invalid"
Write-Output "Identity: $(git config user.name)"
