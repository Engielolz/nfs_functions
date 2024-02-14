@echo off
pushd %~dp0
:: cleanup
rmdir /s /q build 2>nul
mkdir build\data
cd build\data
:: folder structure
mkdir minecraft\tags\functions
mkdir nfs\functions
:: copy data
xcopy ..\..\functions\*.* nfs\functions /e
copy nul nfs\functions\custom_init.mcfunction
copy nul nfs\functions\custom_food.mcfunction
:: write load tags
call :makejson nfs:init minecraft\tags\functions\load.json
call :makejson nfs:loop minecraft\tags\functions\tick.json
:: pack.mcmeta
set description=Nostalgic Food System BuildSystem Test
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
echo {"values": ["%1"]} >%2
exit /b 0

:makepack
REM %1 = format, set %description% to what you want
echo {"pack": {"pack_format": %1, "description": "%description%"}} >pack.mcmeta
exit /b 0

:eof