#!/bin/bash
echo 'Code Name "Ryo" NFS INF Viewer for UNIX-based Systems'
echo "Loading INF file $1"
sed 's/\r$//' $1 >/tmp/ryo.tmp
while IFS= read -r line; do declare "$line"; done < /tmp/ryo.tmp
rm /tmp/ryo.tmp
if ! [ $Signature = "NFSTOOL" ]; then
   if [ $Signature = "AKIZUKI" ]; then
      echo "Gyaoooon!"
      exit 315
   fi
   echo "Invalid signature: $Signature"
   exit 1
fi
echo "Got $last entries."
echo "Base path: $dir"

for i in $(seq 1 $last)
do
   friendly=$(echo f"$i"name)
   filepath=$(echo f"$i"fp)
   filename=$(echo f"$i"fn)
   scoreboard=$(echo f"$i"sc)
   hp=$(echo f"$i"hp)
   vulnerable=$(echo f"$i"vuln)
   echo ""
   echo "Entry $i of $last:"
   echo "Food name: ${!friendly}"
   echo "Path: ${!filepath}/${!filename}.mcfunction"
   echo "Is NFS.eat.${!scoreboard} on the scoreboard and restores ${!hp} HP."
done