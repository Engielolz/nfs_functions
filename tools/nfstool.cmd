@echo off
echo NFS Tool INF Parser for Windows
if "%1" == "" goto usage
setlocal enabledelayedexpansion
for /f "tokens=* delims= " %%a in (%1) do set %%a
echo INF File: %1
if not "%Signature%" == "NFSTOOL" goto badsig
if not defined last goto error
set current=1
:: Convert Unix path
set "dir=%dir:/=\%"
if not exist !dir! (
echo Creating directory !dir!
mkdir !dir!
)
:work
echo Processing !f%current%name! (!dir!\!f%current%fp!\!f%current%fn!.mcfunction) (!current! of !last!)
if not exist "!dir!\!f%current%fp!" (
echo Creating directory !dir!\!f%current%fp!
mkdir "!dir!\!f%current%fp!"
)
echo Writing header
>"!dir!\!f%current%fp!\!f%current%fn!.mcfunction" (
echo # !f%current%name! Function
echo # For use with the Nostalgic Food System by Engielolz
echo # Restores !f%current%hp!HP.
)
if not "!f%current%sp1h!" == "" call :writeSpecial 0
:: write main code
if "!f%current%vuln!" == "0" (call :writeNormal) else (call :writeProtected)
if not "!f%current%sp1h!" == "" call :writeSpecial 1

if !current! == !last! goto end
set /a current=!current! + 1
goto work

:writeSpecial
set special=1
:specialLoop
if "!f%current%sp%special%h!" == "%1" (
echo Writing special data
echo !f%current%sp%special%c!>>"!dir!\!f%current%fp!\!f%current%fn!.mcfunction"
)
set /a special=!special! + 1
if "!f%current%sp%special%h!" == "" exit /b
goto specialLoop

:writeNormal
echo Writing normal code
>>"!dir!\!f%current%fp!\!f%current%fn!.mcfunction" (
echo scoreboard players add @s[scores={NFS.eat.!f%current%sc!=1..}] NFS.HPBuffer !f%current%hp!
echo scoreboard players set @s[scores={NFS.eat.!f%current%sc!=1..}] NFS.eat.!f%current%sc! 0
)
exit /b

:writeProtected
echo Writing protected code
>>"!dir!\!f%current%fp!\!f%current%fn!.mcfunction" (
echo execute as @s[scores={NFS.vulnCooldown=1..}] if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s NFS.eat.!f%current%sc! 0
echo execute as @s unless score @s NFS.Hunger = @s NFS.LastHunger run scoreboard players add @s[scores={NFS.eat.!f%current%sc!=1..}] NFS.HPBuffer !f%current%hp!
echo execute if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s[scores={NFS.eat.!f%current%sc!=1..}] NFS.vulnCooldown 32
echo scoreboard players set @s[scores={NFS.eat.!f%current%sc!=1..}] NFS.eat.!f%current%sc! 0
)
exit /b

REM Alternate vuln script that is slimmer but needs to be tested
:vulnExperiment
>>"!dir!\!f%current%fp!\!f%current%fn!.mcfunction" (
echo execute as @s[scores={NFS.vulnCooldown=0}] unless score @s NFS.Hunger = @s NFS.LastHunger run scoreboard players add @s[scores={NFS.eat.!f%current%sc!=1..}] NFS.HPBuffer !f%current%hp!
echo execute if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s[scores={NFS.eat.!f%current%sc!=1..},{NFS.vulnCooldown=0}] NFS.vulnCooldown 32
echo scoreboard players set @s[scores={NFS.eat.!f%current%sc!=1..}] NFS.eat.!f%current%sc! 0
)
exit /b

:badsig
echo Bad signature - %Signature%
goto end

:error
echo last not defined
goto end

:usage
echo To use this program, provide an INF file created using MakeINF as the first argument.
goto end

:end
endlocal