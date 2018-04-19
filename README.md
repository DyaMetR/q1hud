# Quake 1 HUD
### A HUD replacement for Garry's Mod

## Index
+   [Features](#features)
+   [How to add content](#how-to-add-content)
    -   [Skins](#skins)
    -   [Weapon icons](#weapon-icons)
        +   [Link a weapon to an existing icon](#link-a-weapon-to-an-existing-icon)
        +   [Adding a custom icon](#adding-a-custom-icon)
    -   [Ammunition icons](#ammunition-icons)
        +   [Link an ammunition type to an existing icon](#link-an-ammunition-type-to-an-existing-icon)
        +   [Adding a custom icon](#adding-a-custom-icon)
        +   [Linking an ammunition custom name to an existing icon](#linking-an-ammunition-custom-name-to-an-existing-icon)
    -   [Item pickup text](#item-pickup-text)
    -   [Weapon and ammo inventory icons](#weapon-and-ammo-inventory-icons)
    -   [Add loading screen strings](#add-loading-screen-strings)
        +   [Loading sequence](#loading-sequence)
        +   [Easter eggs](#easter-eggs)

## Features

## How to add content

There's a global texture table where the resources to be drawn will be searched
for there. By default, all icons will be entries to that table.

However don't worry, you'll be able to add more icons depending on your
needs for each section.

**First of all** it's **highly recommended** to use the built-in **add-ons**
folder that comes with the addon. This is because the script **will load
any files inside that folder just after loading the HUD resources** so no
errors will appear.

To do this, you've got to put your custom scripts in the folder:

`lua/autorun/q1hud/add-ons`

Inside your own addon folder, or just directly into the garrysmod folder,
but it's recommended to separate your scripts in addons.

### Skins

You can add a complete different look to the HUD. This can be done by adding
a skin with the following function:

`Q1HUD:AddSkin(name, data)`

The _data_ parameter refers to the table that contains all of the textures. In
order to create one of these tables, you simply have to create a table and
then use the following functon to add textures to it:

`Q1HUD:AddTexture(data_table, texture_name, texture_file, x, y, w, h)`

Since this HUD supports **spritesheets**, the x and y parameters are to
cut out certain tiles in a file. If you're using just one file, put x and y both
to 0.

**If your skin has a texture missing, the equivalent texture of the default skin
will be rendered. This is why it is NOT recommended to alter or delete the
default skin.**

### Weapon icons
#### Link a weapon to an existing icon

In order to link an icon from the texture table to a weapon, you can use:

`Q1HUD:AddWeaponIcon(weapon, icon)`

#### Adding a custom icon

If you wish to add a custom icon that isn't on the texture table, you can
do that by using:

`Q1HUD:AddWeaponResource(icon, texture_path, isMaterial)`

The _isMaterial_ field is optional, and will tell if the given texture is
a _*.png*_ or _*.vtf*_.

### Ammunition icons
#### Link an ammunition type to an existing icon

There's a global texture table where the resources to be drawn will be searched
for there. By default, all icons will be entries to that table.

In order to link an icon from the texture table to an ammunition type, you can use:

`Q1HUD:AddAmmoIcon(ammunition_type, small_icon, big_icon)`

The _small icon_ is the icon shown on the inventory while the _big icon_ is
the one shown at the _*active weapon's ammunition indicator*_.

#### Adding a custom icon

However, if you wish to use an existing ammo icon, you can do so without
having to modify any skin files. You can use:

`Q1HUD:AddAmmoResource(icon_name, texture_path, isMaterial)`

The _isMaterial_ field is optional, and will tell if the given texture is
a _*.png*_ or _*.vtf*_.

This way, you can link a custom resource to an ammo type just as if it was
a default texture.

#### Linking an ammunition custom name to an existing icon

At last, but not least, there's the instance where an addon will rename an
existing ammunition type in order to suit their needs.

In this case, you can also link a set of icons to an ammunition type depending
on the name. To do this you can use:

`Q1HUD:AddAmmoCustomNameIcon(ammunition_name, small_icon, big_icon)`

### Item pickup text

This is rather simple. You can link an item picked up to a custom text shown
at the log. This can be done by simply doing:

`Q1HUD:AddItemString(item_class, string)`

### Weapon and ammo inventory icons

As you may know, this HUD has an inventory that shows weapons that the player
has, and the ammunition levels. This can be customized by the user by choosing
which weapons and/or ammo icons they want on display.

To add more weapon/ammo icons as a choice, you can use the following methods:

`Q1HUD:AddSelectableWeapon(weapon_class, weapon_name)`

`Q1HUD:AddSelectableAmmo(ammo_type, ammo_name)`

### Add loading screen strings

This addon comes with a fake loading screen simulating that of Quake's.
It has three phases: First it prints a fake loading sequence, then it checks for
a random number in order to print a little easter egg, and then the screen lifts up.

#### Loading sequence

You can add steps to the loading sequence with:

`Q1HUD:AddSequenceString(string)`

#### Easter eggs

In order to add a custom random easter egg, you can add strings with:

`Q1HUD:AddEasterEgg(string)`

### Have fun!
