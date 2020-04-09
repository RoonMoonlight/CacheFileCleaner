@echo off
cls
echo =-------------------------------------------------------------=
echo.
echo               Cache File Cleaner Lite v4.1.02
echo.
echo   Created by Mystic Prism Studio and Community Contributors
echo.
echo =-------------------------------------------------------------=
echo.
echo This project is licensed under MIT License.
echo More info can be found on https://mit-license.org/.
echo.
echo =-------------------------------------------------------------=
echo                   Press any key to proceed

timeout /t 5 >nul
echo Checking the Directory...
IF EXIST "..\..\hl2.exe" (goto :CLEAN)
IF EXIST "..\gameinfo.txt" (goto :CLEAN)
IF EXIST "..\..\left4dead2.exe" (goto :CLEAN)
IF EXIST "..\..\dayofinfamy.exe" (goto :CLEAN)
goto :CONFIRM
:CONFIRM
echo =----------------------------------------------------=
echo.
ECHO                      WARNING
echo.
echo Cache File Cleaner has detected that you're running this file outside of custom/addons folder.
echo.
echo Cleaning cache files outside of custom/addons folder may cause instability.
echo.
echo We are not responsible for any damage/instability.
echo.
echo Do you still want to proceed anyway?
echo.
echo =----------------------------------------------------=
goto :PROMPT
:PROMPT
set /P c=Please make a choice (y/n):
if /I %c% EQU y goto :CLEAN
if /I %c% EQU n goto :EXIT
goto :PROMPT

:CLEAN
echo Cleaning all cache files...
del /F /S *.cache
echo =----------------------------------------------------=
echo Cleaned all cache files!
goto EXIT

:EXIT
echo Press any key to close this window...
pause >nul
exit
