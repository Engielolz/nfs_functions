# Gapple (Golden Apple) Function
# For use with the Nostalgic Food system by Engielolz
effect clear @a[scores={NFS.eat.gapple=1..}] minecraft:regeneration
effect clear @a[scores={NFS.eat.gapple=1..}] minecraft:absorption
scoreboard players add @a[scores={NFS.eat.gapple=1..}] NFS.HPBuffer 20
scoreboard players set @a[scores={NFS.eat.gapple=1..}] NFS.eat.gapple 0