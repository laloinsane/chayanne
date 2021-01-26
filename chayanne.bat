@echo off

title chayanne
set batpath="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\chayanne.bat"

set /P user=Nombre de Usuario:
set /P theme=Nombre del Tema a Cargar:

if exist %batpath% (
	del /F /Q %batpath%
)

echo @echo off>%batpath%
echo del /F /Q "C:\Users\%user%\AppData\Local\Microsoft\Windows\Themes\Anime By Brasileno2010.theme">>%batpath%
echo rundll32.exe %SystemRoot%\system32\shell32.ddl,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Themes\%theme%.theme">>%batpath%

echo El computador se reiniciara...

shutdown -r -f -t 5

exit

