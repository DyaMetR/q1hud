--[[
  AMMUNITION ICONS LIST
]]

if CLIENT then
  -- Half-Life 2 ammo
  Q1HUD:AddAmmoIcon("AR2", "ar2_round", "ar2_ammo");
  Q1HUD:AddAmmoIcon("AR2AltFire", "ball", "ball_ammo");
  Q1HUD:AddAmmoIcon("Pistol", "9mm", "pistol_ammo");
  Q1HUD:AddAmmoIcon("SMG1", "46mm", "smg_ammo");
  Q1HUD:AddAmmoIcon("357", "357", "357_ammo");
  Q1HUD:AddAmmoIcon("XBowBolt", "bolt", "bolt_ammo");
  Q1HUD:AddAmmoIcon("Buckshot", "shell", "shells");
  Q1HUD:AddAmmoIcon("RPG_Round", "rocket", "rockets");
  Q1HUD:AddAmmoIcon("SMG1_Grenade", "40mm", "smg_gren_ammo");
  Q1HUD:AddAmmoIcon("slam", "slam", "slam_ammo");
  Q1HUD:AddAmmoIcon("Grenade", "grenade", "grenade_ammo");

  -- Quake 1 SWEPs ammo
  Q1HUD:AddAmmoIcon("quake_shells", "shell", "shells");
  Q1HUD:AddAmmoIcon("quake_rockets", "rocket", "rockets");
  Q1HUD:AddAmmoIcon("quake_cells", "cells", "cell");
  Q1HUD:AddAmmoIcon("quake_lavanails", "lava_nail", "lava");
  Q1HUD:AddAmmoIcon("quake_nails", "nail", "nails");
  Q1HUD:AddAmmoIcon("quake_multirockets", "multi_small", "multi");
  Q1HUD:AddAmmoIcon("quake_plasma", "plasma_ball", "plasma");
end
