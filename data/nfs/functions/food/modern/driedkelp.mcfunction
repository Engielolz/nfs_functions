# Dried Kelp Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
scoreboard players add @a[scores={eat.kelp=1..}] HPBuffer 1
scoreboard players set @a[scores={eat.kelp=1..}] eat.kelp 0
