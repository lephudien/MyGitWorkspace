@ECHO OFF
ECHO calling msbuild
chcp 850
if "%VisualStudioVersion%" == "" call R:\MyGitWorkspace\bin\includeVsVars.bat
msbuild.exe %*
if NOT ERRORLEVEL 0 EXIT /b 1