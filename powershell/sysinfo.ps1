function getIP{
    (Get-NetIPAddress).IPv4Address | Select-String "192*"
}

function getUser{
    $env:USERNAME
}

function getHostname{
    Hostname
}

function getVersion{
    $Host.Version.Major
}

function getDate{
    Get-Date -UFormat "%A, %B %e, %Y"
}

$IP = getIP
$User = getUser
$Hostname = getHostname
$Version = getVersion
$Date = getDate

$Body = "This machine's IP address is $IP. The user is $User. The hostname is $Hostname. PowerShell is on version $Version. Today's date is $Date."

Send-MailMessage -To "craigrf@mail.uc.edu" -From "rcraig1999@gmail.com" -Subject "Riley Craig IT3038C Windows SysInfo" -Body $Body -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential)