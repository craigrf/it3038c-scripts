Project Title:
Windows Common Vulnerabilty Scanner

*************************************************************************************************************************************

Preface/Background:
There are common vulnerabilities associated with Windows that are not typically thought of by users,
let alone system administrators or security professionals.

This script/tool has been created to scan for these vulnerabilities and make the user aware of the issues,
which comes in the form of messages and a vulnerability score that is a minimum of 0 points and a maximum of 10 points.

0 points means all of the vulnerabilities that are involved are posing a potential risk for the machine/user(s) while 10
points indicates that all of the vulnerablities have been properly patched/dealt with.

The script checks for the following vulnerabilities:
- SMB is not enabled
- PowerShell is not on version 5 or newer
- Windows update is not enabled ***AND*** running
- Windows Firewall is not enabled ***AND*** properly configured per Microsoft's recommendations
- Anti-virus software is not installed
 - Anti-virus software is not up to date (if present on the machine)

If the script finds that any of these vulnerabilities still pose a threat, it will output a warning to the user before giving a final score out of 10.

*************************************************************************************************************************************

Requirements:
- Windows 10 v1507 (or newer) ***OR*** Windows 11 v21H2 (or newer)
- PowerShell (v5 or newer preferred but not required)

*************************************************************************************************************************************

Execution:
- Download the finallab.ps1 file
- Copy and paste the file path for the finallab.ps1 file in PowerShell and hit Enter ***OR*** In File Explorer, right click the finallab.ps1 file and select Run with PowerShell

*************************************************************************************************************************************

Output:
Please run Windows Update
Please enable/properly configure Windows Firewall
Please install antivirus software
The vulnerability score is 5 out of 10.
