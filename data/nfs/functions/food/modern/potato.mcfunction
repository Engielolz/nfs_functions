# Potato Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
scoreboard players add @a[scores={NFS.eat.potato=1..}] NFS.HPBuffer 1
scoreboard players set @a[scores={NFS.eat.potato=1..}] NFS.eat.potato 0
