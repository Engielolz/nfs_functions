# Rabbit Stew Function
# For use with the Nostalgic Food System by Engielolz
# Restores 10HP.
scoreboard players add @a[scores={eat.rstew=1..}] NFS.HPBuffer 10
scoreboard players set @a[scores={eat.rstew=1..}] eat.rstew 0
