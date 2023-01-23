# Manually managing this is for compatibility with 1.13
execute as @a store result score @s Hunger run data get entity @s foodLevel

# Only set up NFSVersion for players that don't have it enabled
execute as @a unless score @s NFS.Version matches 0.. run scoreboard players enable @s NFS.Version
execute as @a[scores={NFS.Version=1}] run function nfs:ver_check

# Fix HPBuffer not working if this isn't set
execute as @a unless score @s NFS.HPCooldown = @s NFS.HPCooldown run scoreboard players add @s NFS.HPCooldown 0

function nfs:foodcheck
function nfs:options