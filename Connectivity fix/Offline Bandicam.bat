@echo off
if not "%1"=="am_admin" (
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

@echo off

:: Variables
set RULE_NAME=TemporaryBlock
set PROGRAM=D:\Bandicam\bdcam.exe

:: Blocking connectivity
netsh advfirewall firewall set rule name="%RULE_NAME%" dir=in new enable=yes
netsh advfirewall firewall set rule name="%RULE_NAME%" dir=out new enable=yes

:: Running the app
start "" /wait "%PROGRAM%"

:: Disabling firewall rules
netsh advfirewall firewall set rule name="%RULE_NAME%" dir=in new enable=no
netsh advfirewall firewall set rule name="%RULE_NAME%" dir=out new enable=no
pause
