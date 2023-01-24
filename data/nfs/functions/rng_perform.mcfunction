# RNG Perform
# Credit: redd.it/vv68n6
scoreboard players add RNGseed NFS.RNG.Var 1
execute store result score RNG NFS.RNG.Var run time query gametime
scoreboard players operation RNG NFS.RNG.Var *= RNGseed NFS.RNG.Var
scoreboard players operation RNG NFS.RNG.Var *= C_314159 NFS.RNG.Const
scoreboard players operation RNG NFS.RNG.Var *= C_2718281 NFS.RNG.Const
scoreboard players operation RNG NFS.RNG.Var *= RNG NFS.RNG.Var
scoreboard players operation RNG NFS.RNG.Var /= C_1000 NFS.RNG.Const
scoreboard players operation RNG NFS.RNG.Var *= C_314159 NFS.RNG.Const
scoreboard players operation RNG NFS.RNG.Var *= C_2718281 NFS.RNG.Const
scoreboard players operation RNG NFS.RNG.Var %= C_10 NFS.RNG.Const
# Don't be so negative, RNGesus! Fix for #5 (1.13.0 only)
execute if score RNG NFS.RNG.Var matches ..-1 run scoreboard players operation RNG NFS.RNG.Var *= C_-1 NFS.RNG.Const