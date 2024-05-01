@echo off
setlocal enabledelayedexpansion
if exist "%1" set filename=%1 && goto load
set /p filename=INF file: 
if exist "%filename%" goto load
set current=1
set last=1
set working=.
goto newinit

:load
for /f "tokens=* delims= " %%a in (%filename%) do set %%a
if not "%Signature%" == "NFSTOOL" goto badsignature
set current=1
goto menu

:menu
cls
if not !f%current%vuln! == 0 if not !f%current%vuln! == 1 set f%current%vuln=0
echo Food !current! of !last!:
echo 1. Friendly Name: !f%current%name!
echo 2. File path: !f%current%fp!
echo 3. File name: !f%current%fn!
echo 4. Scoreboard name: !f%current%sc!
echo 5. Scoreboard criteria: !f%current%cc!
echo 6. HP Recovered: !f%current%hp!
if !f%current%vuln! == 1 echo 7. [X] Requires plantable food exploit protection
if !f%current%vuln! == 0 echo 7. [ ] Requires plantable food exploit protection
echo X. Delete/move this food
echo.
echo S. Switch food
echo 8. Change global directory (currently %working%/%dir%)
echo 9. Write changes

echo 0. Exit
choice /c:1234567XS890
if %errorlevel% == 1 goto newfood
if %errorlevel% == 2 goto filepath
if %errorlevel% == 3 goto filename
if %errorlevel% == 4 goto scoreboard
if %errorlevel% == 5 goto criteria
if %errorlevel% == 6 goto hpval
if %errorlevel% == 7 goto toggle
if %errorlevel% == 8 goto movedel
if %errorlevel% == 9 goto listfood
if %errorlevel% == 10 goto editdir
if %errorlevel% == 11 goto write
if %errorlevel% == 12 goto confirmexit

:newfood
set /p f%current%name=Friendly Name: 
goto menu

:filepath
set f%current%fp=
set /p f%current%fp=Change file path (just hit enter to delete): 
goto menu

:filename
set /p f%current%fn=File name: 
goto menu

:scoreboard
echo Reminder: This must be 8 characters or less
set /p f%current%sc=Scoreboard name: 
goto menu

:criteria
set /p f%current%cc=Enter scoreboard criteria: 
goto menu

:hpval
set /p f%current%hp=How much HP should it give?: 
SET "tempvar="&for /f "delims=0123456789" %%i in ("!f%current%hp!") do set tempvar=%%i
if defined tempvar echo That's not a valid number, silly. Try again. && goto hpval
set tempvar=
goto menu

:toggle
echo so does it need it or not
choice /c:yn
if %errorlevel% == 1 set f%current%vuln=1
if %errorlevel% == 2 set f%current%vuln=0
goto menu

:listfood
cls
set myvar=%current%
set current=1
:listloop
echo %current%. !f%current%name!
if %current% == %last% goto switch
set /a current=%current% + 1
goto listloop

:switch
set current=%myvar%
set myvar=
if "%1" == "--move" exit /b
set /p current=Switch to food (currently %current%): 
if not %current% GTR %last% goto menu
set /a last=%last% + 1
set /a current=%last%
goto newinit

:newinit
set f%current%name=My Tasty Food
set f%current%fp=mycoolpath
set f%current%fn=mytastyfood
set f%current%sc=myfood
set f%current%hp=0
set f%current%vuln=0
goto menu

:editdir
echo Edit which directory?
echo 1. Global directory: %dir%
echo 2. Working directory: %working%
echo 3. Cancel
choice /c:123
if %errorlevel% == 3 goto menu
if %errorlevel% == 2 goto workingdir
set /p dir=Enter new global directory: 
:: convert to Unix-path
set "dir=%dir:\=/%"
goto menu

:working
set /p working=Enter new working directory: 
set "working=%working:\=/%"
goto menu

:movedel
echo Do what with !f%current%name!?
echo 1. Move
echo 2. Delete
echo 3. Cancel
choice /c:123
if %errorlevel% == 2 goto delete
if %errorlevel% == 3 goto menu
call :listfood --move
echo The current food is !f%current%name! in slot %current%.
set /p myvar=Switch with what slot? 
if %myvar% == %current% goto menu
REM Backup the current food into move
set nextup=%current%
set current=move
call :delloop --move
REM Copy Food 2 into Food 1
set current=%nextup%
set nextup=%myvar%
call :delloop --move
REM Copy move into Food 2
set nextup=move
set current=%myvar%
call :delloop --move
goto menu
:delete
echo You asked to delete !f%current%name!. Are you sure?
choice /c:yn
if %errorlevel% == 2 goto menu
if %current% == %last% goto stopdel
set /a nextup=%current% + 1
:delloop
echo Copying !f%current%name! TO !f%nextup%name!
set f%current%name=!f%nextup%name!
set f%current%fp=!f%nextup%fp!
set f%current%fn=!f%nextup%fn!
set f%current%sc=!f%nextup%sc!
set f%current%cc=!f%nextup%cc!
set f%current%hp=!f%nextup%hp!
set f%current%vuln=!f%nextup%vuln!
if "%1" == "--move" exit /b
if %nextup% == %last% goto stopdel
set /a nextup=%nextup% + 1
set /a current=%current% + 1
goto delloop

:stopdel
set current=%nextup%
set f%current%name=
set f%current%fp=
set f%current%fn=
set f%current%sc=
set f%current%cc=
set f%current%hp=
set f%current%vuln=
set /a last=%last% - 1
set current=1
goto listfood

:write
echo Writing INF. This may take some time on very large configs.
set current=1
>!filename! (
echo Signature=NFSTOOL
echo last=!last!
echo working=!working!
echo dir=!dir!
)
if not exist !filename! goto error
:loop
>>!filename! (
echo f%current%name=!f%current%name!
echo f%current%fp=!f%current%fp!
echo f%current%fn=!f%current%fn!
echo f%current%sc=!f%current%sc!
echo f%current%cc=!f%current%cc!
echo f%current%hp=!f%current%hp!
echo f%current%vuln=!f%current%vuln!
)
if not "!f%current%sp1h!" == "" goto specialhandle
:specresume
if !current! == !last! goto end
set /a current=!current! + 1
goto loop

:specialhandle
set special=1
:specloop
>>!filename! (
echo f%current%sp%special%h=!f%current%sp%special%h!
echo f%current%sp%special%c=!f%current%sp%special%c!
)
set /a special=!special! + 1
if "!f%current%sp%special%h!" == "" goto specresume
goto specloop

:end
echo done writing.
pause
goto menu

:confirmexit
echo Any unsaved changes will be lost.
echo Go back and save if you want to keep your changes^^!
echo Exit?
choice /c:yn
if %errorlevel% == 2 goto menu
exit /b

:error
echo Failed to save the file %filename%...
pause
goto menu

:badsignature
echo Bad signature - %Signature%
pause
exit /b