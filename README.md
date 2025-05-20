# GDrive File Sync and Search

A Windows utility script that helps you quickly move files to your Google Drive folder and search for them online.

## Features

- First-time setup wizard to configure your Google Drive folder path
- Moves files to your Google Drive folder automatically
- Opens Google Drive web search for the moved file
- Can be set as "Open with" program for quick access
- Configuration stored in `config.ini`

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

### Method 2: Open With
1. Right-click a file
2. Choose "Open with" → "Choose another app"
3. Browse to and select `SHEETS_OPENER_BAT.bat`
4. (Optional) Check "Always use this app"

### Method 3: Desktop Shortcut (Recommended)
1. Right-click on `SHEETS_OPENER_BAT.bat`
2. Select "Create shortcut"
3. Move the shortcut to your desktop
4. Now you can drag and drop files onto the shortcut from anywhere!

The file will be moved to your configured Google Drive folder and a browser window will open searching for the file in your Google Drive.

## Version History

- v1.1: Added config file support, removed dependency on script location
- v1.0: Initial release

## License

MIT License - Feel free to use and modify as needed. 