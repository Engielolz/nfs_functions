# Cooked Fish (Cod) Function
# For use with the Nostalgic Food System by Engielolz
# Restores 5HP.
scoreboard players add @a[scores={eat.cfish=1..}] NFS.HPBuffer 5
scoreboard players set @a[scores={eat.cfish=1..}] eat.cfish 0
