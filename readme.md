# Nostalgic Food System
This is a datapack for Minecraft: Java Edition.
Nostalgic Food System (NFS) tries to make food items behave like they do prior to Beta 1.8.

NFS should function on Minecraft 1.13 and higher. Some function trickery lets NFS support food introduced in newer Minecraft versions without breaking compatibility with older versions.

# Installation
To install, place the folder or zip in the datapacks folder. Once it loads it will begin functioning immediately.
If the server is already running, you need to type /reload after installing it.

Some non-vanilla servers like Paper might require you to enable it first with `/datapack enable "file/nfs_functions"`

# Usage
- Just install the datapack and load it (if needed). Further configuration is not needed nor available at this time.

# Errata
Important things to note:
## Health gain is not instantaneous in some cases
Some items use Regeneration to give health instead of Instant Health. Instant precise health gain is not available in vanilla right now.
If there is a mod that can interface via commands that can do just that, please let me know and I'll add support for it.
## Effects disappear/return after NFS adjusts the hunger bar.
The effects will disappear prior to 1.15.2-pre1 instead of returning.
There is no way to enforce any specific behavior other than modding or updating Minecraft
## Running on Bedrock
Bedrock edition does not have the scoreboard criteria necessary for NFS to work. However since everything is server-side, you can run a Java server and have Bedrock clients connect via Geyser. Do give that a try!
## Incorrect HP values in the Combat Tests
This won't be fixed until the changes appear in a non-experimental snapshot.

# Known Issues

- Cake can be eaten 7 times, restoring 3 HP more than in Beta 1.7
- If some foods are eaten in rapid succession, NFS may not give enough health

# How to add a new food
NFS supports adding in custom foods, here's how to do that.
> I am assuming you know how to edit files, have experience with minecraft commands, know what you're doing, etc...
## Adding a new init
> This section uses `minecraft.used` which should work for most foods. If it doesn't work for your food, try [checking here](https://minecraft.fandom.com/wiki/Scoreboard?so=search#Compound_criteria) for something that might

Edit `data\nfs\functions\custom_init.mcfunction` and add something like this
`scoreboard objectives add eat.mycustomfood minecraft.used:mymod:mycustomfood`
(Replace eat.mycustomfood with whatever you want, replace mymod:mycustomfood with the namespaced identifier of the food)
## Add check for your food
We set up the scoreboard thing, so now we need to check when Minecraft increments the thing because someone ate a food.

To do that, edit `data\nfs\functions\custom_food.mcfunction` with something like
`execute if entity @a[scores={eat.mycustomfood=1..}] run function nfs:food/mycustomfoodfolder/mycustomfood`

eat.mycustomfood is the scoreboard thing we set up earlier; make sure it matches if you changed it.

So Minecraft will execute `data\nfs\functions\food\mycustomfoodfolder\mycustomfood.mcfunction` if someone ate `mymod:mycustomfood`. If it doesn't exist, Minecraft will keep trying to do it every tick (I think) as the scoreboard isn't being reset.

## Make it give health
We set up the scoreboard and the check, so now we must create the file that will actually give out health.
So create `data\nfs\functions\food\mycustomfoodfolder\mycustomfood.mcfunction` (or whatever you named it) with these lines
`effect give @a[scores={eat.mycustomfood=1..}] minecraft:instant_health`
`scoreboard players set @a[scores={eat.mycustomfood=1..}] eat.mycustomfood 0`
Note that depending on the food, you may need to adjust the effect. Play with effects until you find something that works to restore the correct amount of HP.
The last command just resets the scoreboard because we don't want it giving an effect every tick.

# Potential improvements
- Use the Scoreboard to track how much HP to give. This can work around the cake bug by monitoring the player's HP and deducting the value of the scoreboard when health is given to the player.
  - That said Cake is the only food that really needs this. The food consuming animation is slow enough to not require it for any other food.

# Credits
* Credits to u/mingshi3_uiuc [on Reddit](http://redd.it/vv68n6) for the RNG implementation this datapack uses.
  * rng_init and rng_perform are the functions that use this implementation.
