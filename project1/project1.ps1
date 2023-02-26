# script outputs the driver or model name of a network adapter

function getNetAdapt{ # this function grabs the driver or model name of the primary network adapter on a device
    (Get-NetAdapterHardwareInfo).InterfaceDescription
}

$netAdapt = getNetAdapt # creating a variable for the output
Write-Host("$netAdapt is the primary network adapter on this device.") # output
Read-Host -Prompt "Press Enter to exit" # script will remain open/running until user presses enter key