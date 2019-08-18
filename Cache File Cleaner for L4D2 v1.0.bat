@echo off
cls
echo ------------------------------------------------------
echo                  Cache File Remover
echo                 Left 4 Dead 2 Version
echo                      By Ah_Roon
echo                                             v1.0
echo ------------------------------------------------------
echo This project is open-source, you can use/modify/reupload freely.
echo But please credit me if you're going to reupload, 
echo because I want you to let others know that this script was originally made by Ah_Roon.
echo ------------------------------------------------------
echo Checking the directory....
IF NOT EXIST "..\..\left4dead2.exe" (goto :ADDON_FOLDER_CONFIRM)
goto :CLEAN
:ADDON_FOLDER_CONFIRM
echo.
echo.
echo ------------------------------------------------------
echo                                     ! WARNING !
echo Cache File Remover has detected that you're running this file that isn't on addon folder.
echo Removing cache files in another folder can make the software unstable.
echo Remember that I have no responsibility for any harms.
echo Do you still want to continue anyway?
echo ------------------------------------------------------
echo.
goto :PROMPT
:PROMPT
set /P c=Please make a choice (y/n):
if /I "%c%" EQU "y" goto :CLEAN
if /I "%c%" EQU "n" goto :EXIT
goto :PROMPT

:CLEAN
echo Cleaning all cache files.
del /F /S *.cache
echo ------------------------------------------------------
echo Removed all Cache Folder!
goto EXIT

:EXIT
echo Thank you for using Cache File Remover!
pause
exit