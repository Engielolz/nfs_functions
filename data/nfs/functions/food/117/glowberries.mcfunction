# Glow Berries Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
scoreboard players add @a[scores={eat.gberry=1..}] HPBuffer 2
scoreboard players set @a[scores={eat.gberry=1..}] eat.gberry 0
