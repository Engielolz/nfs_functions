# NFS Options

# Combat Snapshot setting. Uncomment below line if you are using Combat Snapshot 8c, then comment out the line below it.
#function nfs:restorehp-cs
function nfs:restorehp

# By default NFS will remove cakes with 6 bites taken out of them to match pre-1.8.
# To disable this behavior, comment out the following line.
execute at @p[scores={Chosen=1..}] run fill ~-5 ~-5 ~-5 ~5 ~5 ~5 air replace cake[bites=6]