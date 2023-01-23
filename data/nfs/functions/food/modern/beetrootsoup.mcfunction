# Beetroot Soup Function
# For use with the Nostalgic Food System by Engielolz
# Restores 6HP.
scoreboard players add @a[scores={eat.bsoup=1..}] NFS.HPBuffer 6
scoreboard players set @a[scores={eat.bsoup=1..}] eat.bsoup 0
