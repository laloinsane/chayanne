@echo off

title Chayanne Vaccine

:change
for /F "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
    set "YY=%dt:~2,2%"
    set "YYYY=%dt:~0,4%"
    set "MM=%dt:~4,2%"
    set "DD=%dt:~6,2%"
    set "HH"=%dt:~8,2%"
    set "Min=%dt:~10,2%"
    set "Sec=%dt:~12,2%"

set "date=%YYYY%%MM%%DD%"
set "time=%HH%%Min%%Sec%"

copy "dose.bat" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\dose%date%%time%.bat"
rem set /P user=Nombre de Usuario:
rem set /P theme=Nombre del Tema a Cargar:

rem set rm="C:\Users\%user%\AppData\Local\Microsoft\Windows\Themes\Anime By Brasileno2010.theme"
rem set th=%theme%

if exist "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\dose*" (
	del /F /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\dose*"
)

echo Al iniciar la computadora, Se cargara el tema "%theme%" al usuario "%user%".
echo.
echo.
echo 1.-Reiniciar Computadora.
echo 2.-Cambiar Parametros.
echo Presiona cualquier tecla para salir.
echo.
echo.
set /P option=Que quieres hacer? :

if %option% == 1 (
	shutdown -r -f -t 5
) else (
	if %option% == 2 (
		goto change
	) else (
		exit
	)
)
