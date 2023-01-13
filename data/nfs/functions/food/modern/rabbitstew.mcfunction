# Rabbit Stew Function
# For use with the Nostalgic Food System by Engielolz
# Restores 10HP.
effect give @a[scores={eat.rstew=1..}] minecraft:instant_health 1 1
effect give @a[scores={eat.rstew=1..}] minecraft:regeneration 3 1
scoreboard players set @a[scores={eat.rstew=1..}] eat.rstew 0
