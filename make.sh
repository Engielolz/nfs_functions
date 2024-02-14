#!/bin/bash
# safety check
if ! [ -f ./functions/restorehp.mcfunction ]; then echo "This must be run in the same directory as the script"; exit 1; fi
# functions
function makejson () {
   printf '{"values": ["%s"]}' "$1">$2
}
function makepack () {
   printf '{"pack": {"pack_format": %s,"description": "%s"}}' "$1" "$2">pack.mcmeta
}
# cleanup
rm -rf ./build 2>/dev/null
# folder structure
mkdir -p build/data/minecraft/tags/functions
cd build/data
mkdir -p nfs/functions
# copy data
cp -r ../../functions/* nfs/functions
touch nfs/functions/custom_init.mcfunction
touch nfs/functions/custom_food.mcfunction
# load tags
makejson nfs:init minecraft/tags/functions/load.json
makejson nfs:loop minecraft/tags/functions/tick.json
# pack.mcmeta
cd ..
makepack 4 Nostalgic\ Food\ System\ BuildSystem\ Test
# call ryo and make the functions
cd ..
./tools/ryo.sh food.inf
