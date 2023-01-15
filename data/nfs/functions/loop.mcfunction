scoreboard players set @r Chosen 1
execute if entity @p[scores={Chosen=1..}] store result score @p[scores={Chosen=1..}] Hunger run data get entity @p[scores={Chosen=1..}] foodLevel
# Fix NFS not working if this isn't set
scoreboard players add @a HPCooldown 0
function nfs:foodcheck
function nfs:options
scoreboard players set @p[scores={Chosen=1..}] Chosen 0