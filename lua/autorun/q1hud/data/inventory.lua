--[[
  AMMO AND WEAPON SELECTION FOR INVENTORY
]]

if CLIENT then
  -- Selectable HL2 weapons
  Q1HUD:AddSelectableWeapon("weapon_physgun", "Physics gun");
  Q1HUD:AddSelectableWeapon("weapon_physcannon", "Gravity gun");
  Q1HUD:AddSelectableWeapon("weapon_crowbar", "Crowbar");
  Q1HUD:AddSelectableWeapon("weapon_pistol", "9MM Pistol");
  Q1HUD:AddSelectableWeapon("weapon_357", ".357 Magnum");
  Q1HUD:AddSelectableWeapon("weapon_smg1", "SMG");
  Q1HUD:AddSelectableWeapon("weapon_ar2", "Pulse-Rifle");
  Q1HUD:AddSelectableWeapon("weapon_shotgun", "Shotgun");
  Q1HUD:AddSelectableWeapon("weapon_crossbow", "Crossbow");
  Q1HUD:AddSelectableWeapon("weapon_rpg", "RPG");
  Q1HUD:AddSelectableWeapon("weapon_frag", "Grenade");
  Q1HUD:AddSelectableWeapon("gmod_tool", "Toolgun");
  Q1HUD:AddSelectableWeapon("gmod_camera", "Camera");
  Q1HUD:AddSelectableWeapon("weapon_slam", "S.L.A.M");

  -- Selectable Quake weapons
  Q1HUD:AddSelectableWeapon("weapon_q1_grenadelauncher", "Quake's Grenade launcher");
  Q1HUD:AddSelectableWeapon("weapon_q1_nailgun", "Quake's Nailgun");
  Q1HUD:AddSelectableWeapon("weapon_q1_rocketlauncher", "Quake's Rocket launcher");
  Q1HUD:AddSelectableWeapon("weapon_q1_shotgun", "Quake's Shotgun");
  Q1HUD:AddSelectableWeapon("weapon_q1_supernailgun", "Quake's Super Nailgun");
  Q1HUD:AddSelectableWeapon("weapon_q1_supershotgun", "Quake's Super Shotgun");
  Q1HUD:AddSelectableWeapon("weapon_q1_lightninggun", "Quake's Lightning gun");
  Q1HUD:AddSelectableWeapon("weapon_q1_lavanailgun", "Quake's Lava nail gun");
  Q1HUD:AddSelectableWeapon("weapon_q1_lavasupernailgun", "Quake's Lava super nail gun");
  Q1HUD:AddSelectableWeapon("weapon_q1_mjolnir", "Quake's Mjolnir");
  Q1HUD:AddSelectableWeapon("weapon_q1_plasmagun", "Quake's Plasma gun");
  Q1HUD:AddSelectableWeapon("weapon_q1_lasercannon", "Quake's Laser cannon");
  Q1HUD:AddSelectableWeapon("weapon_q1_proxlauncher", "Quake's Proximity launcher");
  Q1HUD:AddSelectableWeapon("weapon_q1_multirocketlauncher", "Quake's Multi-rocket launcher");
  Q1HUD:AddSelectableWeapon("weapon_q1_multigrenadelauncher", "Quake's Multi-grenade launcher");

  -- Selectable HL2 ammo types
  Q1HUD:AddSelectableAmmo("Pistol", "Pistol ammo");
  Q1HUD:AddSelectableAmmo("357", ".357 ammo");
  Q1HUD:AddSelectableAmmo("SMG1", "SMG ammo");
  Q1HUD:AddSelectableAmmo("AR2", "AR2 ammo");
  Q1HUD:AddSelectableAmmo("Buckshot", "Shotgun ammo");
  Q1HUD:AddSelectableAmmo("XBowBolt", "Crossbow bolts");
  Q1HUD:AddSelectableAmmo("Grenade", "Grenades");
  Q1HUD:AddSelectableAmmo("RPG_Round", "RPG rounds");
  Q1HUD:AddSelectableAmmo("slam", "S.L.A.M's");

  -- Selectable Quake ammo types
  Q1HUD:AddSelectableAmmo("quake_shells", "Shells");
  Q1HUD:AddSelectableAmmo("quake_rockets", "Rockets");
  Q1HUD:AddSelectableAmmo("quake_cells", "Cells");
  Q1HUD:AddSelectableAmmo("quake_lavanails", "Lava nails");
  Q1HUD:AddSelectableAmmo("quake_nails", "Nails");
  Q1HUD:AddSelectableAmmo("quake_multirockets", "Multi-rockets");
  Q1HUD:AddSelectableAmmo("quake_plasma", "Plasma");

end
