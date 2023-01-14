# Chorus Fruit Function
# For use with the Nostalgic Food System by Engielolz
# Restores 4HP.
scoreboard players add @a[scores={eat.chorus=1..}] HPBuffer 4
scoreboard players set @a[scores={eat.chorus=1..}] eat.chorus 0
