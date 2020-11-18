rem @ECHO OFF
set PARAM1=%~f1
if "%~1" == "" set PARAM1=%cd%
echo ===== bin\getDirFromGit.bat %PARAM1% START
rem parametr je %1 = cesta k reposity (bez jmena) - jen dir.
rem VS 2005 tools
rem call SdkVars.bat
rem VS 2008  tools
call "S:\MyGitWorkspace\bin\includeVsVars.bat"
pushd %PARAM1%

set GITRETRY=0
:GITPULL
if %GITRETRY% gtr 2 goto ERROR
set /A GITRETRY=GITRETRY+1
echo PULL FROM GIT %PARAM1%
git pull
set GIT_RESULT=%ERRORLEVEL%
rem TODO-NAT, jak tohle resit s GITem
rem pokud GIT částečně prošel, například resolve konfliktů, zkusíme ho ještě jendou (https://msdn.microsoft.com/cs-cz/library/ms194959(v=vs.100).aspx)
if %GIT_RESULT% EQU 1 goto GITPULL
if NOT %GIT_RESULT% EQU 0 GOTO ERROR

if not exist "%PARAM1%" goto NOTEXISTING

goto OK

:NOTEXISTING
echo Pravdepodobne chybna cesta...cesta "%PARAM1%" neexistuje
goto END

:ERROR
ECHO Byla chyba - makej rucne...
goto END

:OK
ECHO OK!

:END
popd

echo Task %~f0 %* ended.
echo ===== bin\getDirFromGit.bat %PARAM1% END
rem pause