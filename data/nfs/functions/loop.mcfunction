# Wake up the Scoreboard
execute as @a unless score @s NFS.Hunger = @s NFS.Hunger run effect give @s minecraft:hunger 1 255
# If NFS.gaveSat is unset, set it to 0
execute as @a unless score @s NFS.gaveSat = @s NFS.gaveSat run scoreboard players set @s NFS.gaveSat 0

# Only give out Saturation once
execute as @a[scores={NFS.gaveSat=0}] unless score @s NFS.Hunger = @s NFS.Hunger run effect give @s minecraft:saturation 1 0
execute as @a[scores={NFS.gaveSat=0}] unless score @s NFS.Hunger = @s NFS.Hunger run scoreboard players set @s NFS.gaveSat 1

# Only set up NFSVersion for players that don't have it enabled
execute as @a unless score @s NFS.Version matches 0.. run scoreboard players enable @s NFS.Version
execute as @a[scores={NFS.Version=1}] run function nfs:ver_check

# Fix HPBuffer not working if this isn't set
execute as @a unless score @s NFS.HPCooldown = @s NFS.HPCooldown run scoreboard players add @s NFS.HPCooldown 0

function nfs:foodcheck

# We do this after foodcheck so it works
execute as @a run scoreboard players operation @s NFS.LastHunger = @s NFS.Hunger
execute if score vulnFoodCooldown NFS.Options matches 1 as @a run scoreboard players remove @s[scores={NFS.vulnCooldown=1..}] NFS.vulnCooldown 1

# Combat Snapshot setting
execute if score combatSnapshot NFS.Options matches 1 run function nfs:restorehp-cs
execute if score combatSnapshot NFS.Options matches 0 run function nfs:restorehp

# Remove overeaten cakes if enabled
execute if score overeatenCakes NFS.Options matches 1 run execute at @a run fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace cake[bites=6]