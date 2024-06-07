# Gapple (Golden Apple) Function
# For use with the Nostalgic Food system by Engielolz
effect clear @s[scores={NFS.eat.gapple=1..}] minecraft:regeneration
effect clear @s[scores={NFS.eat.gapple=1..}] minecraft:absorption
scoreboard players add @s[scores={NFS.eat.gapple=1..}] NFS.HPBuffer 20
scoreboard players set @s[scores={NFS.eat.gapple=1..}] NFS.eat.gapple 0