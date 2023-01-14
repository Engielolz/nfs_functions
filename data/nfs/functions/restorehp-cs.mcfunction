execute if entity @a[scores={HPBuffer=12..,HPCooldown=0}] run function nfs:restore/12-cs
execute if entity @a[scores={HPBuffer=6..,HPCooldown=0}] run function nfs:restore/6-cs
execute if entity @a[scores={HPBuffer=3..,HPCooldown=0}] run function nfs:restore/3
execute if entity @a[scores={HPBuffer=1..,HPCooldown=0}] run function nfs:restore/1

scoreboard players remove @a[scores={HPCooldown=1..}] HPCooldown 1