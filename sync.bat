@echo off
setlocal
cd /D %~dp0
git pull

if "%1x"=="--forcex" goto doIt
if "%1x"=="-fx" goto doIt
set /p answer=This may overwrite existing files in your home directory. Are you sure? (y/n)
if "%answer%"=="y" goto doIt
if "%answer%"=="Y" goto doIt
goto :EOF

:doIt
xcopy . "%USERPROFILE%" /EXCLUDE:excludes.txt /s /i /y
