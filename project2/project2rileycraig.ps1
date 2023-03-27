Set-ExecutionPolicy -Scope CurrentUser RemoteSigned #sets execution policy to allow this script to run on other devices

function getPrinter{ #searches the device for any Sharp brand printers
    (Get-Printer).Name | Select-String "SHARP*"
}

$Printer = getPrinter #outputs list of Sharp printers on device
$hostN = hostname #hostname for subject line for email

if($Printer -like "SHARP*"){ #if the device has any Sharp devices, email body will include list of the models
    $Body = "The device has the following Sharp printers: $Printer"
}else{ #if not, script will reflect that in email body
    $Body = "No Sharp printers"
}

$EmailTo = "craigrf@mail.uc.edu" #recipient is the "administrator" in this scenario... me
$EmailFrom = "rcraig1999@gmail.com"
$Subject = "Sharp Printer Audit: $hostN" #subject line including hostname of any device that runs this

#SMTP info
$SMTPServer = "smtp.gmail.com" 
$filenameAndPath = "C:\CDF.pdf"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("rcraig1999@gmail.com", "ohagxltuqtjnafvg");
$SMTPClient.Send($SMTPMessage)