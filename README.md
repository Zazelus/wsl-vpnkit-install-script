# wsl-vpnkit-install-script
A simple powershell script to install wsl-vpnkit. This uses release v0.3.2 (Latest release as of 05.27.2022)

The official wsl-vpnkit project can be found here: https://github.com/sakai135/wsl-vpnkit

# How It Works
According to sakai135, some VPNs route all traffic to and from the host through the VPN and block other connections. The WSL 2 VM is considered a separate network to the Windows host and so connections to/from the VPN get blocked as well. An example of this would be Cisco AnyConnect VPN.
Source: https://github.com/sakai135/wsl-vpnkit/discussions/128

Sakai's wsl-vpnkit uses a project called gvisor-tap-vsock to transfer the connections from the VM to the Windows process on the host.
gvisor-tap-vsock: https://github.com/containers/gvisor-tap-vsock

# Script Usage:
Note: Run commands without the quotes of course.

1. Copy wsl_install.ps1 to your C:\Users\<YOUR_USER>\ directory, where <YOUR_USER> is your windows username.

2. Open powershell, it should default to C:\Users\<YOUR_USER\. If it doesn't, run: 
   'cd C:\Users\<YOUR_USER>'.

3. To run the script, your ExecutionPolicy must be Unrestricted. To check, type: 
   'Get-ExecutionPolicy' and hit enter.

4. If it is Restricted, contact your local admin. If given access, run: 
   'Set-ExecutionPolicy Unrestricted'.

5. Run wsl_install.ps1: 
   '.\wsl_install.ps1'

6. Just incase you missed the message on the shell screen, you need to run:
   'wsl.exe -d wsl-vpnkit service wsl-vpnkit start'

#Disclaimer
I guess it states it in the license, but... The script may have some undesired behavior. One issue I can think of is the Invoke-WebRequest to download the v0.3.2 release. The link may end up being broken at some point, but on a more practical level, you might need the latest release. You could edit the script and change the URL to the latest release.

I've tested it on my end several times, and on some other user's Windows machines.
