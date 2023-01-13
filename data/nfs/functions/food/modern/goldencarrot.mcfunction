# Golden Carrot Function
# For use with the Nostalgic Food System by Engielolz
# Restores 6HP.
effect give @a[scores={eat.gcarrot=1..}] minecraft:instant_health
effect give @a[scores={eat.gcarrot=1..}] minecraft:regeneration 3 1
scoreboard players set @a[scores={eat.gcarrot=1..}] eat.gcarrot 0
