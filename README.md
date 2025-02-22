## Write up: `Sotel` 

# Keybinds
## OffenseMode
Cycle via Keybind: <kbd>F12</kbd>

Changed in game via command: `gs c OffenseMode  <mode>`

Ex: `gs c OffenseMode PDL`

## WeaponMode
Cycle via Keybind: <kbd>F9</kbd>

Changed in game via command: `gs c WeaponmMode <mode>`

Ex: `gs c WeaponMode "Savage Blade"`

## TreasureHunter
Cycle via Keybind: <kbd>F11</kbd>

Changed in game via command: `gs c TreasureHunter <mode>`

Ex: `gs c TreasureHunter "Full Time"`

## AutoBuff
Cycle via Keybind: <kbd>F10</kbd>

Changed in game via command: `gs c AutoBuff <mode>`

Ex: `gs c AutoBuff On`

## JobMode
Cycle via Keybind: <kbd><kbd>CTRL</kbd> + <kbd>F12</kbd></kbd>

Ex: PLD can have `Auto Tank` or `Ranged Mode` for RNG

Changed in game via command: `gs c JobMode <mode>`

Ex: `gs c JobMode Ranged`

## JobMode2
Cycle via Keybind: <kbd><kbd>CTRL</kbd> + <kbd>F11</kbd></kbd>

Ex: PLD sub RUN can have a element specified for `Rune Enhancement`

Changed in game via command: `gs c JobMode2 <mode>`

Ex: `gs c JobMode2 Water`

---

# Settings specified in `<job>.lua`

## Ammo_Warning_Limit
When below the specified threshold, will log a warning on precast. The default is 99x items.

Ex: `Ammo_Warning_Limit = 66`

## AutoItem
Enable the use of Remedy, Holy Water, and Echo Drops automatically.

Ex: `AutoItem = true`

## Food
Allows a command to use a specified type of food.

Ex: `Food = "Miso Ramen"`

Command: `gs c food`

## Buff_Delay
Used to control frequency of buff usage with Auto Buff.

Ex: `Buff_Delay = 2`

## Tank_Delay
Used to control frequency of buff usage with Auto Tank.

Ex: `Tank_Delay = 1`

## LockstylePallet
Allows the character to set the lockstyle specified in the in-game `Equip Sets`.

Ex: `LockStylePallet = "6"`

## MacroBook
Set the in-game macro book upon loading the gearswap file.

Ex: `MacroBook = "6"`

## MacroSet
Set the macro page upon loading the gearswap file.

Ex: `MacroSet = "1"`

## Random_Lockstyle
Enables a random lockstyle to use.

Ex: `Random_Lockstyle = true`

## Lockstyle_List
Lockstyle sets to randomly equip when `Random_Lockstyle` is enabled.

Ex: `Lockstyle_List = { 1, 6, 7 }`

---

# Self Commands
Called with `gs c <command>`

All commands are case insensitive

## `update auto`
Updates the player's gear given the current state of the player.

## `shutdown`
Sends `terminate` command to kill the game

## `save`
Saves the current settings for the character.

Ex: `Display Location`

## `display`

Toggles the in game HUD visibility.

## `debug`
Toggles the debug state to enable in-game logs and a HUD.

## `info`
Toggles on/off in-game message info

Ex: `Skillchain` and `Equipment Set` messages

## `two_hand_check`
Runs a check to see if user is equipped with a two handed weapon. Impacts which gearset is used.

Can be viewed in the debug HUD when trouble shooting

## `temps`
Shortcut to use the following items, with a 2.5 second delay:
- Monarch's Drink
- Braver's Drink
- Fighter's Drink
- Champion's Drink
- Soldier's Drink
- Barbarian's Drink

## `warp`
Uses the Warp Ring

## `warp club`
Uses a Warp Cudgel

## `holla`
Uses the Dim. Ring (Holla)

## `dem`
Uses the Dim. Ring (Dem)

## `mea`
Uses the Dim. Ring (Mea)

## `cp`
Uses the Trizek Ring


## `profile`
Executes a script file when called with option for folders

Ex: `gs c profile folder1 folder2`

## `food`
Uses food item defined in gearswap file.

Ex: `Food = "Miso Ramen"` will use Miso Ramen

## `use <enchantment item>`
Equip and uses an item with an enchantment value.

Ex: `gs c use "Empress Band"`

---

# Engine Checks

## Weapon dual wield and two handed checks
### Dual Wield
Checks if the user has the dual wield trait.

Enables the use of `sets.DualWield`

Ex: When `DualWield = true`, `sets.DualWield` will be layered on top of the current set.

### Two Hand Check
Checks if the user has a two handed weapon.

### Shield
When both Dual Wield and Two Handed modes come back as false, it will layer `sets.Weapons.Shield` on top of the current set.

Ex: Inside Odyssey without a subjob, as a COR you can have the following and it will automatically equip the shield as you are using a single handed weapon without access to the dual wield trait.
```lua
sets.Weapons['Death Penalty'] = 
{
	main = "Rostam",
	sub = "Tauret",
	range = "Death Penalty",
}

sets.Weapons.Shield = 
{
	sub = "Nusku Shield"
}
```

## Elemental Checks
Checks for the following, in the priority listed:
- Double Weather
	- auto equip Hachirin-no-Obi
- Day and Weather
	- auto equip Hachirin-no-Obi
- Distance less than 6 yalms
	- auto equip Orpheus's Sash
- Match Day or Weather
	- auto equip Hachirin-no-Obi

---

## Predefined Spell, Buff, Elemental WS, and more
Useful if you want different logic based on spell sets. I'm not going to list all of them, but you can find all the sets defined towards the top of the include file, underneath all the predefined sets and states.

The most useful in my opinion is `SongCount`. `SongCount` is a dictionary of specific songs, which when used, will automatically equip your defined song count instrument, specified with `Instrument.Count` in your `BRD.lua`. 

These songs are:
- Knight's Minne
- Knight's Minne II
- Army's Paeon
- Army's Paeon II
- Army's Paeon III
- Army's Paeon IV
- Fowl Aubade
- Herb Pastoral
- Shining Fantasia
- Scop's Operetta
- Puppet's Operetta
- Gold Capriccio
- Warding Round
- Goblin Gavotte

If your Dummy Songs in Silmaril are set to any of the above, you do not need to worry about equipping the appropriate weapon yourself, it will be handled for you.
