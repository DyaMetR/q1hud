--[[
  DEFAULT SKIN
  You can use this as a template for all of your custom skins.

  You can add required files with the following structure:
  {path = texture_path, u = file_width, v = file_height}

  You can add textures to a data table first creating the table and then using:
  Q1HUD:AddTexture(data_table, texture_name, file_data, x, y, w, h)

  All non-specified textures with lead the script to load up the default
  skin for that texture.

  And at last but not least you can add the skin by doing:
  Q1HUD:AddSkin(skin_name, texture_data)

]] -- DO NOT REMOVE THIS SKIN NOR IT'S COMPONENTS! --

if CLIENT then

  local skin = "Default"; -- Skin name

  -- Files required
  local numbers = {path = surface.GetTextureID("q1hud/default/numbers"), u = 512, v = 64};
  local backtile = {path = surface.GetTextureID("q1hud/default/backtile"), u = 64, v = 64};
  local statusbar = {path = surface.GetTextureID("q1hud/default/statusbar"), u = 512, v = 64};
  local faces = {path = surface.GetTextureID("q1hud/default/faces"), u = 512, v = 32};
  local armors = {path = surface.GetTextureID("q1hud/default/armors"), u = 128, v = 32};
  local runes = {path = surface.GetTextureID("q1hud/default/runes"), u = 32, v = 16};
  local inventory = {path = surface.GetTextureID("q1hud/default/inventory"), u = 512, v = 32};
  local small_numbers = {path = surface.GetTextureID("q1hud/default/small_numbers"), u = 128, v = 32};
  local characters = {path = surface.GetTextureID("q1hud/default/characters"), u = 128, v = 64};
  local weapon_highlight = {path = surface.GetTextureID("q1hud/default/weapon_highlight"), u = 128, v = 16};
  local console = {path = Material("q1hud/default/console.png"), u = 640, v = 400};
  local smallAmmo = {path = surface.GetTextureID("q1hud/default/ammo_small"), u = 128, v = 16};
  local ammo = {path = surface.GetTextureID("q1hud/default/ammo"), u = 256, v = 64};
  local weapons = {path = surface.GetTextureID("q1hud/default/weapons"), u = 256, v = 64};

  -- Texture data
  local data = {}; -- Data table

  -- Console panel
  Q1HUD:AddTexture(data, "console", console, 0, 0, 320, 200);

  -- Numbers
  Q1HUD:AddTexture(data, "0", numbers, 0, 0, 24, 24);
  Q1HUD:AddTexture(data, "1", numbers, 24, 0, 24, 24);
  Q1HUD:AddTexture(data, "2", numbers, 48, 0, 24, 24);
  Q1HUD:AddTexture(data, "3", numbers, 72, 0, 24, 24);
  Q1HUD:AddTexture(data, "4", numbers, 96, 0, 24, 24);
  Q1HUD:AddTexture(data, "5", numbers, 120, 0, 24, 24);
  Q1HUD:AddTexture(data, "6", numbers, 144, 0, 24, 24);
  Q1HUD:AddTexture(data, "7", numbers, 168, 0, 24, 24);
  Q1HUD:AddTexture(data, "8", numbers, 192, 0, 24, 24);
  Q1HUD:AddTexture(data, "9", numbers, 216, 0, 24, 24);

  Q1HUD:AddTexture(data, "0A", numbers, 0, 24, 24, 24);
  Q1HUD:AddTexture(data, "1A", numbers, 24, 24, 24, 24);
  Q1HUD:AddTexture(data, "2A", numbers, 48, 24, 24, 24);
  Q1HUD:AddTexture(data, "3A", numbers, 72, 24, 24, 24);
  Q1HUD:AddTexture(data, "4A", numbers, 96, 24, 24, 24);
  Q1HUD:AddTexture(data, "5A", numbers, 120, 24, 24, 24);
  Q1HUD:AddTexture(data, "6A", numbers, 144, 24, 24, 24);
  Q1HUD:AddTexture(data, "7A", numbers, 168, 24, 24, 24);
  Q1HUD:AddTexture(data, "8A", numbers, 192, 24, 24, 24);
  Q1HUD:AddTexture(data, "9A", numbers, 216, 24, 24, 24);

  -- Status bar
  Q1HUD:AddTexture(data, "backtile", backtile, 0, 0, 64, 64);
  Q1HUD:AddTexture(data, "statusbar", statusbar, 0, 0, 320, 24);
  Q1HUD:AddTexture(data, "scoreboard", statusbar, 0, 24, 320, 24);

  -- Faces
  Q1HUD:AddTexture(data, "face_god_inv", faces, 0, 0, 24, 24);
  Q1HUD:AddTexture(data, "face_inv", faces, 24, 0, 24, 24);
  Q1HUD:AddTexture(data, "face_god0", faces, 48, 0, 24, 24);
  Q1HUD:AddTexture(data, "face_god1", faces, 72, 0, 24, 24);
  Q1HUD:AddTexture(data, "face_quad", faces, 216, 0, 24, 24);
  Q1HUD:AddTexture(data, "face0_d", faces, 96, 0, 24, 24);
  Q1HUD:AddTexture(data, "face1_d", faces, 120, 0, 24, 24);
  Q1HUD:AddTexture(data, "face2_d", faces, 144, 0, 24, 24);
  Q1HUD:AddTexture(data, "face3_d", faces, 168, 0, 24, 24);
  Q1HUD:AddTexture(data, "face4_d", faces, 192, 0, 24, 24);
  Q1HUD:AddTexture(data, "face0", faces, 240, 0, 24, 24);
  Q1HUD:AddTexture(data, "face1", faces, 264, 0, 24, 24);
  Q1HUD:AddTexture(data, "face2", faces, 288, 0, 24, 24);
  Q1HUD:AddTexture(data, "face3", faces, 312, 0, 24, 24);
  Q1HUD:AddTexture(data, "face4", faces, 336, 0, 24, 24);

  -- Armours
  Q1HUD:AddTexture(data, "armor0", armors, 0, 0, 24, 24);
  Q1HUD:AddTexture(data, "armor1", armors, 24, 0, 24, 24);
  Q1HUD:AddTexture(data, "armor2", armors, 48, 0, 24, 24);
  Q1HUD:AddTexture(data, "disc", armors, 72, 0, 24, 24);

  -- Inventory
  Q1HUD:AddTexture(data, "inventory", inventory, 0, 0, 320, 24);

  -- Runes
  Q1HUD:AddTexture(data, "rune0", runes, 0, 0, 8, 16);
  Q1HUD:AddTexture(data, "rune1", runes, 8, 0, 8, 16);
  Q1HUD:AddTexture(data, "rune2", runes, 16, 0, 8, 16);
  Q1HUD:AddTexture(data, "rune3", runes, 24, 0, 8, 16);

  -- Small numbers
  Q1HUD:AddTexture(data, "0s", small_numbers, 0, 0, 8, 6);
  Q1HUD:AddTexture(data, "1s", small_numbers, 8, 0, 7, 6);
  Q1HUD:AddTexture(data, "2s", small_numbers, 16, 0, 7, 6);
  Q1HUD:AddTexture(data, "3s", small_numbers, 24, 0, 7, 6);
  Q1HUD:AddTexture(data, "4s", small_numbers, 32, 0, 8, 6);
  Q1HUD:AddTexture(data, "5s", small_numbers, 40, 0, 8, 6);
  Q1HUD:AddTexture(data, "6s", small_numbers, 48, 0, 8, 6);
  Q1HUD:AddTexture(data, "7s", small_numbers, 56, 0, 8, 6);
  Q1HUD:AddTexture(data, "8s", small_numbers, 64, 0, 8, 6);
  Q1HUD:AddTexture(data, "9s", small_numbers, 72, 0, 8, 6);

  -- Small numbers for version number
  Q1HUD:AddTexture(data, "0sv", small_numbers, 0, 13, 8, 7);
  Q1HUD:AddTexture(data, "1sv", small_numbers, 8, 13, 7, 7);
  Q1HUD:AddTexture(data, "2sv", small_numbers, 16, 13, 8, 7);
  Q1HUD:AddTexture(data, "3sv", small_numbers, 24, 13, 8, 7);
  Q1HUD:AddTexture(data, "4sv", small_numbers, 32, 13, 8, 7);
  Q1HUD:AddTexture(data, "5sv", small_numbers, 40, 13, 8, 7);
  Q1HUD:AddTexture(data, "6sv", small_numbers, 48, 13, 8, 7);
  Q1HUD:AddTexture(data, "7sv", small_numbers, 56, 13, 8, 7);
  Q1HUD:AddTexture(data, "8sv", small_numbers, 64, 13, 8, 7);
  Q1HUD:AddTexture(data, "9sv", small_numbers, 72, 13, 8, 7);
  Q1HUD:AddTexture(data, ".sv", small_numbers, 80, 13, 3, 7);
  Q1HUD:AddTexture(data, " sv", small_numbers, 83, 13, 4, 7);

  -- Weapon id numbers
  Q1HUD:AddTexture(data, "0i", small_numbers, 0, 7, 3, 5);
  Q1HUD:AddTexture(data, "1i", small_numbers, 4, 7, 3, 5);
  Q1HUD:AddTexture(data, "2i", small_numbers, 8, 7, 3, 5);
  Q1HUD:AddTexture(data, "3i", small_numbers, 12, 7, 3, 5);
  Q1HUD:AddTexture(data, "4i", small_numbers, 16, 7, 3, 5);
  Q1HUD:AddTexture(data, "5i", small_numbers, 20, 7, 3, 5);
  Q1HUD:AddTexture(data, "6i", small_numbers, 24, 7, 3, 5);
  Q1HUD:AddTexture(data, "7i", small_numbers, 28, 7, 3, 5);
  Q1HUD:AddTexture(data, "8i", small_numbers, 32, 7, 3, 5);
  Q1HUD:AddTexture(data, "9i", small_numbers, 36, 7, 3, 5);

  Q1HUD:AddTexture(data, "0ia", small_numbers, 40, 7, 3, 5);
  Q1HUD:AddTexture(data, "1ia", small_numbers, 44, 7, 3, 5);
  Q1HUD:AddTexture(data, "2ia", small_numbers, 48, 7, 3, 5);
  Q1HUD:AddTexture(data, "3ia", small_numbers, 52, 7, 3, 5);
  Q1HUD:AddTexture(data, "4ia", small_numbers, 56, 7, 3, 5);
  Q1HUD:AddTexture(data, "5ia", small_numbers, 60, 7, 3, 5);
  Q1HUD:AddTexture(data, "6ia", small_numbers, 64, 7, 3, 5);
  Q1HUD:AddTexture(data, "7ia", small_numbers, 68, 7, 3, 5);
  Q1HUD:AddTexture(data, "8ia", small_numbers, 72, 7, 3, 5);
  Q1HUD:AddTexture(data, "9ia", small_numbers, 76, 7, 3, 5);

  -- Weapon highlight effect
  Q1HUD:AddTexture(data, "highlight0", weapon_highlight, 0, 0, 24, 14);
  Q1HUD:AddTexture(data, "highlight1", weapon_highlight, 24, 0, 24, 14);
  Q1HUD:AddTexture(data, "highlight2", weapon_highlight, 48, 0, 24, 14);
  Q1HUD:AddTexture(data, "highlight3", weapon_highlight, 72, 0, 24, 14);

  -- Characters -- bear with me D:
  Q1HUD:AddTexture(data, "A", characters, 0, 0, 8, 8);
  Q1HUD:AddTexture(data, "B", characters, 8, 0, 8, 8);
  Q1HUD:AddTexture(data, "C", characters, 16, 0, 8, 8);
  Q1HUD:AddTexture(data, "D", characters, 24, 0, 8, 8);
  Q1HUD:AddTexture(data, "E", characters, 32, 0, 8, 8);
  Q1HUD:AddTexture(data, "F", characters, 40, 0, 7, 8);
  Q1HUD:AddTexture(data, "G", characters, 47, 0, 6, 8);
  Q1HUD:AddTexture(data, "H", characters, 55, 0, 8, 8);
  Q1HUD:AddTexture(data, "I", characters, 63, 0, 8, 8);
  Q1HUD:AddTexture(data, "J", characters, 71, 0, 8, 8);
  Q1HUD:AddTexture(data, "K", characters, 79, 0, 8, 8);
  Q1HUD:AddTexture(data, "L", characters, 87, 0, 8, 8);
  Q1HUD:AddTexture(data, "M", characters, 95, 0, 8, 8);
  Q1HUD:AddTexture(data, "N", characters, 103, 0, 8, 8);
  Q1HUD:AddTexture(data, "O", characters, 0, 8, 8, 8);
  Q1HUD:AddTexture(data, "P", characters, 8, 8, 7, 8);
  Q1HUD:AddTexture(data, "Q", characters, 16, 8, 8, 8);
  Q1HUD:AddTexture(data, "R", characters, 24, 8, 8, 8);
  Q1HUD:AddTexture(data, "S", characters, 32, 8, 8, 8);
  Q1HUD:AddTexture(data, "T", characters, 40, 8, 8, 8);
  Q1HUD:AddTexture(data, "U", characters, 48, 8, 7, 8);
  Q1HUD:AddTexture(data, "V", characters, 56, 8, 7, 8);
  Q1HUD:AddTexture(data, "W", characters, 64, 8, 7, 8);
  Q1HUD:AddTexture(data, "X", characters, 72, 8, 8, 8);
  Q1HUD:AddTexture(data, "Y", characters, 80, 8, 8, 8);
  Q1HUD:AddTexture(data, "Z", characters, 88, 8, 8, 8);

  Q1HUD:AddTexture(data, "a", characters, 0, 16, 8, 8);
  Q1HUD:AddTexture(data, "b", characters, 8, 16, 8, 8);
  Q1HUD:AddTexture(data, "c", characters, 16, 16, 8, 8);
  Q1HUD:AddTexture(data, "d", characters, 24, 16, 8, 8);
  Q1HUD:AddTexture(data, "e", characters, 32, 16, 8, 8);
  Q1HUD:AddTexture(data, "f", characters, 40, 16, 6, 8);
  Q1HUD:AddTexture(data, "g", characters, 47, 16, 8, 8);
  Q1HUD:AddTexture(data, "h", characters, 54, 16, 8, 8);
  Q1HUD:AddTexture(data, "i", characters, 64, 16, 8, 8);
  Q1HUD:AddTexture(data, "j", characters, 72, 16, 8, 8);
  Q1HUD:AddTexture(data, "k", characters, 80, 16, 8, 8);
  Q1HUD:AddTexture(data, "l", characters, 88, 16, 6, 8);
  Q1HUD:AddTexture(data, "m", characters, 96, 16, 6, 8);
  Q1HUD:AddTexture(data, "n", characters, 104, 16, 8, 8);
  Q1HUD:AddTexture(data, "o", characters, 0, 24, 8, 8);
  Q1HUD:AddTexture(data, "p", characters, 8, 24, 7, 8);
  Q1HUD:AddTexture(data, "q", characters, 16, 24, 8, 8);
  Q1HUD:AddTexture(data, "r", characters, 24, 24, 8, 8);
  Q1HUD:AddTexture(data, "s", characters, 32, 24, 8, 8);
  Q1HUD:AddTexture(data, "t", characters, 40, 24, 8, 8);
  Q1HUD:AddTexture(data, "u", characters, 48, 24, 8, 8);
  Q1HUD:AddTexture(data, "v", characters, 56, 24, 7, 8);
  Q1HUD:AddTexture(data, "w", characters, 64, 24, 7, 8);
  Q1HUD:AddTexture(data, "x", characters, 72, 24, 8, 8);
  Q1HUD:AddTexture(data, "y", characters, 80, 24, 8, 8);
  Q1HUD:AddTexture(data, "z", characters, 88, 24, 8, 8);

  Q1HUD:AddTexture(data, "0c", characters, 0, 32, 8, 8);
  Q1HUD:AddTexture(data, "1c", characters, 8, 32, 8, 8);
  Q1HUD:AddTexture(data, "2c", characters, 16, 32, 8, 8);
  Q1HUD:AddTexture(data, "3c", characters, 24, 32, 8, 8);
  Q1HUD:AddTexture(data, "4c", characters, 32, 32, 8, 8);
  Q1HUD:AddTexture(data, "5c", characters, 40, 32, 8, 8);
  Q1HUD:AddTexture(data, "6c", characters, 48, 32, 8, 8);
  Q1HUD:AddTexture(data, "7c", characters, 56, 32, 8, 8);
  Q1HUD:AddTexture(data, "8c", characters, 64, 32, 8, 8);
  Q1HUD:AddTexture(data, "9c", characters, 72, 32, 8, 8);

  Q1HUD:AddTexture(data, "!", characters, 80, 32, 8, 8);
  Q1HUD:AddTexture(data, "@", characters, 88, 32, 7, 8);
  Q1HUD:AddTexture(data, "#", characters, 96, 32, 8, 8);
  Q1HUD:AddTexture(data, "$", characters, 104, 32, 8, 8);
  Q1HUD:AddTexture(data, "%", characters, 0, 40, 8, 8);
  Q1HUD:AddTexture(data, "^", characters, 8, 40, 8, 8);
  Q1HUD:AddTexture(data, "&", characters, 16, 40, 8, 8);
  Q1HUD:AddTexture(data, "*", characters, 24, 40, 8, 8);
  Q1HUD:AddTexture(data, "(", characters, 32, 40, 8, 8);
  Q1HUD:AddTexture(data, ")", characters, 40, 40, 8, 8);
  Q1HUD:AddTexture(data, "_", characters, 48, 40, 8, 8);
  Q1HUD:AddTexture(data, "+", characters, 56, 40, 8, 8);
  Q1HUD:AddTexture(data, "{", characters, 64, 40, 8, 8);
  Q1HUD:AddTexture(data, "}", characters, 72, 40, 8, 8);
  Q1HUD:AddTexture(data, "\"", characters, 80, 40, 8, 8);
  Q1HUD:AddTexture(data, "|", characters, 88, 40, 8, 8);
  Q1HUD:AddTexture(data, "?", characters, 96, 40, 8, 8);
  Q1HUD:AddTexture(data, ">", characters, 104, 40, 8, 8);
  Q1HUD:AddTexture(data, "<", characters, 0, 48, 8, 8);
  Q1HUD:AddTexture(data, "~", characters, 8, 48, 8, 8);
  Q1HUD:AddTexture(data, "'", characters, 17, 48, 8, 8);
  Q1HUD:AddTexture(data, ":", characters, 24, 48, 8, 8);
  Q1HUD:AddTexture(data, "-", characters, 32, 48, 8, 8);
  Q1HUD:AddTexture(data, ".", characters, 40, 48, 8, 8);
  Q1HUD:AddTexture(data, " ", characters, 48, 48, 8, 8);

  -- Small ammunition icons
  Q1HUD:AddTexture(data, "shell", smallAmmo, 0, 0, 9, 8);
  Q1HUD:AddTexture(data, "nail", smallAmmo, 9, 0, 9, 8);
  Q1HUD:AddTexture(data, "rocket", smallAmmo, 18, 0, 9, 8);
  Q1HUD:AddTexture(data, "cells", smallAmmo, 27, 0, 9, 8);
  Q1HUD:AddTexture(data, "9mm", smallAmmo, 36, 0, 9, 8);
  Q1HUD:AddTexture(data, "46mm", smallAmmo, 45, 0, 9, 8);
  Q1HUD:AddTexture(data, "bolt", smallAmmo, 54, 0, 9, 8);
  Q1HUD:AddTexture(data, "grenade", smallAmmo, 63, 0, 9, 8);
  Q1HUD:AddTexture(data, "357", smallAmmo, 72, 0, 9, 8);
  Q1HUD:AddTexture(data, "ar2_round", smallAmmo, 81, 0, 9, 8);
  Q1HUD:AddTexture(data, "slam", smallAmmo, 90, 0, 9, 8);
  Q1HUD:AddTexture(data, "ball", smallAmmo, 99, 0, 9, 8);
  Q1HUD:AddTexture(data, "40mm", smallAmmo, 108, 0, 9, 8);
  Q1HUD:AddTexture(data, "lava_nail", smallAmmo, 0, 8, 9, 8);
  Q1HUD:AddTexture(data, "multi_small", smallAmmo, 9, 8, 9, 8);
  Q1HUD:AddTexture(data, "plasma_ball", smallAmmo, 18, 8, 9, 8);

  -- Ammunition icons
  Q1HUD:AddTexture(data, "nails", ammo, 0, 0, 24, 24);
  Q1HUD:AddTexture(data, "rockets", ammo, 24, 0, 24, 24);
  Q1HUD:AddTexture(data, "shells", ammo, 48, 0, 24, 24);
  Q1HUD:AddTexture(data, "cell", ammo, 48, 21, 24, 24);
  Q1HUD:AddTexture(data, "pistol_ammo", ammo, 72, 0, 24, 24);
  Q1HUD:AddTexture(data, "smg_ammo", ammo, 96, 0, 24, 24);
  Q1HUD:AddTexture(data, "357_ammo", ammo, 120, 0, 24, 24);
  Q1HUD:AddTexture(data, "bolt_ammo", ammo, 144, 0, 24, 24);
  Q1HUD:AddTexture(data, "ar2_ammo", ammo, 168, 0, 24, 24);
  Q1HUD:AddTexture(data, "grenade_ammo", ammo, 192, 0, 24, 24);
  Q1HUD:AddTexture(data, "ball_ammo", ammo, 216, 0, 24, 24);
  Q1HUD:AddTexture(data, "smg_gren_ammo", ammo, 0, 21, 24, 24);
  Q1HUD:AddTexture(data, "slam_ammo", ammo, 24, 21, 24, 24);
  Q1HUD:AddTexture(data, "lava", ammo, 72, 21, 24, 24);
  Q1HUD:AddTexture(data, "multi", ammo, 96, 21, 24, 24);
  Q1HUD:AddTexture(data, "plasma", ammo, 120, 21, 24, 24);

  -- Weapon icons
  Q1HUD:AddTexture(data, "crowbar", weapons, 0, 0, 24, 16);
  Q1HUD:AddTexture(data, "pistol", weapons, 24, 0, 24, 16);
  Q1HUD:AddTexture(data, "python", weapons, 48, 0, 24, 16);
  Q1HUD:AddTexture(data, "smg1", weapons, 72, 0, 24, 16);
  Q1HUD:AddTexture(data, "ar2", weapons, 96, 0, 24, 16);
  Q1HUD:AddTexture(data, "shotgun", weapons, 120, 0, 24, 16);
  Q1HUD:AddTexture(data, "crossbow", weapons, 144, 0, 24, 16);
  Q1HUD:AddTexture(data, "weapon_frag", weapons, 168, 0, 24, 16);
  Q1HUD:AddTexture(data, "weapon_slam", weapons, 192, 0, 24, 16);
  Q1HUD:AddTexture(data, "rpg", weapons, 215, 0, 24, 16);
  Q1HUD:AddTexture(data, "toolgun", weapons, 0, 16, 24, 16);
  Q1HUD:AddTexture(data, "camera", weapons, 24, 16, 24, 16);
  Q1HUD:AddTexture(data, "physcannon", weapons, 48, 16, 24, 16);
  Q1HUD:AddTexture(data, "physgun", weapons, 72, 16, 24, 16);
  Q1HUD:AddTexture(data, "qnailgun", weapons, 96, 16, 24, 16);
  Q1HUD:AddTexture(data, "qgrenadel", weapons, 120, 16, 24, 16);
  Q1HUD:AddTexture(data, "qshotgun", weapons, 144, 16, 24, 16);
  Q1HUD:AddTexture(data, "qsnailgun", weapons, 168, 16, 24, 16);
  Q1HUD:AddTexture(data, "qrocketl", weapons, 192, 16, 24, 16);
  Q1HUD:AddTexture(data, "qsuper", weapons, 215, 16, 24, 16);
  Q1HUD:AddTexture(data, "qlightning", weapons, 0, 32, 24, 16);
  Q1HUD:AddTexture(data, "qproxlauncher", weapons, 47, 34, 23, 14);
  Q1HUD:AddTexture(data, "qlaser", weapons, 79, 34, 23, 14);
  Q1HUD:AddTexture(data, "qhammer", weapons, 110, 34, 23, 14);

  Q1HUD:AddSkin(skin, data); -- Add skin

end
