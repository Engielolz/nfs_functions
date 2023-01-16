# Nostalgic Food System Init function
gamerule naturalRegeneration false
scoreboard objectives add Hunger dummy
scoreboard objectives add HPBuffer dummy
scoreboard objectives add HPCooldown dummy
scoreboard objectives add NFSVersion trigger

# Init RNG
function nfs:rng_init

# Food prior to Beta 1.8
scoreboard objectives add eat.raw minecraft.used:minecraft.porkchop
scoreboard objectives add eat.cooked minecraft.used:minecraft.cooked_porkchop
scoreboard objectives add eat.apple minecraft.used:minecraft.apple
scoreboard objectives add eat.gapple minecraft.used:minecraft.golden_apple
scoreboard objectives add eat.rfish minecraft.used:minecraft.cod
scoreboard objectives add eat.cfish minecraft.used:minecraft.cooked_cod
scoreboard objectives add eat.cookie minecraft.used:minecraft.cookie
scoreboard objectives add eat.bread minecraft.used:minecraft.bread
scoreboard objectives add eat.stew minecraft.used:minecraft.mushroom_stew
scoreboard objectives add eat.cake minecraft.custom:minecraft.eat_cake_slice

# Introduced in Beta 1.8
scoreboard objectives add eat.rbeef minecraft.used:minecraft.beef
scoreboard objectives add eat.steak minecraft.used:minecraft.cooked_beef
scoreboard objectives add eat.rchk minecraft.used:minecraft.chicken
scoreboard objectives add eat.cchk minecraft.used:minecraft.cooked_chicken
scoreboard objectives add eat.melon minecraft.used:minecraft.melon_slice
scoreboard objectives add eat.rflesh minecraft.used:minecraft.rotten_flesh

# Introduced prior to 1.4.2
scoreboard objectives add eat.seye minecraft.used:minecraft.spider_eye
scoreboard objectives add eat.egapple minecraft.used:minecraft.enchanted_golden_apple

# Introduced in 1.4.2
scoreboard objectives add eat.carrot minecraft.used:minecraft.carrot
scoreboard objectives add eat.gcarrot minecraft.used:minecraft.golden_carrot
scoreboard objectives add eat.potato minecraft.used:minecraft.potato
scoreboard objectives add eat.bpotato minecraft.used:minecraft.baked_potato
scoreboard objectives add eat.ppotato minecraft.used:minecraft.poisonous_potato
scoreboard objectives add eat.ppie minecraft.used:minecraft.pumpkin_pie

# 1.7.2
scoreboard objectives add eat.tfish minecraft.used:tropical_fish
scoreboard objectives add eat.rslmn minecraft.used:salmon
scoreboard objectives add eat.cslmn minecraft.used:cooked_salmon
scoreboard objectives add eat.pfish minecraft.used:pufferfish

# 1.8
scoreboard objectives add eat.rmutn minecraft.used:mutton
scoreboard objectives add eat.cmutn minecraft.used:cooked_mutton
scoreboard objectives add eat.rrabt minecraft.used:rabbit
scoreboard objectives add eat.crabt minecraft.used:cooked_rabbit
scoreboard objectives add eat.rstew minecraft.used:rabbit_stew

# 1.9
scoreboard objectives add eat.chorus minecraft.used:chorus_fruit
scoreboard objectives add eat.broot minecraft.used:beetroot
scoreboard objectives add eat.bsoup minecraft.used:beetroot_soup

# 1.13
scoreboard objectives add eat.kelp minecraft.used:dried_kelp

# 1.14
function nfs:backcompat/114food

# 1.15
function nfs:backcompat/115food

# 1.17
function nfs:backcompat/117food

# Custom food initialization
function nfs:custom_init