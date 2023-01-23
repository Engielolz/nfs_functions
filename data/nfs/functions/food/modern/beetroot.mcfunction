# Beetroot Function
# For use with the Nostalgic Food System by Engielolz
# Restores 1HP.
scoreboard players add @a[scores={eat.broot=1..}] NFS.HPBuffer 1
scoreboard players set @a[scores={eat.broot=1..}] eat.broot 0
