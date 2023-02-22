function getNetAdapt{
    (Get-NetAdapterHardwareInfo).InterfaceDescription
}

$netAdapt = getNetAdapt
Write-Host("$netAdapt is the primary network adapter on this device.")