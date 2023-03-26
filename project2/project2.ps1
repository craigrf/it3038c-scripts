$User = getUser
$Hostname = Hostname
$Date = getDate
$Printer = getPrinter

function getUser{
    $env:USERNAME
}

function getDate{
    Get-Date -UFormat "%A, %B%e, %Y"
}

function getPrinter{
    (Get-Printer).Name | Select-String "SHARP*"
}

if($Printer -like "SHARP*"){
    $Body = "The device has the following Sharp printers: $Printer"
}else{
    $Body = "No Sharp printers"
}

$EmailTo = "craigrf@mail.uc.edu"
$EmailFrom = "rcraig1999@gmail.com"
$Subject = "Sharp Printer Audit"  
$SMTPServer = "smtp.gmail.com" 
$filenameAndPath = "C:\CDF.pdf"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("rcraig1999@gmail.com", "ohagxltuqtjnafvg"); 
$SMTPClient.Send($SMTPMessage)


Read-Host("Press Enter when done")