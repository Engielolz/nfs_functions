# (Raw) Chicken Function
# For use with the Nostalgic Food system by Engielolz
# Restore 2HP.
scoreboard players add @a[scores={eat.rchk=1..}] NFS.HPBuffer 2
# Remove Hunger from the player if the Chicken gave them it.
effect clear @a[scores={eat.rchk=1..}] minecraft:hunger
# Do RNG. 30% chance to poison them.
function nfs:rng_perform
execute if score RNG RNG_Variable matches 0..2 run effect give @a[scores={eat.rchk=1..}] minecraft:poison 30 0
execute if score RNG RNG_Variable matches ..-1 run say Internal RNG Error. Please report!

# Clear the scoreboard because we don't want this happening every tick.
scoreboard players set @a[scores={eat.rchk=1..}] eat.rchk 0