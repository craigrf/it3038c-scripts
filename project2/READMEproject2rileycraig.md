Preface/How it works/Why I created it:
This script was created as a minimally-invasive, non-GUI method to audit/search for printers in a small-medium enterprise setting.
I used HP printers (bane of my existence) as an example, but with a small tweak in the code, it can be changed to really any manufacturer.
It will search for printers on any Windows client device. In this instance, if any HP printers are discovered, it will report that back to the administrator (me) via email with the hostname of the device that runs it.
The idea is to run this script on all Windows client devices in an organization and allow the administrator to see which devices are connected to HP devices.
It's not terribly complex, but I'm planning on expanding on this idea for the Final Lab for the course.

PreRequisites:
-Windows 10 or higher (Home/Pro/Enterprise/Education)
-PowerShell 5.0 or higher
-Active Internet connection (to send the email report)
-Ability to run scripts
 ->In PowerShell run: Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
 ->Can also do Bypass rather than RemoteSigned
 ->User will need to select "Yes to All" in pop-up

Running the command:
-Download project2rileycraig.ps1
-Right click on the file and select Run with PowerShell
 
Results:
I will recieve an email with the results of the script (screen capture provided along with the .ps1 and README to show an example of the email I recieve)