# Cooked Fish (Cod) Function
# For use with the Nostalgic Food System by Engielolz
# Restores 5HP.
scoreboard players add @a[scores={NFS.eat.cfish=1..}] NFS.HPBuffer 5
scoreboard players set @a[scores={NFS.eat.cfish=1..}] NFS.eat.cfish 0
