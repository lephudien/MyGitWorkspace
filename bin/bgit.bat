@ECHO off

set SOLUTION=
set DIRECTORY=
if "%1" == "/help" goto :help

if "%~1" == "" (
	set DIRECTORY=%cd%
	call :FINDSLN
) ELSE (
	rem Zjistime zda je to adresar
	if EXIST "%~f1\*" 	(
		set DIRECTORY=%~f1
		call :FINDSLN
	) else	(
		set DIRECTORY=%~dp1
		set SOLUTION=%~nx1
	)
)

if "%SOLUTION%" == "" goto :NOTFOUNDERROR
if NOT EXIST "%DIRECTORY%\%SOLUTION%" GOTO :NOTFOUNDERROR

echo B - Build -  %DIRECTORY%, solution=%SOLUTION%

call "S:\MyGitWorkspace\bin\includeVsVars.bat"

call S:\MyGitWorkspace\bin\msbuild.bat /m "%DIRECTORY%\%SOLUTION%" 


goto :end
:help


goto :end
:FINDSLN
		for %%i in ("%DIRECTORY%\*.sln") do set SOLUTION=%%~nxi
goto :EOF

:NOTFOUNDERROR
echo No solution found under "%DIRECTORY%\%SOLUTION%" 

:END