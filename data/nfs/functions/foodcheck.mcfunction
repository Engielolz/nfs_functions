effect give @a[scores={NFS.Hunger=9..}] minecraft:hunger 1 255 true
effect give @a[scores={NFS.Hunger=..7}] minecraft:saturation 1 0 true
function nfs:custom_food

# Introduced prior to Beta 1.8
execute if entity @a[scores={NFS.eat.cooked=1..}] run function nfs:food/default/cookedpork
execute if entity @a[scores={NFS.eat.raw=1..}] run function nfs:food/default/rawpork
execute if entity @a[scores={NFS.eat.apple=1..}] run function nfs:food/default/apple
execute if entity @a[scores={NFS.eat.gapple=1..}] run function nfs:food/default/gapple-yukari
execute if entity @a[scores={NFS.eat.rfish=1..}] run function nfs:food/default/fish
execute if entity @a[scores={NFS.eat.cfish=1..}] run function nfs:food/default/cookedcod
execute if entity @a[scores={NFS.eat.cookie=1..}] run function nfs:food/default/cookie
execute if entity @a[scores={NFS.eat.bread=1..}] run function nfs:food/default/bread
execute if entity @a[scores={NFS.eat.stew=1..}] run function nfs:food/default/mstew
execute if entity @a[scores={NFS.eat.cake=1..}] run function nfs:food/default/cake

# Introduced in Beta 1.8
execute if entity @a[scores={NFS.eat.rbeef=1..}] run function nfs:food/beta18/rawbeef
execute if entity @a[scores={NFS.eat.steak=1..}] run function nfs:food/beta18/steak
execute if entity @a[scores={NFS.eat.rchk=1..}] run function nfs:food/beta18/chicken
execute if entity @a[scores={NFS.eat.cchk=1..}] run function nfs:food/beta18/cookedchicken
execute if entity @a[scores={NFS.eat.melon=1..}] run function nfs:food/beta18/melon
execute if entity @a[scores={NFS.eat.rflesh=1..}] run function nfs:food/beta18/rottenflesh

# Introduced prior to 1.4.2
execute if entity @a[scores={NFS.eat.seye=1..}] run function nfs:food/modern/spidereye
execute if entity @a[scores={NFS.eat.egapple=1..}] run function nfs:food/modern/enchantedapple

# Introduced in 1.4.2
execute if entity @a[scores={NFS.eat.carrot=1..}] run function nfs:food/modern/carrot
execute if entity @a[scores={NFS.eat.gcarrot=1..}] run function nfs:food/modern/goldencarrot
execute if entity @a[scores={NFS.eat.potato=1..}] run function nfs:food/modern/potato
execute if entity @a[scores={NFS.eat.bpotato=1..}] run function nfs:food/modern/bakedpotato
execute if entity @a[scores={NFS.eat.ppotato=1..}] run function nfs:food/modern/poisonpotato
execute if entity @a[scores={NFS.eat.ppie=1..}] run function nfs:food/modern/pumpkinpie

# 1.7.2
execute if entity @a[scores={NFS.eat.tfish=1..}] run function nfs:food/modern/clownfish
execute if entity @a[scores={NFS.eat.rslmn=1..}] run function nfs:food/modern/rawsalmon
execute if entity @a[scores={NFS.eat.cslmn=1..}] run function nfs:food/modern/cookedsalmon
execute if entity @a[scores={NFS.eat.pfish=1..}] run function nfs:food/modern/pufferfish

# 1.8
execute if entity @a[scores={NFS.eat.rmutn=1..}] run function nfs:food/modern/rawmutton
execute if entity @a[scores={NFS.eat.cmutn=1..}] run function nfs:food/modern/cookedmutton
execute if entity @a[scores={NFS.eat.rrabt=1..}] run function nfs:food/modern/rawrabbit
execute if entity @a[scores={NFS.eat.crabt=1..}] run function nfs:food/modern/cookedrabbit
execute if entity @a[scores={NFS.eat.rstew=1..}] run function nfs:food/modern/rabbitstew

# 1.9
execute if entity @a[scores={NFS.eat.chorus=1..}] run function nfs:food/modern/chorusfruit
execute if entity @a[scores={NFS.eat.broot=1..}] run function nfs:food/modern/beetroot
execute if entity @a[scores={NFS.eat.bsoup=1..}] run function nfs:food/modern/beetrootsoup

# 1.13
execute if entity @a[scores={NFS.eat.kelp=1..}] run function nfs:food/modern/driedkelp

# 1.14
execute if entity @a[scores={NFS.eat.sus=1..}] run function nfs:food/114/susstew
execute if entity @a[scores={NFS.eat.berry=1..}] run function nfs:food/114/sweetberries

# Element 1.15
execute if entity @a[scores={NFS.eat.honey=1..}] run function nfs:food/115/honeybottle

# 1.17
execute if entity @a[scores={NFS.eat.gberry=1..}] run function nfs:food/117/glowberries