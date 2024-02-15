#!/bin/bash
echo 'Code Name "Ryo" NFS INF Parser for UNIX-like Systems'
# Check if $1 is a file
if [[ -z $1 ]]; then echo "To use this script, provide the path to the NFS INF you want to use."; exit 1; fi
echo "Loading INF file $1"
# Convert INF to Unix
sed 's/\r$//' $1 >/tmp/ryo.tmp
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
# there is no further error checking but WinRyo doesn't have it either

# create Base directory
if ! [ -d $dir ]; then
   echo "Creating directory $dir"
   mkdir -p $dir
fi

function writeSpecial () {
   for i in $(seq 1 $specialcount)
   do
      specialdata=$(echo f"$1"sp"$i"c)
	  sheader2=$(echo f"$1"sp"$i"h)
	  if [ "${!sheader2}" == "$2" ]
	  then
	     echo "Writing special code"
	     echo "${!specialdata}">>$dir/${!filepath}/${!filename}.mcfunction
	  fi
   done
}

function writeNormal () {
   echo "Writing normal code"
   echo "scoreboard players add @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.HPBuffer ${!hp}">>$dir/${!filepath}/${!filename}.mcfunction
   echo "scoreboard players set @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.eat.${!scoreboard} 0">>$dir/${!filepath}/${!filename}.mcfunction
}

function writeProtected () {
   echo "Writing protected code"
   echo "execute as @s[scores={NFS.vulnCooldown=1..}] if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s NFS.eat.${!scoreboard} 0">>$dir/${!filepath}/${!filename}.mcfunction
   echo "execute as @s unless score @s NFS.Hunger = @s NFS.LastHunger run scoreboard players add @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.HPBuffer ${!hp}">>$dir/${!filepath}/${!filename}.mcfunction
   echo "execute if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.vulnCooldown 32">>$dir/${!filepath}/${!filename}.mcfunction
   echo "scoreboard players set @s[scores={NFS.eat.${!scoreboard}=1..}] NFS.eat.${!scoreboard} 0">>$dir/${!filepath}/${!filename}.mcfunction
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

# This is the main loop
for i in $(seq 1 $last)
do
   friendly=$(echo f"$i"name)
   filepath=$(echo f"$i"fp)
   filename=$(echo f"$i"fn)
   scoreboard=$(echo f"$i"sc)
   hp=$(echo f"$i"hp)
   vulnerable=$(echo f"$i"vuln)
   specialheader=$(echo f"$i"sp1h)
   specialcount=0
   count=$i
   echo "Processing ${!friendly} ($dir/${!filepath}/${!filename}.mcfunction) ($i of $last)"

   # create directory if it doesn't exist
   if ! [ -d $dir/${!filepath} ]; then
      echo "Creating directory $dir"
      mkdir -p $dir/${!filepath}
   fi

   # write header
   echo "Writing header"
   echo "# ${!friendly} Function" >$dir/${!filepath}/${!filename}.mcfunction
   echo "# For use with the Nostalgic Food System by Engielolz" >>$dir/${!filepath}/${!filename}.mcfunction
   echo "# Restores ${!hp}HP." >>$dir/${!filepath}/${!filename}.mcfunction

   # count if $specialheader is defined
   if ! [ -z "${!specialheader}" ]; then countEm $count; fi
   # check pre-data
   if ! [ "$specialcount" = "0" ]; then writeSpecial $count 0; fi

   # write the code for the function
   if [ "${!vulnerable}" == "0" ]; then writeNormal; else writeProtected; fi
   
   # check post-data
   # yes we do this twice, idc
   if ! [ "$specialcount" = "0" ]; then writeSpecial $count 1; fi
   
   # convert to DOS format (to be safe)
   sed -i -e 's/$'"/`echo \\\r`/" $dir/${!filepath}/${!filename}.mcfunction

   # macOS Fix
   rm $dir/${!filepath}/${!filename}.mcfunction-e 2>/dev/null
done
exit 0
