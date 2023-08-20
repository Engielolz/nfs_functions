# Cooked Fish (Cod) Function
# For use with the Nostalgic Food System by Engielolz
# Restores 5HP.
scoreboard players add @s[scores={NFS.eat.cfish=1..}] NFS.HPBuffer 5
scoreboard players set @s[scores={NFS.eat.cfish=1..}] NFS.eat.cfish 0
