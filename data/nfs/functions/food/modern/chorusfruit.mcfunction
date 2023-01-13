# Chorus Fruit Function
# For use with the Nostalgic Food System by Engielolz
# Restores 4HP.
effect give @a[scores={eat.chorus=1..}] minecraft:instant_health
scoreboard players set @a[scores={eat.chorus=1..}] eat.chorus 0
