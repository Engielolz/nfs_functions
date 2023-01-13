# Gapple (Golden Apple) Function
# For use with the Nostalgic Food system by Engielolz
effect clear @a[scores={eat.gapple=1..}] minecraft:regeneration
effect clear @a[scores={eat.gapple=1..}] minecraft:absorption
effect give @a[scores={eat.gapple=1..}] minecraft:instant_health 5 0
scoreboard players set @a[scores={eat.gapple=1..}] eat.gapple 0