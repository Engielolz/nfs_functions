#!/bin/bash
# safety check
if ! [ -f ./src/restorehp.mcfunction ]; then echo "This must be run in the same directory as the script"; exit 1; fi
# variables
reltype=1
tag=1.3
nfsver=BuildSystem\ Test
if [ "$1" == "parity" ]; then parity=1; else parity=0; fi
# functions
function makejson () {
   printf '{"values": ["%s"]}\n' "$1">$2
   ../../tools/convert.sh $2 -d -i
}
function makepack () {
   printf '{"pack": {"pack_format": %s, "supported_formats": [%s,44], "description": "%s"}}\n' "$1" "$1" "Nostalgic Food System $nfsver">pack.mcmeta
   ../tools/convert.sh pack.mcmeta -d -i
}

function vomit () {
   echo "function nfs:food/default/$1">>$2.mcfunction
   echo "function nfs:food/beta18/$1">>$2.mcfunction
   echo "function nfs:food/modern/$1">>$2.mcfunction
   echo "function nfs:food/114/$1">>$2.mcfunction
   echo "function nfs:food/115/$1">>$2.mcfunction
   echo "function nfs:food/117/$1">>$2.mcfunction
}

# cleanup
rm -rf ./build 2>/dev/null
# folder structure
mkdir -p build/data/minecraft/tags/functions
cd build/data
mkdir -p nfs/functions
# copy data
cp -v -r ../../src/* nfs/functions
touch nfs/functions/custom_init.mcfunction
touch nfs/functions/custom_food.mcfunction
# ver_check
if [ "$reltype" = "0" ]; then
   printf 'tellraw @s [{"text":"Nostalgic Food System Datapack for Minecraft 1.13+\\n"},{"text":"Version %s\\n","hoverEvent":{"action":"show_text","value":"Click to download this version"},"clickEvent":{"action":"open_url","value":"https://github.com/Engielolz/nfs_functions/releases/tag/%s"}},{"text":"2018-2024 "},{"text":"Engielolz","clickEvent":{"action":"open_url","value":"https://www.github.com/Engielolz/nfs_functions"},"hoverEvent":{"action":"show_text","value":"Click to visit GitHub Repository"}}]\n' "$nfsver" "$tag">nfs/functions/ver_check.mcfunction
fi
if [ "$reltype" = "1" ]; then
   if test "$parity" = "0" && git log -1 >/dev/null 2>&1; then
      commit=$(git log -1 --pretty='%h')
      printf 'tellraw @s [{"text":"Nostalgic Food System Datapack for Minecraft 1.13+\\n"},{"text":"Commit %s (Prerelease Build)\\n","hoverEvent":{"action":"show_text","value":"Click to view commit"},"clickEvent":{"action":"open_url","value":"https://github.com/Engielolz/nfs_functions/commit/%s"}},{"text":"2018-2024 "},{"text":"Engielolz","clickEvent":{"action":"open_url","value":"https://www.github.com/Engielolz/nfs_functions"},"hoverEvent":{"action":"show_text","value":"Click to visit GitHub Repository"}}]\n' "$commit" "$commit">nfs/functions/ver_check.mcfunction
   else
      echo "make: git not available, not a repository or winbuild parity enabled, falling back to generic version information"
      printf 'tellraw @s [{"text":"Nostalgic Food System Datapack for Minecraft 1.13+\\n"},{"text":"Version %s (Prerelease Build)\\n","hoverEvent":{"action":"show_text","value":[{"text":"Exact version not available"}]}},{"text":"2018-2024 "},{"text":"Engielolz","hoverEvent":{"action":"show_text","value":[{"text":"Click to visit GitHub Repository"}]},"clickEvent":{"action":"open_url","value":"https://www.github.com/Engielolz/nfs_functions"}}]\n' "$nfsver">nfs/functions/ver_check.mcfunction
   fi
fi
echo "scoreboard players set @s NFS.Version 0">>nfs/functions/ver_check.mcfunction
echo "scoreboard players enable @s NFS.Version">>nfs/functions/ver_check.mcfunction
../../tools/convert.sh nfs/functions/ver_check.mcfunction -d -i
# load tags
makejson nfs:init minecraft/tags/functions/load.json
makejson nfs:loop minecraft/tags/functions/tick.json
# pack.mcmeta
cd ..
makepack 4
# call ryo and make the functions
cd ..
./tools/ryo.sh food.inf

# Make main foodcheck.mcfunction
pushd ./build/data/nfs/functions/food
vomit foodcheck ./foodcheck
vomit foodinit ../init
popd