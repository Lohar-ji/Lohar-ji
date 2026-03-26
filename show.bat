@echo off
choco install anydesk -y --ignore-checksums --force --no-progress
:START_LOOP
anydesk --start
powershell -Command "Start-Sleep -Seconds 5"
for /f "delims=" %%i in ('"C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe" --get-id') do (
    set ID=%%i
)
if "%ID%"=="" (
    taskkill /f /im anydesk.exe > nul
    goto START_LOOP
)
echo Lohar@Admin#9988 | anydesk.exe --set-password _full_access
echo ............................................................
echo Windows Cloud PC ID is: %ID%
echo Windows Cloud Password: Lohar@Admin#9988
echo ............................................................
