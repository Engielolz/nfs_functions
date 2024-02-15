# RNG Thing
execute if score useRandom NFS.Options matches 1 run function nfs:rng/builtin
execute if score useRandom NFS.Options matches 0 run function nfs:rng/legacy_perform