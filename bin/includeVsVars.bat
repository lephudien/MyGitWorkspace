echo ===== bin\includeVsVars.bat START

@echo off
echo Initialising Visual Studio Developer Command Prompt ...
rem od verze 2017? se při inicializaci VSvars přechází do "výchozího adresáře" se zdrojáky, viz C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\vsdevcmd\core\vsdevcmd_end.bat
rem nechceme aby změnila aktuální adresář ...
set VSCMD_START_DIR=%CD%

if EXIST "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat" (goto VS2019)
if EXIST "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsDevCmd.bat" (goto VS2017)
if EXIST "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat" (goto VS2017Community)

IF DEFINED VS140COMNTOOLS (goto VS2015)
IF DEFINED VS120COMNTOOLS (goto VS2013)
IF DEFINED VS110COMNTOOLS (goto VS2012)

:VS2010
@if "%INCLUDE%" == "" call "%VS100COMNTOOLS%\vsvars32.bat"
goto END

:VS2012
@if "%INCLUDE%" == "" call "%VS110COMNTOOLS%\vsvars32.bat"
goto END


:VS2013
@if "%INCLUDE%" == "" call "%VS120COMNTOOLS%\vsvars32.bat"
goto END


:VS2015
@if "%INCLUDE%" == "" call "%VS140COMNTOOLS%\VsDevCmd.bat"
goto END

:VS2017
@if "%INCLUDE%" == "" call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsDevCmd.bat"
goto END

:VS2017Community
@if "%INCLUDE%" == "" call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat"
goto END

:VS2019
rem TODO-NAT po odladeni uvolnit tenhle rem
@if "%INCLUDE%" == "" call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\Tools\VsDevCmd.bat"
goto END

:END
echo VS Env initialized.

echo ===== bin\includeVsVars.bat END