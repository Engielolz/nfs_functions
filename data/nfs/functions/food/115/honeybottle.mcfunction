# Honey Bottle Function
# For use with the Nostalgic Food System by Engielolz
# Restores 6HP.
scoreboard players add @a[scores={eat.honey=1..}] HPBuffer 6
scoreboard players set @a[scores={eat.honey=1..}] eat.honey 0
