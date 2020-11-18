@ECHO OFF
echo REFRESH
title MyGitWorkSpaceRefresh

pushd %~d0%~p0

echo Refreshing scripts
rem na jednom radku, kvuli prepisu souboru pri aktualizaci z TFS
rem TODO-NAT jak getnout z GITu?
if NOT ERRORLEVEL 0 GOTO ERROR

echo Running scripts

call "%~d0%~p0\bin\refresh.bat"

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
