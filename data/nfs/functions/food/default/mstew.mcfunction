# Mushroom Stew Function
# For use with the Nostalgic Food system by Engielolz
effect give @a[scores={eat.stew=1..}] minecraft:instant_health 1 1
effect give @a[scores={eat.stew=1..}] minecraft:regeneration 3 1
scoreboard players set @a[scores={eat.stew=1..}] eat.stew 0