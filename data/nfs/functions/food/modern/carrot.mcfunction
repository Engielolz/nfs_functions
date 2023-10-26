# Carrot Function
# For use with the Nostalgic Food system by Engielolz
# Restores 3HP.
execute as @s[scores={NFS.vulnCooldown=1..}] if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s NFS.eat.carrot 0
execute as @s unless score @s NFS.Hunger = @s NFS.LastHunger run scoreboard players add @s[scores={NFS.eat.carrot=1..}] NFS.HPBuffer 3
execute if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s[scores={NFS.eat.carrot=1..}] NFS.vulnCooldown 32
scoreboard players set @s[scores={NFS.eat.carrot=1..}] NFS.eat.carrot 0