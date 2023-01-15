# Raw Mutton Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
scoreboard players add @a[scores={eat.rmutn=1..}] HPBuffer 2
scoreboard players set @a[scores={eat.rmutn=1..}] eat.rmutn 0
