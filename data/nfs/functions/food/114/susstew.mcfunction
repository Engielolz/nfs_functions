# Suspicious Stew Function
# For use with the Nostalgic Food System by Engielolz
# Restores 6HP.
scoreboard players add @a[scores={NFS.eat.sus=1..}] NFS.HPBuffer 6
scoreboard players set @a[scores={NFS.eat.sus=1..}] NFS.eat.sus 0
