@echo off
cls
echo M A L T
chcp 65001>nul
title malt
:mainmenu
echo run help to get started.
echo.
set /p in=">> "

if %in% EQU 1 (
    goto mainmenu2
)

if %in% EQU 2 (
    goto mainmenu2
)

if %in% EQU 3 (
    set /p public_ip="Enter the public IP address to geolocate >> "
    curl -s ipinfo.io/%public_ip%/json > ipinfo.json
    for /f "tokens=1,2 delims=:," %%a in ('type ipinfo.json') do (
        echo %%a: %%b
    )
    del ipinfo.json
    goto mainmenu2
)


if %in% EQU 4 (
    net session 2>&1 >nul
    if %errorlevel% EQU 0 (
        powershell reg add HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
        echo Deleted Windows Copilot
    ) else (
        echo Please run this script as Administrator first
    )
    goto mainmenu2
) 
if %in% EQU help (
    echo HELP
    echo 1 - ARP your network
    echo 2 - Scan for wifi
    echo 3 - IP geolocator
    echo 4 - Delete Windows Copilot
    goto mainmenu2
)
if %in% EQU exit (
	cmd
)
exit

