#############################################
#	Title:      Windows 10 EssentialUtils   #
#	Creator:	Ad3t0	                    #
#	Date:		11/07/2018             	    #
#############################################
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal ($myWindowsID)
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
if ($myWindowsPrincipal.IsInRole($adminRole))
{ $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
	Clear-Host
} else
{ $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
	$newProcess.Arguments = $myInvocation.MyCommand.Definition;
	$newProcess.Verb = "runas";
	[System.Diagnostics.Process]::Start($newProcess);
	exit
} ##############
$ver = "1.0.4"
$text = @'
     _       _ _____ _    ___
    / \   __| |___ /| |_ / _ \
   / _ \ / _` | |_ \| __| | | |
  / ___ \ (_| |___) | |_| |_| |
 /_/   \_\__,_|____/ \__|\___/

    Essential Utilities
  
----------------------------------------
  
'@
Write-Host $text
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n=allowGlobalConfirmation
choco feature disable -n=checksumFiles
choco install bleachbit geekuninstaller
Remove-Item "$($env:USERPROFILE)\Desktop\BleachBit.lnk" > $null 2>&1
geek
