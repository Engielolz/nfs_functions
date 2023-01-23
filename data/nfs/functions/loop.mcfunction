# Wake up the Scoreboard
execute as @a unless score @s NFS.Hunger = @s NFS.Hunger run effect give @s minecraft:hunger 1 255
# Only give out Saturation once
execute as @a[scores={NFS.gaveSat=1}] unless score @s NFS.Hunger = @s NFS.Hunger run effect give @s minecraft:saturation 1 0
execute as @a[scores={NFS.gaveSat=1}] unless score @s NFS.Hunger = @s NFS.Hunger run scoreboard players set @s NFS.gaveSat 1

# Only set up NFSVersion for players that don't have it enabled
execute as @a unless score @s NFS.Version matches 0.. run scoreboard players enable @s NFS.Version
execute as @a[scores={NFS.Version=1}] run function nfs:ver_check

# Fix HPBuffer not working if this isn't set
execute as @a unless score @s NFS.HPCooldown = @s NFS.HPCooldown run scoreboard players add @s NFS.HPCooldown 0

function nfs:foodcheck
function nfs:options