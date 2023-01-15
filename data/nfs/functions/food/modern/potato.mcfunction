# Potato Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
scoreboard players add @a[scores={eat.potato=1..}] HPBuffer 1
scoreboard players set @a[scores={eat.potato=1..}] eat.potato 0
