	echo ===== bin\refresh.bat START

cd %~d0%~p0

call R:\MyGitWorkspace\bin\includeVsVars.bat

md R:\Library
rem md R:\Library\Debug
rem md R:\Library\Release
md R:\Library\LocalLib

echo Setting debug version before
call R:\MyGitWorkspace\bin\DeveloperSettings.bat
rem TODO-NAT tady bude ziskavani Git pro ruzne repository
rem call getDirFromGit.bat "R:\MyGitWorkspace\"

rem getneme ignore file pro cele R:
rem TODO-NAT, je treba neco podobneho u GITu?
rem tf.exe get R:\.tfignore

rem TODO-NAT, je treba neco podobneho u noveho MSBuildu (nova koncepce)?
rem call initNugetEnvironment.bat
rem nebudeme rusit build
rem if NOT %ERRORLEVEL% EQU 0 GOTO ERROR

rem TODO-NAT, je treba neco podobneho u noveho MSBuildu (nova koncepce)?
rem LR: release se stejne nikde nepouziva. Smazeme aby to nikho nematlo
rem del /Q/S R:\Library\Release 
rem call "R:\IND\CommonLibrary\Fwk 2.0\Library\rebuildRelease.bat" /nopause
rem if NOT %ERRORLEVEL% EQU 0 GOTO ERROR

echo.
echo.
echo.

echo Setting debug version after
call R:\MyGitWorkspace\bin\DeveloperSettings.bat

echo.
echo.
echo.
echo.
echo ***************MyGitWorkspace refreshed*****************
echo See log file - %TEMP%\AllBuild.log
echo ***************************************************

pause
goto :QUIT


:ERROR

echo ***************CHYBA*****************
echo See log file - %TEMP%\AllBuild.log
echo *************************************

pause


:QUIT

echo ===== bin\refresh.bat STOP