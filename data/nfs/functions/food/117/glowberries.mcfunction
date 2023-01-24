# Glow Berries Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
scoreboard players add @a[scores={NFS.eat.gberry=1..}] NFS.HPBuffer 2
scoreboard players set @a[scores={NFS.eat.gberry=1..}] NFS.eat.gberry 0
