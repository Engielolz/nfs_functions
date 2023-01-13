# Raw Mutton Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
effect give @a[scores={eat.rmutn=1..}] minecraft:regeneration 3 1
scoreboard players set @a[scores={eat.rmutn=1..}] eat.rmutn 0
