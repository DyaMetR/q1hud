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

end
