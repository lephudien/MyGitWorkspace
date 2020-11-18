@ECHO OFF
echo ========= MAIN.REFRESH START
title MyGitWorkSpaceRefresh

pushd %~d0%~p0

echo ===== GIT PULL START for repository MyGitWorkspace
rem Nejprve ziskavame MyGitWorkspace abychom meli vsechny batch soubory cerstve
git pull
echo ===== GIT PULL END for repository MyGitWorkspace

if NOT ERRORLEVEL 0 GOTO ERROR

echo Running scripts

call "%~d0%~p0\batch\refresh.bat"

cd %~d0%~p0

goto OK

:ERROR
ECHO Byla chyba - makej rucne...
goto END

:OK
ECHO OK!

:END
rem pause 
popd

echo ========= MAIN.REFRESH END