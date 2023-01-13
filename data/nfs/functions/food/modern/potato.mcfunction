# Potato Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
effect give @a[scores={eat.potato=1..}] minecraft:regeneration 1 2
scoreboard players set @a[scores={eat.potato=1..}] eat.potato 0
