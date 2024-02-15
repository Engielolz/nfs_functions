execute if entity @a[scores={NFS.HPBuffer=8..,NFS.HPCooldown=0}] run function nfs:restore/8
execute if entity @a[scores={NFS.HPBuffer=4..,NFS.HPCooldown=0}] run function nfs:restore/4
execute if entity @a[scores={NFS.HPBuffer=3..,NFS.HPCooldown=0}] run function nfs:restore/3

execute if entity @a[scores={NFS.HPBuffer=1..,NFS.HPCooldown=0}] run function nfs:restore/1

scoreboard players remove @a[scores={NFS.HPCooldown=1..}] NFS.HPCooldown 1