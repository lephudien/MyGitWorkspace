echo ===== bin\DeveloperSettings.bat START

rem TODO-NAT po odladeni uvolnit tyhle 3 rem
call %~d0%~p0\getDirFromTfs.bat "R:\IndSoft\Tools\SqlStudioScripts\v1.0\SqlStudioScripts\SqlStudioScripts\Deploy"
call R:\IndSoft\Tools\SqlStudioScripts\v1.0\SqlStudioScripts\SqlStudioScripts\Deploy\deploy.bat
cd %~d0%~p0

echo ===== bin\DeveloperSettings.bat END