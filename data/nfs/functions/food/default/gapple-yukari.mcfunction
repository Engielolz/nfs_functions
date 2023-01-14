# Gapple (Golden Apple) Function
# For use with the Nostalgic Food system by Engielolz
effect clear @a[scores={eat.gapple=1..}] minecraft:regeneration
effect clear @a[scores={eat.gapple=1..}] minecraft:absorption
scoreboard players add @a[scores={eat.gapple=1..}] HPBuffer 20
scoreboard players set @a[scores={eat.gapple=1..}] eat.gapple 0