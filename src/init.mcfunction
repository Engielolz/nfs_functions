# Nostalgic Food System Init function
gamerule naturalRegeneration false
scoreboard objectives add NFS.Hunger food "Hunger"
scoreboard objectives add NFS.HPBuffer dummy "HP Buffer"
scoreboard objectives add NFS.HPCooldown dummy "HP Cooldown"
scoreboard objectives add NFS.gaveSat dummy "Gave Saturation"
scoreboard objectives add NFS.Version trigger
scoreboard objectives add NFS.Options dummy "NFS Options"
scoreboard objectives add NFS.LastHunger dummy "Last Hunger"
scoreboard objectives add NFS.vulnCooldown dummy

# Default options
execute unless score combatSnapshot NFS.Options = combatSnapshot NFS.Options run scoreboard players set combatSnapshot NFS.Options 0
execute unless score overeatenCakes NFS.Options = overeatenCakes NFS.Options run scoreboard players set overeatenCakes NFS.Options 1
execute unless score vulnFoodCooldown NFS.Options = vulnFoodCooldown NFS.Options run scoreboard players set vulnFoodCooldown NFS.Options 1
execute unless score useRandom NFS.Options = useRandom NFS.Options run scoreboard players set useRandom NFS.Options 0

# Init RNG
scoreboard objectives add NFS.RNG.Var dummy
execute if score useRandom NFS.Options matches 0 run function nfs:rng/legacy_init

# Custom food initialization
function nfs:custom_init

# Food below
