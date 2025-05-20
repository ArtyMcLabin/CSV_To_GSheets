REM v1.1 - GDrive File Sync and Search Script
REM ===========================================
REM REQUIREMENTS:
REM 1. Windows OS
REM 2. Google Drive for desktop installed and configured
REM 
REM USAGE:
REM 1. First run will ask for GDrive sync folder path
REM 2. Set this script as "Open with" for file types you want to sync
REM 3. When you open a file with this script, it will:
REM    - Move the file to your configured GDrive folder
REM    - Wait for GDrive to sync the file
REM    - Open a browser search for the file in your GDrive
REM ===========================================

@echo off
setlocal enabledelayedexpansion

REM Get script directory
set "SCRIPT_DIR=%~dp0"
set "CONFIG_FILE=%SCRIPT_DIR%config.ini"

REM Check if config exists and load it
if not exist "%CONFIG_FILE%" (
    echo First time setup - Creating config file...
    echo # GDrive Sync Script Configuration> "%CONFIG_FILE%"
    echo # Your Google Drive sync folder path ^(use full path, e.g. C:\Users\YourName\Google Drive^)>> "%CONFIG_FILE%"
    echo GDRIVE_SYNC_PATH=>> "%CONFIG_FILE%"
    
    echo Please enter your Google Drive sync folder path:
    set /p GDRIVE_PATH="> "
    
    REM Update config with the path
    echo GDRIVE_SYNC_PATH=%GDRIVE_PATH%> "%CONFIG_FILE%"
    echo Configuration saved to %CONFIG_FILE%
)

REM Read GDRIVE_SYNC_PATH from config
for /f "tokens=2 delims==" %%a in ('type "%CONFIG_FILE%" ^| findstr "GDRIVE_SYNC_PATH"') do set "GDRIVE_PATH=%%a"

REM Validate GDRIVE_PATH
if not exist "%GDRIVE_PATH%" (
    echo Error: GDrive sync folder not found at: %GDRIVE_PATH%
    echo Please update the path in %CONFIG_FILE%
    pause
    exit /b 1
)

REM Check if a file was provided
if "%~1"=="" (
    echo Error: No file provided
    echo Usage: %~nx0 [file]
    exit /b 1
)

set "filePath=%~f1"
for /f "tokens=* delims= " %%a in ("%~nx1") do set "fileName=%%a"
move "%filePath%" "%GDRIVE_PATH%\%fileName%"
set "fileName=!fileName: =!%20!"

echo msgbox "The file !fileName! was moved to folder %GDRIVE_PATH% to sync into Google Drive. I will now open your online search for it, if you don't see the file - wait a bit and refresh. Will take time to upload.",0,"Notification" > "%temp%\message.vbs"
cscript /nologo "%temp%\message.vbs"
del "%temp%\message.vbs"

start "" "https://drive.google.com/drive/search?q=!fileName!"