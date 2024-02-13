@echo off
pushd %~dp0
:: cleanup
rmdir /s /q build
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
echo {>%2
echo "values": [>>%2
echo "%1">>%2
echo ]>>%2
echo }>>%2
exit /b 0

:makepack
REM %1 = format, set %description% to what you want
echo {>pack.mcmeta
echo       "pack": {>>pack.mcmeta
echo           "pack_format": %1,>>pack.mcmeta
echo           "description": "%description%">>pack.mcmeta
echo       }>>pack.mcmeta
echo   }>>pack.mcmeta
exit /b 0

:eof