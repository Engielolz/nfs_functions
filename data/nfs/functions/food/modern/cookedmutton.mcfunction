# Cooked Mutton Function
# For use with the Nostalgic Food System by Engielolz
# Restores 6HP.
scoreboard players add @a[scores={eat.cmutn=1..}] HPBuffer 6
scoreboard players set @a[scores={eat.cmutn=1..}] eat.cmutn 0
