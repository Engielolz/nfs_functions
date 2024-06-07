# Nostalgic Food System

This is a datapack for Minecraft: Java Edition.
Nostalgic Food System (NFS) tries to make food items behave like they do prior to Beta 1.8.

NFS should function on Minecraft 1.13, although 1.13.1 and above is recommended. Some function trickery lets NFS support food introduced in newer Minecraft versions without breaking compatibility with older versions.

## Installation

To install, place the folder or zip in the datapacks folder. Once it loads it will begin functioning immediately.
If the server is already running, you need to type /reload after installing it.

Some non-vanilla servers like Paper might require you to enable it first with `/datapack enable "file/nfs_functions"`

## Usage

- Just install the datapack and load it (if needed).
- You can then set options to customize NFS to your needs (see below)

## Options

NFS currently has 4 options. You can configure options in-game with `/scoreboard players set <option> NFS.Options`.

Note that options were set by editing the options.mcfunction file in older (pre-Beta 1.3) versions of NFS. If you're upgrading you'll need to reapply your changes (if you set any).

* Combat Snapshot setting (`combatSnapshot`)*
  * This setting is for Combat Snapshot 8c. When set, NFS will use health values that are correct for that version.
* Remove Overeaten Cakes (`overeatenCakes`)
  * Starting in Minecraft 1.8, Cakes can be eaten 7 times instead of the previous 6. NFS by default removes Cakes with six bites to ensure that no more than 18 HP (how much Cake could restore in Beta 1.7.3) may be obtained from one Cake.
* Vulnerable Food Cooldown (`vulnFoodCooldown`)
  * This setting enforces a 32 tick cooldown after successfully eating a food item that is plantable. This further mitigates the plantable food exploit (#7) where it is possible to spam place the crop to gain health.
* Use /random (`useRandom`)*
  * When enabled, this uses Minecraft's built-in RNG found in 23w31a.
  * Requires 23w31a (1.20.2) or higher.

*: not available when using Minecraft 1.21

## Q&A I think

### Why isn't health gain instant?

Instant precise health gain is not available in vanilla Minecraft right now, so in some scenarios Regeneration is used to give health.

The HP Buffer system attempts to mitigate this by using Instant Health instead of Regeneration if possible.

If there is a mod that can interface via datapacks that can do just that, please let me know and I'll consider adding support for it.

### Why do effects disappear/return after NFS adjusts the hunger bar?

This has to do with how Minecraft handles potion effects.
The effects will disappear prior to 1.15.2-pre1 instead of returning.
This is a Minecraft limitation, and is no way to enforce any specific behavior other than modding or updating Minecraft.

### Can I use this with Bedrock Edition?

Bedrock Edition does not have the scoreboard criteria necessary for NFS to work. However since everything is server-side, you can run a Java server and have Bedrock clients connect via Geyser.

### Why is HP gain slower in the Combat Snapshots?

The Instant Health effect was changed to restore 6HP instead of 4HP in Combat Snapshot 8c. As a result, Regeneration must be used more often, causing health gain to be slower.

### Does this work with the food data component?

No. Foods harcoded into NFS will give the health specified by the datapack. Items given the food component are not considered by NFS, and setting eat_seconds to a value lower than default will conflict with NFS on 

## How to add a new food

NFS supports adding in custom foods, here's how to do that.

> I am assuming you know how to edit files, have experience with minecraft commands, know what you're doing, etc...

### Creating files

The correct way to do this is to create a folder, add your code, and then add entries in `custom_food.mcfunction` and `custom_init.mcfunction` to link it to NFS

* Start with creating the folder nfs/functions/food/<name>
  * <name> can be any name that MC will accept
* In that folder create `init.mcfunction`, `foodcheck.mcfunction` and `<name>.mcfunction`
  * <name> should be the name of the food but any name that MC will accept will work

For the sake of the tutorial the folder will be `customfoods` and the name of the file is `customfoodfile`.

### Adding a new init

> This section uses `minecraft.used` which should work for most foods. If it doesn't work for your food, try [checking here](https://minecraft.wiki/wiki/Scoreboard#Compound_criteria) for something that might

Edit `data\nfs\functions\customfoods\init.mcfunction` and add something like this
`scoreboard objectives add eat.mycustomfood minecraft.used:mymod:mycustomfood`

(Replace eat.mycustomfood with whatever you want, replace mymod:mycustomfood with the namespaced identifier of the food)

### Add check for your food

We set up the scoreboard thing, so now we need to check when Minecraft increments the thing because someone ate a food.

To do that, edit `data\nfs\functions\customfoods\foodcheck.mcfunction` with something like

`execute if entity @a[scores={eat.mycustomfood=1..}] run function nfs:food/customfoods/mycustomfood`

eat.mycustomfood is the scoreboard thing we set up earlier; make sure it matches if you changed it.

So Minecraft will execute `data\nfs\functions\food\customfoods\customfoodfile.mcfunction` if someone ate `mymod:mycustomfood`. If it doesn't exist, Minecraft will keep trying to do it every tick (I think) as the scoreboard isn't being reset.

### Make it give health

We set up the scoreboard and the check, so now we must create the file that will actually give out health.
So create `data\nfs\functions\food\customfoods\customfoodfile.mcfunction` (or whatever you named it) with these lines

`scoreboard players add @a[scores={eat.mycustomfood=1..}] HPBuffer value`

`scoreboard players set @a[scores={eat.mycustomfood=1..}] eat.mycustomfood 0`

Change value above to the amount of HP to restore.

The last command just resets the scoreboard because we don't want it giving an effect every tick.

One problem though, this won't work because we didn't tell NFS to look at what you just coded - let's fix that.

### Telling NFS to read your code

Edit `custom_init.mcfunction` and add `function nfs:food/customfoods/init` so it will properly set up your food.

Then edit `custom_food.mcfunction` and add `function nfs:food/customfoods/foodcheck` so it'll check to see if anyone's eaten your food every tick.

And after you `/reload` it should now work!

## Credits

* Credits to u/mingshi3_uiuc [on Reddit](http://redd.it/vv68n6) for the RNG implementation that the 1.13-1.20 version of this datapack uses.
  * rng_init and rng_perform are the functions that use this implementation.
