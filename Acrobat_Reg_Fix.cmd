@echo off
cls
::Self-Elevate
(reg query "HKU\S-1-5-19" || (powershell start-process -FilePath '%0' -verb runas&exit /B)) >NUL 2>&1
echo Opening application.xml with notepad - change any digit in the data key 'TrialSerialNumber', save and exit notepad
notepad.exe "C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat\AMT\application.xml"
echo adding registry key
REG ADD "HKLM\SOFTWARE\WOW6432Node\Adobe\Adobe Acrobat\DC\Activation" /v IsAMTEnforced /t REG_DWORD /d 1 /f
echo Done.  Press any key to exit..
pause >nul