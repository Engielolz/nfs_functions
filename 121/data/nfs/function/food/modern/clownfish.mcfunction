# Tropical Fish Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
scoreboard players add @s[scores={NFS.eat.tfish=1..}] NFS.HPBuffer 1
scoreboard players set @s[scores={NFS.eat.tfish=1..}] NFS.eat.tfish 0
