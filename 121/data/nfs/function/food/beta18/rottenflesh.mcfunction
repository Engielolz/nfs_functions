# Rotten Flesh Function
# For use with the Nostalgic Food system by Engielolz
# Restores 4HP with 80% chance to inflict Poison.
scoreboard players add @s[scores={NFS.eat.rflesh=1..}] NFS.HPBuffer 4
effect clear @s[scores={NFS.eat.rflesh=1..}] minecraft:hunger
function nfs:rng_perform
execute if score RNG NFS.RNG.Var matches 0..7 run effect give @s[scores={NFS.eat.rflesh=1..}] minecraft:poison 30 0
scoreboard players set @s[scores={NFS.eat.rflesh=1..}] NFS.eat.rflesh 0