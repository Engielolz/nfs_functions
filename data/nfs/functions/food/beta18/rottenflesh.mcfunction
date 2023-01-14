# Rotten Flesh Function
# For use with the Nostalgic Food system by Engielolz
# Restores 4HP with 80% chance to inflict Poison.
scoreboard players add @a[scores={eat.rflesh=1..}] HPBuffer 4
effect clear @a[scores={eat.rflesh=1..}] minecraft:hunger
function nfs:rng_perform
execute if score RNG RNG_Variable matches 0..7 run effect give @a[scores={eat.rflesh=1..}] minecraft:poison 30 0
scoreboard players set @a[scores={eat.rflesh=1..}] eat.rflesh 0