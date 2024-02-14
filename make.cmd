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
nfstool food.inf 
:: done
goto eof

:makejson
REM %1 = function %2 = file location
>%2 (
echo {
echo "values": [
echo "%1"
echo ]
echo }
)
exit /b 0

:makepack
REM %1 = format, set %description% to what you want
>pack.mcmeta (
echo {
echo       "pack": {
echo           "pack_format": %1,
echo           "description": "%description%"
echo       }
echo   }
)
exit /b 0

:eof