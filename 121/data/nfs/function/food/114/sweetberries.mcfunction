# Sweet Berries Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
execute as @s[scores={NFS.vulnCooldown=1..}] if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s NFS.eat.berry 0
execute as @s unless score @s NFS.Hunger = @s NFS.LastHunger run scoreboard players add @s[scores={NFS.eat.berry=1..}] NFS.HPBuffer 2
execute if score vulnFoodCooldown NFS.Options matches 1 run scoreboard players set @s[scores={NFS.eat.berry=1..}] NFS.vulnCooldown 32
scoreboard players set @s[scores={NFS.eat.berry=1..}] NFS.eat.berry 0