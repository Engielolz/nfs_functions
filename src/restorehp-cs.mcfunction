execute if entity @a[scores={NFS.HPBuffer=12..,NFS.HPCooldown=0}] run function nfs:restore/12-cs
execute if entity @a[scores={NFS.HPBuffer=6..,NFS.HPCooldown=0}] run function nfs:restore/6-cs
execute if entity @a[scores={NFS.HPBuffer=3..,NFS.HPCooldown=0}] run function nfs:restore/3
execute if entity @a[scores={NFS.HPBuffer=1..,NFS.HPCooldown=0}] run function nfs:restore/1

scoreboard players remove @a[scores={NFS.HPCooldown=1..}] NFS.HPCooldown 1