echo ===== batch\refresh.bat START

cd %~d0%~p0

call "S:\MyGitWorkspace\batch\includeVsVars.bat"

md S:\Library
md S:\Library\Debug
md S:\Library\Release

call "S:\MyGitWorkspace\batch\DeveloperSettings.bat"
call getDirFromGit.bat "S:\MyGitWorkspace\"

rem getneme ignore file pro cele S:
rem TODO-NAT, je treba neco podobneho u GITu?
rem tf.exe get S:\.tfignore

rem TODO-NAT, je treba neco podobneho u noveho MSBuildu (nova koncepce)?
rem call initNugetEnvironment.bat
rem nebudeme rusit build
rem if NOT %ERRORLEVEL% EQU 0 GOTO ERROR

rem TODO-NAT, je treba neco podobneho u noveho MSBuildu (nova koncepce)?
rem LS: release se stejne nikde nepouziva. Smazeme aby to nikho nematlo
del /Q/S S:\Library\Release 
rem call "S:\IND\CommonLibrary\Fwk 2.0\Library\rebuildRelease.bat" /nopause
rem if NOT %ERRORLEVEL% EQU 0 GOTO ERROR

echo.
echo.
echo.

echo Setting debug version
call S:\MyGitWorkspace\batch\DeveloperSettings.bat

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

echo ===== batch\refresh.bat STOP