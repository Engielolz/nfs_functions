#!/bin/bash
echo 'Code Name "Ryo" NFS INF Parser for UNIX-like Systems'
# Check if $1 is a file
if [[ -z $1 ]]; then echo "To use this script, provide the path to the NFS INF you want to use."; exit 1; fi
echo "Loading INF file $1"
# Convert INF to Unix
$(dirname "$0")/convert.sh $1 -u /tmp/ryo.tmp
# Read into memory
while IFS= read -r line; do declare "$line"; done < /tmp/ryo.tmp
# Clean up the mess
rm /tmp/ryo.tmp
# Check signature
if ! [ $Signature = "NFSTOOL" ]; then
   if [ $Signature = "AKIZUKI" ]; then
      echo "Gyaoooon!"
      exit 315
   fi
   echo "Invalid signature: $Signature"
   exit 1
fi
# if not defined $last then exit
if [ -z ${last+x} ]; then echo "last is not set"; exit 1; fi
# there is no further error checking but nfstool doesn't have it either

# create Base directory
if ! [ -d $working/$dir ]; then
   echo "Creating directory $working/$dir"
   mkdir -p $working/$dir
fi

function writeSpecial () {
   for i in $($seqcmd $specialcount)
   do
      specialdata=$(echo f"$1"sp"$i"c)
	  sheader2=$(echo f"$1"sp"$i"h)
	  if [ "${!sheader2}" == "$2" ]
	  then
	     echo "Writing special code"
	     echo "${!specialdata}">>$working/$dir/${!filepath}/${!filename}.mcfunction
	  fi
   done
}

function writeNormal () {
   echo "Writing normal code"
   echo "scoreboard players add @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.HPBuffer ${!hp}">>$working/$dir/${!filepath}/${!filename}.mcfunction
   echo "scoreboard players set @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.eat.${!scoreboard} 0">>$working/$dir/${!filepath}/${!filename}.mcfunction
}

function writeProtected () {
   echo "Writing protected code"
   echo "execute as @s[scores={NFS.vulnCooldown=1..}] if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s NFS.eat.${!scoreboard} 0">>$working/$dir/${!filepath}/${!filename}.mcfunction
   echo "execute as @s unless score @s NFS.Hunger = @s NFS.LastHunger run scoreboard players add @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.HPBuffer ${!hp}">>$working/$dir/${!filepath}/${!filename}.mcfunction
   echo "execute if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.vulnCooldown 32">>$working/$dir/${!filepath}/${!filename}.mcfunction
   echo "scoreboard players set @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.eat.${!scoreboard} 0">>$working/$dir/${!filepath}/${!filename}.mcfunction
}

function countEm() {
   specialcount=1
   while true
   do
      sheader2=$(echo f"$1"sp"$specialcount"h)
      # if not defined
      if [ -z "${!sheader2}" ]; then specialcount=$((specialcount-1)); break; fi
      specialcount=$((specialcount+1))
   done
}

# compatibility checks
seqcmd="seq 1"
if [ "$(uname -s)" == "Darwin" ]; then seqcmd=jot; fi

# Delete inits before continuing
find build/ -name "foodinit.mcfunction" -type f -delete
find build/ -name "foodcheck.mcfunction" -type f -delete

# This is the main loop
for i in $($seqcmd $last)
do
   friendly=$(echo f"$i"name)
   filepath=$(echo f"$i"fp)
   filename=$(echo f"$i"fn)
   scoreboard=$(echo f"$i"sc)
   criteria=$(echo f"$i"cc)
   hp=$(echo f"$i"hp)
   vulnerable=$(echo f"$i"vuln)
   specialheader=$(echo f"$i"sp1h)
   specialcount=0
   count=$i
   echo "Processing ${!friendly} ($working/$dir/${!filepath}/${!filename}.mcfunction) ($count of $last)"

   # create directory if it doesn't exist
   if ! [ -d $working/$dir/${!filepath} ]; then
      echo "Creating directory $working/$dir/${!filepath}"
      mkdir -p $working/$dir/${!filepath}
   fi

   # write header
   echo "Writing header"
   echo "# ${!friendly} Function" >$working/$dir/${!filepath}/${!filename}.mcfunction
   echo "# For use with the Nostalgic Food System by Engielolz" >>$working/$dir/${!filepath}/${!filename}.mcfunction
   echo "# Restores ${!hp}HP." >>$working/$dir/${!filepath}/${!filename}.mcfunction

   # count if $specialheader is defined
   if ! [ -z "${!specialheader}" ]; then countEm $count; fi
   # check pre-data
   if ! [ "$specialcount" = "0" ]; then writeSpecial $count 0; fi

   # write the code for the function
   if [ "${!vulnerable}" == "0" ]; then writeNormal; else writeProtected; fi

   # check post-data
   # yes we do this twice, idc
   if ! [ "$specialcount" = "0" ]; then writeSpecial $count 1; fi
   
   # convert to DOS format (for parity)
   $(dirname "$0")/convert.sh $working/$dir/${!filepath}/${!filename}.mcfunction -d -i

   # write foodcheck entry
   echo "execute as @a[scores={NFS.eat.${!scoreboard}=1..}] run function nfs:$dir/${!filepath}/${!filename}">>$working/$dir/${!filepath}/foodcheck.mcfunction
   
   # write init entry
   echo "scoreboard objectives add NFS.eat.${!scoreboard} ${!criteria}">>$working/$dir/${!filepath}/foodinit.mcfunction
done
# convert to DOS
find build/ -name "foodinit.mcfunction" -type f -exec $(dirname "$0")/convert.sh {} -d -i \;
find build/ -name "foodcheck.mcfunction" -type f -exec $(dirname "$0")/convert.sh {} -d -i \;
exit 0
