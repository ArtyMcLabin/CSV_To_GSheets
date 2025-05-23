# GDrive File Sync and Search ![Version](https://img.shields.io/badge/Version-v1.5-blue)

A Windows utility script that helps you quickly move files to your Google Drive folder and search for them online.

## Features

- First-time setup wizard to configure your Google Drive folder path
- Moves files to your Google Drive folder automatically
- Opens Google Drive web search for the moved file
- Can be set as "Open with" program for quick access
- Configuration stored in `config.ini`
- Multiple ways to use: drag-and-drop, shortcut, "Open with", or command line

## Requirements

1. Windows OS
2. Google Drive for desktop installed and configured

## Setup

1. Download the files (`SHEETS_OPENER_BAT.bat` and `config.ini`)
2. Run `SHEETS_OPENER_BAT.bat` once to configure your Google Drive folder path
3. (Optional) Set `SHEETS_OPENER_BAT.bat` as "Open with" program for file types you want to quickly sync

## Usage

### Method 1: Drag and Drop
- Drag any file onto `SHEETS_OPENER_BAT.bat`

### Method 2: Desktop Shortcut (Recommended)
1. Right-click on `SHEETS_OPENER_BAT.bat`
2. Select "Create shortcut"
3. Move the shortcut to your desktop
4. Now you can drag and drop files onto the shortcut from anywhere!

### Method 3: Open With
1. Right-click a file
2. Choose "Open with" → "Choose another app"
3. Browse to and select `SHEETS_OPENER_BAT.bat`
4. (Optional) Check "Always use this app"

### Method 4: Command Line
```batch
SHEETS_OPENER_BAT.bat "path\to\your\file.csv"
```

The file will be moved to your configured Google Drive folder and a browser window will open searching for the file in your Google Drive.

## Version History

- v1.5: Standardized project structure according to GitWorkflow
- v1.4: Added CLI usage documentation
- v1.3: Improved error messages and output formatting
- v1.2: Added config file support, removed dependency on script location
- v1.1: Added desktop shortcut usage tip
- v1.0: Initial release

## License

MIT License - Feel free to use and modify as needed. 