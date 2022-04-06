#Ho già una data impostata
$DIRE = "C:\Futuro\Ditta\FattureElettronicheRicevute\PreStampa"
$DATA = "2022-04-06T09:26:00"
python.exe C:\Users\Cristiano\AppData\Local\Programs\Python\Python310\Scripts\attachment-downloader --host imaps.pec.aruba.it --username XXXXXX@pec.it --password YYYYYY --imap-folder inbox.Fatture --output $DIRE --date-after="$DATA"
Remove-item $DIRE\daticert.xml
Remove-item $DIRE\smime.p7s

$NewDATA = Get-Date -Format "yyyy-MM-dd-HHmm" 
$F =  "$DIRE" + "\" + "$NewDATA.ps1"
$NewDataLong = Get-Date -Format "yyyy-MM-ddTHH:mm:00"

#Scrivo il nuovo file
"#Ho già una data impostata" | Out-File -FilePath $F
'$DIRE = "C:\Futuro\Ditta\FattureElettronicheRicevute\PreStampa"' | Out-File -FilePath $F -Append
'$DATA = "' + $NewDataLong + '"' | Out-File -FilePath $F -Append
Get-Content "C:\Futuro\Ditta\FattureElettronicheRicevute\PreStampa\Generatore.txt" | Out-File -FilePath $F -Append
#Remove-Item $myinvocation.mycommand.path -Force
Remove-Item -Path $MyInvocation.MyCommand.Source
