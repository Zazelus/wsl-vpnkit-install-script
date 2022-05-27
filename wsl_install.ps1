Write-Host "This script will install wsl-vpnkit." -ForegroundColor Green

$FolderName = "$env:USERPROFILE\wsl-vpnkit\"

# Unregisters current wsl-vpnkit distro. If not found, will continue.
wsl --unregister wsl-vpnkit

# Checks to see if the wsl-vpnkit directory exists in the current user's user directory.
# If it does, we'll delete it and its contents for a fresh install.
# Else, we'll just proceed with the install.
If (Test-Path $FolderName) {
    Write-Host "Folder exists, will delete directory to reinstall." -ForegroundColor Red
    rm -r $env:USERPROFILE\wsl-vpnkit\
} else {
    Write-Host "Folder does not exist, proceeding with install." -ForegroundColor Green
}

# Downloads the tar file for wsl-vpnkit.
Invoke-WebRequest -Uri https://github.com/sakai135/wsl-vpnkit/releases/download/v0.3.2/wsl-vpnkit.tar.gz -OutFile .\Downloads\wsl-vpnkit.tar.gz

# Checks to see if the wsl-vpnkit directory exists in the current user's user directory.
# If it does, we'll proceed.
# Else, we'll create a new directory called wsl-vpnkit in C:\Users\USER\.
If (Test-Path $FolderName) {
    Write-Host "Folder exists, proceeding with install" -ForegroundColor Blue
} else {
    New-Item $FolderName -ItemType Directory
    Write-Host "Folder created successfully" -ForegroundColor Green
}

# Move the tar release file into the current directory.
mv .\Downloads\wsl-vpnkit.tar.gz .\wsl-vpnkit\

# 35-39 import wsl-vpnkit as a new wsl distribution and start the service.
wsl --import wsl-vpnkit $env:USERPROFILE\wsl-vpnkit .\wsl-vpnkit\wsl-vpnkit.tar.gz --version 2
wsl -d wsl-vpnkit

Write-Host "wsl-vpnkit successfully installed, starting service..." -ForegroundColor Green
wsl -d wsl-vpnkit service wsl-vpnkit start

# Launch user's choice of Linux distro.
Write-Host "When you start your linux distribution, please run the following command:"
Write-Host "wsl.exe -d wsl-vpnkit service wsl-vpnkit start" -ForegroundColor Blue -BackgroundColor Green
Write-Host ""

$Distribution = Read-Host -Prompt "Enter the distribution that you would like to launch"
wsl -d $Distribution

# User must run: wsl.exe -d wsl-vpnkit service wsl-vpnkit start