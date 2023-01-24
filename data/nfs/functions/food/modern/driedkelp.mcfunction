# Dried Kelp Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
scoreboard players add @a[scores={NFS.eat.kelp=1..}] NFS.HPBuffer 1
scoreboard players set @a[scores={NFS.eat.kelp=1..}] NFS.eat.kelp 0
