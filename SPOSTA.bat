@echo off
SET $DIRE= "C:\Futuro\Ditta\FattureElettronicheRicevute\PreStampa"
set $dire2= "C:\Futuro\Ditta\FattureElettronicheRicevute\2022"
echo %$dire% 

for %%F in (%$DIRE%\*.xml) do (
  move %$DIRE%\%%~nF.xml %$DIRE2%\
  )

for %%F in (%$DIRE%\*.p7m) do (
  move %$DIRE%\%%~nF.p7m %$DIRE2%\
  )
pause

goto :EOF

