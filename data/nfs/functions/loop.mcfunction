# Manually managing this is for compatibility with 1.13
execute as @a store result score @s Hunger run data get entity @s foodLevel

# Only set up NFSVersion for players that don't have it enabled
execute as @a unless score @s NFSVersion matches 0.. run scoreboard players enable @s NFSVersion

execute as @a[scores={NFSVersion=1}] run function nfs:ver_check

function nfs:foodcheck
function nfs:options