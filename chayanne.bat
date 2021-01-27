@echo off

title chayanne
:change
set batpath="C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\chayanne.bat"

set /P user=Nombre de Usuario:
set /P theme=Nombre del Tema a Cargar:

set rm="C:\Users\%user%\AppData\Local\Microsoft\Windows\Themes\Anime By Brasileno2010.theme"
set th=%theme%

if exist %batpath% (
	del /F /Q %batpath%
)

echo @echo off>%batpath%
echo if exist %rm% (>>%batpath%
echo del /F /Q %rm%>>%batpath%
echo )>>%batpath%
echo if exist %th% (>>%batpath%
echo rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"C:\Windows\Resources\Themes\%theme%.theme">>%batpath%
echo )>>%batpath%
echo Al iniciar la computadora, Se cargara el tema "%theme%" al usuario "%user%".
echo.
echo.
echo 1.-Reiniciar Computadora.
echo 2.-Cambiar Parametros.
echo 3.-Salir.
echo.
echo.
set /P option=Que quieres hacer? :

if %option% == 1 (
	shutdown -r -f -t 5
) else (
	if %option% == 2 (
		goto change
	) else (
		if %option% == 3 (
			exit
		) else (
			exit
		)
	)
)
