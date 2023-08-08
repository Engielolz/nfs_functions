# (Raw) Chicken Function
# For use with the Nostalgic Food system by Engielolz
# Restore 2HP.
scoreboard players add @a[scores={NFS.eat.rchk=1..}] NFS.HPBuffer 2
# Remove Hunger from the player if the Chicken gave them it.
effect clear @a[scores={NFS.eat.rchk=1..}] minecraft:hunger
# Do RNG. 30% chance to poison them.
execute store result score RNG NFS.RNG.Var run random value 0..9
execute if score RNG NFS.RNG.Var matches 0..2 run effect give @a[scores={NFS.eat.rchk=1..}] minecraft:poison 30 0

# Clear the scoreboard because we don't want this happening every tick.
scoreboard players set @a[scores={NFS.eat.rchk=1..}] NFS.eat.rchk 0