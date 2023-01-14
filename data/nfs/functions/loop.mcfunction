scoreboard players set @r Chosen 1
execute if entity @p[scores={Chosen=1..}] store result score @p[scores={Chosen=1..}] Hunger run data get entity @p[scores={Chosen=1..}] foodLevel
function nfs:foodcheck
# Cake can only be eaten 6 times
execute at @p[scores={Chosen=1..}] run fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace cake[bites=6]
scoreboard players set @p[scores={Chosen=1..}] Chosen 0