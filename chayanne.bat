@echo off

title chayanne
set batpath="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\chayanne.bat"

set /P user=Nombre de Usuario:
set /P theme=Nombre del Tema a Cargar:

if exist %batpath% (
	del /F /Q %batpath%
)

echo @echo off>%batpath%
echo set rm="C:\Users\%user%\AppData\Local\Microsoft\Windows\Themes\Anime By Brasileno2010.theme">>%batpath%
echo set th=%theme%
echo if exist %rm% (
echo del /F /Q %rm%>>%batpath%
echo )
echo if exist %th% (
echo rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Themes\%theme%.theme">>%batpath%
echo )

echo Al iniciar la computadora, Se cargará el tema %theme% al usuario %user%.
pause  

shutdown -r -f -t 5

exit

