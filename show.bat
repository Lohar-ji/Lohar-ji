@echo off
:: AnyDesk install karne ke liye
choco install anydesk -y --ignore-checksums --force --no-progress --pre

:START_ANYDESK
anydesk --start
powershell -Command "Start-Sleep -Seconds 5"

:: AnyDesk ID nikalne ke liye loop
for /f "delims=" %%i in ('"C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe" --get-id') do (
    set ID=%%i
)

if "%ID%"=="" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)
if "%ID%"=="0" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)

:: Naya Password 'i_am_Lohar' set ho raha hai
echo i_am_Lohar | anydesk.exe --set-password _full_access

:: VM Quick Config start karna
start "" /MAX "C:\Users\Public\Desktop\VMQuickConfig"

:: Python automation clicks
python -c "import pyautogui as pag; pag.click(143, 487, duration=5)"
python -c "import pyautogui as pag; pag.click(155, 554, duration=2)"
python -c "import pyautogui as pag; pag.click(637, 417, duration=2)"
python -c "import pyautogui as pag; pag.click(588, 10, duration=2)"

:: Visual interface (Updated for Lohar)
echo ............................................................
echo ............................................................
echo .................. Brought to you by .......................
echo ............................................................
echo "  _      ____  _    _          _____    "
echo " | |    / __ \| |  | |   /\   |  __ \   "
echo " | |   | |  | | |__| |  /  \  | |__) |  "
echo " | |   | |  | |  __  | / /\ \ |  _  /   "
echo " | |___| |__| | |  | |/ ____ \| | \ \   "
echo " |______\____/|_|  |_/_/    \_\_|  \_\  "
echo "                                        "
echo "                LO HAR (लोहार)           "
echo "............................................................"
echo ............................................................
echo ....... If You want to run Windows-10 using AnyDesk ........
echo ...... Watch It Here - https://youtu.be/G2RE0DlFstg ........
echo ............................................................
echo ............................................................
echo Windows Cloud PC ID is: %ID%
echo Windows Cloud Password: i_am_Lohar
echo ............................................................
echo You can login now! (Aap login kar sakte hain)
pause
