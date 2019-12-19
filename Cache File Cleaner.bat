@echo off
setlocal

@rem Source code by dbenham/Z3RP https://stackoverflow.com/questions/4339649/how-to-have-multiple-colors-in-a-windows-batch-file?answertab=active#tab-top

call :initColorPrint
goto :launch

:launch
@echo off
cls
echo.
call :colorPrint 0F "=----------------------------------------------------="
echo.
echo.
call :colorPrint 0E "                  Cache File Cleaner"
echo.
echo.
call :colorPrint 0F "         Made by Ah_Roon / Mystic Prism Studio"
echo.
echo.
call :colorPrint 0F "                                            v4.1"
echo.
call :colorPrint 0F "=----------------------------------------------------="
echo.
echo.
call :colorPrint 0F "This project is licensed under Apache License 2.0."
echo.
call :colorPrint 0F "More info can be found on https://www.apache.org/licenses/LICENSE-2.0."
echo.
echo.
call :colorPrint 0F "=----------------------------------------------------="
echo.
call :colorPrint 0E "                 Press any key"
echo.

timeout /t 5 >nul
echo.
call :colorPrint 0B "Checking the Directory..."
echo.
IF EXIST "..\..\hl2.exe" (goto :CLEAN)
IF EXIST "..\gameinfo.txt" (goto :CLEAN)
IF EXIST "..\..\left4dead2.exe" (goto :CLEAN)
IF EXIST "..\..\dayofinfamy.exe" (goto :CLEAN)
goto :ADDON_FOLDER_CONFIRM
:ADDON_FOLDER_CONFIRM
echo.
call :colorPrint 0F "=----------------------------------------------------="
echo.
echo.
call :colorPrint 0C "                     ! WARNING !"
echo.
echo.
call :colorPrint 0F "Cache File Cleaner has detected that you're running this file outside of custom/addons folder."
echo.
echo.
call :colorPrint 0F "Cleaning cache files outside of custom/addons folder may cause instability."
echo.
echo.
call :colorPrint 0F "I'm not responsible for any damage caused by instability."
echo.
echo.
call :colorPrint 0F "Do you still want to proceed anyway?"
echo.
echo.
call :colorPrint 0F "=----------------------------------------------------="
echo.
goto :PROMPT
:PROMPT
set /P c=Please make a choice (y/n):
if /I "%c%" EQU "y" goto :CLEAN
if /I "%c%" EQU "n" goto :EXIT
goto :PROMPT

:CLEAN
echo.
call :colorPrint 0B "Cleaning all cache files..."
echo.
del /F /S *.cache
echo.
call :colorPrint 0F "=----------------------------------------------------="
echo.
call :colorPrint 0A "Cleaned all cache files!"
echo.
goto EXIT

:EXIT
echo.
call :colorPrint 0A "Press any key to close this window..."
echo.
call :cleanupColorPrint
pause >nul
call :colorPrintVar 74 complex /n
exit

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:colorPrint Color  Str  [/n]
setlocal
set "str=%~2"
call :colorPrintVar %1 str %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined %~2 exit /b
setlocal enableDelayedExpansion
set "str=a%DEL%!%~2:\=a%DEL%\..\%DEL%%DEL%%DEL%!"
set "str=!str:/=a%DEL%/..\%DEL%%DEL%%DEL%!"
set "str=!str:"=\"!"
pushd "%temp%"
findstr /p /A:%1 "." "!str!\..\x" nul
if /i "%~3"=="/n" echo(
exit /b

:initColorPrint
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "DEL=%%a"
<nul >"%temp%\x" set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%.%DEL%"
exit /b

:cleanupColorPrint
del "%temp%\x"
exit /b