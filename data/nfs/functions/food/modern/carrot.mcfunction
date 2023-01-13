# Carrot Function
# For use with the Nostalgic Food system by Engielolz
# Restores 3HP.
effect give @a[scores={eat.carrot=1..}] minecraft:regeneration 3 1
scoreboard players set @a[scores={eat.carrot=1..}] eat.carrot 0