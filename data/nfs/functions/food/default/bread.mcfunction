# Bread Function
# For use with the Nostalgic Food System by Engielolz
# Restores 5HP.
scoreboard players add @a[scores={eat.bread=1..}] NFS.HPBuffer 5
scoreboard players set @a[scores={eat.bread=1..}] eat.bread 0
