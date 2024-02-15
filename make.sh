#!/bin/bash
# safety check
if ! [ -f ./src/restorehp.mcfunction ]; then echo "This must be run in the same directory as the script"; exit 1; fi
# variables
reltype=1
tag=1.3
nfsver=BuildSystem\ Test
# functions
function convert () {
   sed -i -e 's/$'"/`echo \\\r`/" $1
   rm $1-e 2>/dev/null
}
function makejson () {
   printf '{"values": ["%s"]}\n' "$1">$2
   convert $2
}
function makepack () {
   printf '{"pack": {"pack_format": %s, "description": "%s"}}\n' "$1" "$2">pack.mcmeta
   convert pack.mcmeta
}
# cleanup
rm -rf ./build 2>/dev/null
# folder structure
mkdir -p build/data/minecraft/tags/functions
cd build/data
mkdir -p nfs/functions
# copy data
cp -r ../../src/* nfs/functions
touch nfs/functions/custom_init.mcfunction
touch nfs/functions/custom_food.mcfunction
# ver_check
if [ "$reltype" = "0" ]; then
printf 'tellraw @s [{"text":"Nostalgic Food System Datapack for Minecraft 1.13+\\n"},{"text":"Version %s\\n","hoverEvent":{"action":"show_text","value":"Click to download this version"},"clickEvent":{"action":"open_url","value":"https://github.com/Engielolz/nfs_functions/releases/tag/%s"}},{"text":"2018-2024 "},{"text":"Engielolz","clickEvent":{"action":"open_url","value":"https://www.github.com/Engielolz/nfs_functions"},"hoverEvent":{"action":"show_text","value":"Click to visit GitHub Repository"}}]\n' "$nfsver" "$tag">nfs/functions/ver_check.mcfunction
fi
if [ "$reltype" = "1" ]; then
printf 'tellraw @s [{"text":"Nostalgic Food System Datapack for Minecraft 1.13+\\n"},{"text":"Version %s (Prerelease Build)\\n","hoverEvent":{"action":"show_text","value":[{"text":"Exact version not available"}]}},{"text":"2018-2024 "},{"text":"Engielolz","hoverEvent":{"action":"show_text","value":[{"text":"Click to visit GitHub Repository"}]},"clickEvent":{"action":"open_url","value":"https://www.github.com/Engielolz/nfs_functions"}}]\n' "$nfsver">nfs/functions/ver_check.mcfunction
fi
echo "scoreboard players set @s NFS.Version 0">>nfs/functions/ver_check.mcfunction
echo "scoreboard players enable @s NFS.Version">>nfs/functions/ver_check.mcfunction
convert nfs/functions/ver_check.mcfunction
# load tags
makejson nfs:init minecraft/tags/functions/load.json
makejson nfs:loop minecraft/tags/functions/tick.json
# pack.mcmeta
cd ..
makepack 4 Nostalgic\ Food\ System\ BuildSystem\ Test
# call ryo and make the functions
cd ..
./tools/ryo.sh food.inf
