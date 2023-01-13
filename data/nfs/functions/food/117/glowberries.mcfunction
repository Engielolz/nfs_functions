# Glow Berries Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
effect give @a[scores={eat.gberry=1..}] minecraft:regeneration 3 1
scoreboard players set @a[scores={eat.gberry=1..}] eat.gberry 0
