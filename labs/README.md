LAB 7 -- IT3038C
----------------------------------------------------------------------------------------------------------------
***Summary***
This PowerShell script outputs information about your Windows machine (OS version). It will also inform the user
if there is an update available for the machine.

***PreRequisites***
-Windows 10 1507 or newer
-Windows 11 21H2 or newer
-PowerShell 5.0, 5.1, or 7.0+
-Internet connection
-WindowsOSBuild PowerShell Module

***Required Module***
There is one (1) required module required to successfully run this script. Run the following in PowerShell 
to install it:

Install-Module -Name WindowsOSBuild

Prompt(s) requesting permission to install the module may appear--type Y and press Enter to accept. If you do not
accept, the module will not install properly (if at all).

Once the module has been installed, run the following to ensure it is up to date:

Update-Module -Name WindowsOSBuild -Force

 
***Usage***
The script will immediately output the current Windows build version on any compatible machine.

It will then prompt the user if they would like to check if they have the most up to date build version.
The user must enter Y (yes) or N (no) (case sensitive input; must be capital). If anything else is entered, the
script will throw an error and will need to be run again.

The module used in this script is used to check for the current version of Windows, check for new versions, and is
also used to compare versions of Windows. It reflects a list of build versions up to Windows 11 21H2. If the 
machine is on Windows 10 20H2, for example, it will reflect that the machine needs to be updated.


