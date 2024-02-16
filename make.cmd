@echo off
set reltype=1
set tag=1.3
set nfsver=BuildSystem Test
pushd %~dp0
:: cleanup
rmdir /s /q build 2>nul
mkdir build\data
cd build\data
:: folder structure
mkdir minecraft\tags\functions
mkdir nfs\functions
:: copy data
xcopy ..\..\src\*.* nfs\functions /e
copy nul nfs\functions\custom_init.mcfunction
copy nul nfs\functions\custom_food.mcfunction
:: ver_check
if %reltype% == 0 echo tellraw @s [{"text":"Nostalgic Food System Datapack for Minecraft 1.13+\n"},{"text":"Version %nfsver%\n","hoverEvent":{"action":"show_text","value":"Click to download this version"},"clickEvent":{"action":"open_url","value":"https://github.com/Engielolz/nfs_functions/releases/tag/%tag%"}},{"text":"2018-2024 "},{"text":"Engielolz","clickEvent":{"action":"open_url","value":"https://www.github.com/Engielolz/nfs_functions"},"hoverEvent":{"action":"show_text","value":"Click to visit GitHub Repository"}}]>nfs\functions\ver_check.mcfunction
if %reltype% == 1 echo tellraw @s [{"text":"Nostalgic Food System Datapack for Minecraft 1.13+\n"},{"text":"Version %nfsver% (Prerelease Build)\n","hoverEvent":{"action":"show_text","value":[{"text":"Exact version not available"}]}},{"text":"2018-2024 "},{"text":"Engielolz","hoverEvent":{"action":"show_text","value":[{"text":"Click to visit GitHub Repository"}]},"clickEvent":{"action":"open_url","value":"https://www.github.com/Engielolz/nfs_functions"}}]>nfs\functions\ver_check.mcfunction
>>nfs\functions\ver_check.mcfunction (
echo scoreboard players set @s NFS.Version 0
echo scoreboard players enable @s NFS.Version
)
:: write load tags
call :makejson nfs:init minecraft\tags\functions\load.json
call :makejson nfs:loop minecraft\tags\functions\tick.json
:: pack.mcmeta
set description=Nostalgic Food System %nfsver%
cd..
call :makepack 4
set description=
:: make food data
popd
tools\nfstool food.inf 
:: done
goto eof

:makejson
REM %1 = function %2 = file location
echo {"values": ["%1"]}>%2
exit /b 0

:makepack
REM %1 = format, set %description% to what you want
echo {"pack": {"pack_format": %1, "description": "%description%"}}>pack.mcmeta
exit /b 0

:eof