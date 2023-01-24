# Nostalgic Food System
This is a datapack for Minecraft: Java Edition.
Nostalgic Food System (NFS) tries to make food items behave like they do prior to Beta 1.8.

NFS should function on Minecraft 1.13, although 1.13.1 and above is recommended. Some function trickery lets NFS support food introduced in newer Minecraft versions without breaking compatibility with older versions.

# Installation
To install, place the folder or zip in the datapacks folder. Once it loads it will begin functioning immediately.
If the server is already running, you need to type /reload after installing it.

Some non-vanilla servers like Paper might require you to enable it first with `/datapack enable "file/nfs_functions"`

# Usage
- Just install the datapack and load it (if needed).

## Options
NFS currently has 2 settings that can be configured in the options.mcfunction file.
* Combat Snapshot setting
  * This setting is for Combat Snapshot 8c. When set, NFS will use health values that are correct for that version.
* Overeaten Cake removal
  * Starting in Minecraft 1.8, Cakes can be eaten 7 times instead of the previous 6. NFS by default removes Cakes with six bites to ensure that no more than 18 HP (how much Cake could restore in Beta 1.7.3) may be obtained from one Cake. Commenting out the line disables this behavior.

# Errata
Important things to note:
## Health gain is not instantaneous in some cases
Some items require Regeneration to give out the correct amount of health. Instant precise health gain is not available in vanilla right now.
The new HP Buffer system attempts to mitigate this by using Instant Health instead of Regeneration if possible.

If there is a mod that can interface via datapacks that can do just that, please let me know and I'll consider adding support for it.

## Effects disappear/return after NFS adjusts the hunger bar.
The effects will disappear prior to 1.15.2-pre1 instead of returning.
There is no way to enforce any specific behavior other than modding or updating Minecraft
## Running on Bedrock
Bedrock edition does not have the scoreboard criteria necessary for NFS to work. However since everything is server-side, you can run a Java server and have Bedrock clients connect via Geyser. Do give that a try!
## HP gain is slower in the Combat Snapshots
The Instant Health effect was changed to restore 6HP instead of 4HP in Combat Snapshot 8c. As a result, Regeneration must be used more often, causing health gain to be slower.

# Known Issues
- NFS may not give enough health with sufficiently high HP buffer
  - This is not possible in the vanilla configuration but may occur with the HP Buffer being set to a very high value.

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

`scoreboard players add @a[scores={eat.mycustomfood=1..}] HPBuffer value`

`scoreboard players set @a[scores={eat.mycustomfood=1..}] eat.mycustomfood 0`

Change value above to the amount of HP to restore.

The last command just resets the scoreboard because we don't want it giving an effect every tick.

# Credits
* Credits to u/mingshi3_uiuc [on Reddit](http://redd.it/vv68n6) for the RNG implementation this datapack uses.
  * rng_init and rng_perform are the functions that use this implementation.
