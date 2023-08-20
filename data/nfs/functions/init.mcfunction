# Nostalgic Food System Init function
gamerule naturalRegeneration false
scoreboard objectives add NFS.Hunger food "Hunger"
scoreboard objectives add NFS.HPBuffer dummy "HP Buffer"
scoreboard objectives add NFS.HPCooldown dummy "HP Cooldown"
scoreboard objectives add NFS.gaveSat dummy "Gave Saturation"
scoreboard objectives add NFS.Version trigger
scoreboard objectives add NFS.Options dummy "NFS Options"

# Default options
execute unless score combatSnapshot NFS.Options = combatSnapshot NFS.Options run scoreboard players set combatSnapshot NFS.Options 0
execute unless score overeatenCakes NFS.Options = overeatenCakes NFS.Options run scoreboard players set overeatenCakes NFS.Options 1

# Init RNG
function nfs:rng_init

# Food prior to Beta 1.8
scoreboard objectives add NFS.eat.raw minecraft.used:minecraft.porkchop
scoreboard objectives add NFS.eat.cooked minecraft.used:minecraft.cooked_porkchop
scoreboard objectives add NFS.eat.apple minecraft.used:minecraft.apple
scoreboard objectives add NFS.eat.gapple minecraft.used:minecraft.golden_apple
scoreboard objectives add NFS.eat.rfish minecraft.used:minecraft.cod
scoreboard objectives add NFS.eat.cfish minecraft.used:minecraft.cooked_cod
scoreboard objectives add NFS.eat.cookie minecraft.used:minecraft.cookie
scoreboard objectives add NFS.eat.bread minecraft.used:minecraft.bread
scoreboard objectives add NFS.eat.stew minecraft.used:minecraft.mushroom_stew
scoreboard objectives add NFS.eat.cake minecraft.custom:minecraft.eat_cake_slice

# Introduced in Beta 1.8
scoreboard objectives add NFS.eat.rbeef minecraft.used:minecraft.beef
scoreboard objectives add NFS.eat.steak minecraft.used:minecraft.cooked_beef
scoreboard objectives add NFS.eat.rchk minecraft.used:minecraft.chicken
scoreboard objectives add NFS.eat.cchk minecraft.used:minecraft.cooked_chicken
scoreboard objectives add NFS.eat.melon minecraft.used:minecraft.melon_slice
scoreboard objectives add NFS.eat.rflesh minecraft.used:minecraft.rotten_flesh

# Introduced prior to 1.4.2
scoreboard objectives add NFS.eat.seye minecraft.used:minecraft.spider_eye
scoreboard objectives add NFS.eat.egapple minecraft.used:minecraft.enchanted_golden_apple

# Introduced in 1.4.2
scoreboard objectives add NFS.eat.carrot minecraft.used:minecraft.carrot
scoreboard objectives add NFS.eat.gcarrot minecraft.used:minecraft.golden_carrot
scoreboard objectives add NFS.eat.potato minecraft.used:minecraft.potato
scoreboard objectives add NFS.eat.bpotato minecraft.used:minecraft.baked_potato
scoreboard objectives add NFS.eat.ppotato minecraft.used:minecraft.poisonous_potato
scoreboard objectives add NFS.eat.ppie minecraft.used:minecraft.pumpkin_pie

# 1.7.2
scoreboard objectives add NFS.eat.tfish minecraft.used:tropical_fish
scoreboard objectives add NFS.eat.rslmn minecraft.used:salmon
scoreboard objectives add NFS.eat.cslmn minecraft.used:cooked_salmon
scoreboard objectives add NFS.eat.pfish minecraft.used:pufferfish

# 1.8
scoreboard objectives add NFS.eat.rmutn minecraft.used:mutton
scoreboard objectives add NFS.eat.cmutn minecraft.used:cooked_mutton
scoreboard objectives add NFS.eat.rrabt minecraft.used:rabbit
scoreboard objectives add NFS.eat.crabt minecraft.used:cooked_rabbit
scoreboard objectives add NFS.eat.rstew minecraft.used:rabbit_stew

# 1.9
scoreboard objectives add NFS.eat.chorus minecraft.used:chorus_fruit
scoreboard objectives add NFS.eat.broot minecraft.used:beetroot
scoreboard objectives add NFS.eat.bsoup minecraft.used:beetroot_soup

# 1.13
scoreboard objectives add NFS.eat.kelp minecraft.used:dried_kelp

# 1.14
function nfs:backcompat/114food

# 1.15
function nfs:backcompat/115food

# 1.17
function nfs:backcompat/117food

# Custom food initialization
function nfs:custom_init