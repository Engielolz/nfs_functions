# NFS Options
# This file should not be edited. Change options in-game with scoreboard players set <option> NFS.Options

# Combat Snapshot setting. Set combatSnapshot to 1 if you are using Combat Snapshot 8c.
execute if score combatSnapshot NFS.Options matches 1 run function nfs:restorehp-cs
execute if score combatSnapshot NFS.Options matches 0 run function nfs:restorehp

# By default NFS will remove cakes with 6 bites taken out of them to match pre-1.8.
# To disable this behavior, set overeatenCakes to 0.
execute if score overeatenCakes NFS.Options matches 1 run execute at @a run fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace cake[bites=6]