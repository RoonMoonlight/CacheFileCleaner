@echo off
cls
echo ------------------------------------------------------
echo                  Cache file Remover
echo                      By Ah_Roon
echo ------------------------------------------------------
IF NOT EXIST "..\..\hl2.exe" (goto :ERR_NO_CUSTOM_FOLDER)
goto :CLEAN
:ERR_NO_CUSTOM_FOLDER
echo Please put this batch file on custom folder to run this script.
echo ------------------------------------------------------
echo Error Code: E01 (ERR_NO_CUSTOM_FOLDER)
goto EXIT

:CLEAN
echo Cleaning all cache files.
del /F /S *.cache
echo ------------------------------------------------------
echo Removed all Cache Folder!
goto EXIT

:EXIT
pause
exit