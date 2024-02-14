@echo off
setlocal enabledelayedexpansion
if exist "%1" set filename=%1 && goto load
set /p filename=INF file:
if exist "%filename%" goto load
echo Signature=NFSTOOL>"%filename%"
if not exist "%filename%" goto error
set current=1
set last=1
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
echo 5. HP Recovered: !f%current%hp!
if !f%current%vuln! == 1 echo 6. [X] Requires plantable food exploit protection
if !f%current%vuln! == 0 echo 6. [ ] Requires plantable food exploit protection
echo X. Delete this food
echo.
echo 7. Switch food
echo 8. Change global directory
echo 9. Write changes

echo 0. Exit
choice /c:123456X7890
if %errorlevel% == 1 goto newfood
if %errorlevel% == 2 goto filepath
if %errorlevel% == 3 goto filename
if %errorlevel% == 4 goto scoreboard
if %errorlevel% == 5 goto hpval
if %errorlevel% == 6 goto toggle
if %errorlevel% == 7 goto delete
if %errorlevel% == 8 goto listfood
if %errorlevel% == 9 goto editdir
if %errorlevel% == 10 goto write
if %errorlevel% == 11 goto confirmexit

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
echo Currently the directory is %dir%
set /p dir=Enter new directory: 
goto menu

:delete
echo You asked to delete !f%current%name! Are you sure?
choice /c:yn
if %errorlevel% == 2 goto menu
if %current% == %last% goto stopdel
set /a nextup=%current% + 1
:delloop
set f%current%name=!f%nextup%name!
set f%current%fp=!f%nextup%fp!
set f%current%fn=!f%nextup%fn!
set f%current%sc=!f%nextup%sc!
set f%current%hp=!f%nextup%hp!
set f%current%vuln=!f%nextup%vuln!
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
echo dir=!dir!
)
:loop
>>!filename! (
echo f%current%name=!f%current%name!
echo f%current%fp=!f%current%fp!
echo f%current%fn=!f%current%fn!
echo f%current%sc=!f%current%sc!
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
echo Failed to create the file %filename%...
pause
exit /b

:badsignature
echo Bad signature - %Signature%
pause
exit /b