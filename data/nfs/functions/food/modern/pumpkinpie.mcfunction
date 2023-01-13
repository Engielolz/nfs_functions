# Pumpkin Pie Function
# For use with the Nostalgic Food System by Engielolz
# Restores 8HP.
effect give @a[scores={eat.ppie=1..}] minecraft:instant_health 1 1
scoreboard players set @a[scores={eat.ppie=1..}] eat.ppie 0
