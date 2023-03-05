$curVer = Get-CurrentOSBuild
$newVer = Get-LatestOSBuild -OSName Win11 -OSVersion 21H2 -LatestReleases 1 -ExcludePreview
$yes = "Y"
$no = "N"

Write-Host("The current version of Windows on this machine is: $curVer")

$userInput = Read-Host -Prompt 'Check for update? [Y] Yes | [N] No'

if($userInput -like $yes){
    if($newVer = "*$curVer*") {
        Write-Host("Your version of Windows is up to date.")
    }else {
        Write-Host("Your version of Windows in not up to date.")
    }
} elseif($userInput -like $no) {
    Write-Host("Goodbye.")
} else {
   Write-Host("Not a valid option.") 
}