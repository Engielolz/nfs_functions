# Cooked Salmon Function
# For use with the Nostalgic Food System by Engielolz
# Restores 6HP.
effect give @a[scores={eat.cslmn=1..}] minecraft:instant_health
effect give @a[scores={eat.cslmn=1..}] minecraft:regeneration 3 1
scoreboard players set @a[scores={eat.cslmn=1..}] eat.cslmn 0
