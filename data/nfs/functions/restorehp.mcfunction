execute if entity @a[scores={HPBuffer=8..,HPCooldown=0}] run function nfs:restore/8
execute if entity @a[scores={HPBuffer=4..,HPCooldown=0}] run function nfs:restore/4
execute if entity @a[scores={HPBuffer=3..,HPCooldown=0}] run function nfs:restore/3

execute if entity @a[scores={HPBuffer=1..,HPCooldown=0}] run function nfs:restore/1

scoreboard players remove @a[scores={HPCooldown=1..}] HPCooldown 1