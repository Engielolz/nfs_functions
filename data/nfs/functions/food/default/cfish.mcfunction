# Cooked Fish (cod) Function
# For use with the Nostalgic Food system by Engielolz
effect give @a[scores={eat.cfish=1..}] minecraft:instant_health
effect give @a[scores={eat.cfish=1..}] minecraft:regeneration 1 2
scoreboard players set @a[scores={eat.cfish=1..}] eat.cfish 0