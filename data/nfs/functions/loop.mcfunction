scoreboard players set @r Chosen 1
execute if entity @p[scores={Chosen=1..}] store result score @p[scores={Chosen=1..}] Hunger run data get entity @p[scores={Chosen=1..}] foodLevel
function nfs:foodcheck
scoreboard players set @p[scores={Chosen=1..}] Chosen 0