@echo off
setlocal enabledelayedexpansion

REM v1.4 - GDrive File Sync and Search Script
REM ===========================================
REM REQUIREMENTS:
REM 1. Windows OS
REM 2. Google Drive for desktop installed and configured
REM ===========================================

REM Get script directory
set "SCRIPT_DIR=%~dp0"
set "CONFIG_FILE=%SCRIPT_DIR%config.ini"

REM Check if a file was provided
if "%~1"=="" (
    echo Error: No file provided
    echo.
    echo Usage:
    echo 1. Drag and drop a file onto this script
    echo 2. Create a desktop shortcut and drag files there
    echo 3. Set this script as "Open with" for your files
    echo 4. Run from command line: %~nx0 "path\to\your\file.csv"
    echo.
    pause
    exit /b 1
)

:CHECK_CONFIG
REM Read GDRIVE_SYNC_PATH from config
for /f "tokens=2 delims==" %%a in ('type "%CONFIG_FILE%" ^| findstr "GDRIVE_SYNC_PATH"') do set "GDRIVE_PATH=%%a"

REM Validate GDRIVE_PATH
if not exist "!GDRIVE_PATH!" (
    echo GDrive sync folder not found or not configured.
    echo Please enter your Google Drive sync folder path
    echo Example: C:\Users\YourName\Google Drive
    set /p GDRIVE_PATH="> "
    
    REM Validate the entered path
    if not exist "!GDRIVE_PATH!" (
        echo Error: The path you entered does not exist.
        echo Please verify the path and try again.
        goto CHECK_CONFIG
    )
    
    REM Update config with the new path
    echo # GDrive Sync Script Configuration> "!CONFIG_FILE!"
    echo # Your Google Drive sync folder path ^(use full path, e.g. C:\Users\YourName\Google Drive^)>> "!CONFIG_FILE!"
    echo GDRIVE_SYNC_PATH=!GDRIVE_PATH!>> "!CONFIG_FILE!"
    echo Configuration saved to !CONFIG_FILE!
)

set "filePath=%~f1"
for /f "tokens=* delims= " %%a in ("%~nx1") do set "fileName=%%a"
move "%filePath%" "%GDRIVE_PATH%\%fileName%"
set "fileName=!fileName: =!%20!"

echo msgbox "The file !fileName! was moved to folder %GDRIVE_PATH% to sync into Google Drive. I will now open your online search for it, if you don't see the file - wait a bit and refresh. Will take time to upload.",0,"Notification" > "%temp%\message.vbs"
cscript /nologo "%temp%\message.vbs"
del "%temp%\message.vbs"

start "" "https://drive.google.com/drive/search?q=!fileName!"