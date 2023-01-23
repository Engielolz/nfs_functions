# Tropical Fish Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
scoreboard players add @a[scores={eat.tfish=1..}] NFS.HPBuffer 1
scoreboard players set @a[scores={eat.tfish=1..}] eat.tfish 0
