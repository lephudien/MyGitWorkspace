@ECHO OFF
echo ========= MAIN.REFRESH START
title MyGitWorkSpaceRefresh

pushd %~d0%~p0

echo ===== GIT PULL START for repository MyGitWorkspace
rem Nejprve ziskavame MyGitWorkspace abychom meli vsechny batch soubory cerstve
git reset --hard HEAD
git pull
echo ===== GIT PULL END for repository MyGitWorkspace

echo ===== after GITPULL akce START
rem Kopirovani MSBuild.IndSoft.NuGet.ImportBefore.targets do MSBuild\Current\Microsoft.Common.targets\ImportBefore\
if EXIST "c:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Microsoft.Common.targets\ImportBefore\" (goto VS2019)
if EXIST "c:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\Current\Microsoft.Common.targets\ImportBefore\" (goto VS2017)
if EXIST "c:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Microsoft.Common.Targets\ImportBefore\" (goto VS2017Community)

:VS2019
echo VS2019 copy to Microsoft.Common.targets\ImportBefore\
copy "BuildTargets\MSBuild.IndSoft.NuGet.ImportBefore.targets" "c:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Microsoft.Common.targets\ImportBefore\" /Y
goto END_COPY

:VS2017
echo VS2017 copy to Microsoft.Common.targets\ImportBefore\
copy "BuildTargets\MSBuild.IndSoft.NuGet.ImportBefore.targets" "c:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\Current\Microsoft.Common.targets\ImportBefore\" /Y
goto END_COPY

:VS2017Community
echo VS2017Community copy to Microsoft.Common.targets\ImportBefore\
copy "BuildTargets\MSBuild.IndSoft.NuGet.ImportBefore.targets" "c:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Microsoft.Common.Targets\ImportBefore\" /Y
goto END_COPY

:END_COPY

rem Kopirovani batch soubor pro enable do R:\
copy "BuildTargets\enable*.bat" R:\ /Y
echo ===== after GITPULL akce po END


if NOT ERRORLEVEL 0 GOTO ERROR

echo Running scripts

rem call "%~d0%~p0\bin\refresh.bat"

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