# Cooked Rabbit Function
# For use with the Nostalgic Food System by Engielolz
# Restores 5HP.
effect give @a[scores={eat.crabt=1..}] minecraft:instant_health
effect give @a[scores={eat.crabt=1..}] minecraft:regeneration 1 2
scoreboard players set @a[scores={eat.crabt=1..}] eat.crabt 0
