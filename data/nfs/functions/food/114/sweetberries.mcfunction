# Sweet Berries Function
# For use with the Nostalgic Food System by Engielolz
# Restores 2HP.
scoreboard players add @a[scores={eat.berry=1..}] NFS.HPBuffer 2
scoreboard players set @a[scores={eat.berry=1..}] eat.berry 0
