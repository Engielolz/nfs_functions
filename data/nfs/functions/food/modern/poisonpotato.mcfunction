# Poisonous Potato Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
scoreboard players add @a[scores={NFS.eat.ppotato=1..}] NFS.HPBuffer 2
scoreboard players set @a[scores={NFS.eat.ppotato=1..}] NFS.eat.ppotato 0
