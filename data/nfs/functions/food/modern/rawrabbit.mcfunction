# Raw Rabbit Function
# For use with the Nostalgic Food System by Engielolz
# Restores 3HP.
effect give @a[scores={eat.rrabt=1..}] minecraft:regeneration 1 3
scoreboard players set @a[scores={eat.rrabt=1..}] eat.rrabt 0
