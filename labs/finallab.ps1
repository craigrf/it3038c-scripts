# Variable to store the vulnerability score
# The score is automatically 10/10 but points are deducted based on results of the vulnerability scan, then the final score/10 is the final output
$vulnerabilityScore = 10

# Checks to see if SMB is enabled
# SMB is a file sharing protocol
# The most recent version is v3.1.1, but most consumer devices only have/need v1 which is why the version is not specified here 
$SMBv1Enabled = Get-SmbServerConfiguration | Select-Object -ExpandProperty EnableSMB1Protocol
if ($SMBv1Enabled) {
    $vulnerabilityScore -= 3
    Write-Host "Please enable/properly configure SMB"
}

# Checks to see if PowerShell version is at least on major release version 5
$psVersion = $PSVersionTable.PSVersion.Major
if ($psVersion -lt 5) {
    $vulnerabilityScore -= 2
    Write-Host "Please update PowerShell to v5.1+"
}

# Checks to see if Windows Update is enabled
$WindowsUpdateEnabled = (Get-Service -Name wuauserv).Status -eq "Running"
if (-not $WindowsUpdateEnabled) {
    $vulnerabilityScore -= 2
    Write-Host "Please run Windows Update"
}

# Checks to see if Windows Firewall is enabled and configured as Microsoft recommends
$fwEnabled = (Get-NetFirewallProfile | Select-Object -ExpandProperty Enabled) # Verifying that Windows Firewall is enabled
$fwInbound = (Get-NetFirewallProfile | Select-Object -ExpandProperty DefaultInboundAction) # Verifying that inbound traffic is being assessed
$fwOutbound = (Get-NetFirewallProfile | Select-Object -ExpandProperty DefaultOutboundAction) # Verifying that outbound traffic is being assessed
if (-not $fwEnabled -or $fwInbound -ne "Block" -or $fwOutbound -ne "Allow") {
    $vulnerabilityScore -= 2
    Write-Host "Please enable/properly configure Windows Firewall"
}

# Checks to see if antivirus software is installed and is as up to date as possible
$avInstalled = Get-WmiObject -Class "Win32_Product" | Where-Object {$_.Name -like "Antivirus*"} | Select-Object -First 1
if (-not $avInstalled) {
    $vulnerabilityScore -= 1
    Write-Host "Please install antivirus software"
} else {
    $avStatus = Get-WmiObject -Namespace "root\SecurityCenter2" -Class "AntiVirusProduct" # Verifies that the Anti-virus product is up to date
    if (-not $avStatus) {
        $vulnerabilityScore -= 1
        Write-Host "Please update your antivirus software"
    }
}

# Display the vulnerability score
Write-Host "The vulnerability score is $vulnerabilityScore out of 10."

