--[[
  Support for Quake SWEPs and Power-ups
]]

if CLIENT then

  -- add content during initialization after all weapons and entities have been added
  hook.Add("Initialize", "q1hud_q1sweps", function()
    local HOOK_ID = "q1sweps";
    local ARMOR2, ARMOR1, ARMOR0, DISC = "armor2", "armor1", "armor0", "disc";
    local FACE_GODINV, FACE_INV, FACE_GOD, FACE_QUAD = "face_god_inv", "face_inv", "face_god1", "face_quad";

    -- check whether the quake 1 sweps and entities exist
    local q1Weapon, q1Armor, q1Powerup = weapons.GetStored("weapon_q1_base"), scripted_ents.GetStored("q1_armor_base"), scripted_ents.GetStored("q1_powerup_base");

    -- add weapon and ammunition icons (as well as make them selectable)
    if (q1Weapon) then
      -- add weapons
      Q1HUD:AddWeaponIcon("weapon_q1_grenadelauncher", "qgrenadel");
      Q1HUD:AddWeaponIcon("weapon_q1_nailgun", "qnailgun");
      Q1HUD:AddWeaponIcon("weapon_q1_rocketlauncher", "qrocketl");
      Q1HUD:AddWeaponIcon("weapon_q1_shotgun", "qshotgun");
      Q1HUD:AddWeaponIcon("weapon_q1_supernailgun", "qsnailgun");
      Q1HUD:AddWeaponIcon("weapon_q1_supershotgun", "qsuper");
      Q1HUD:AddWeaponIcon("weapon_q1_lightninggun", "qlightning");
      Q1HUD:AddWeaponIcon("weapon_q1_lavanailgun", "qnailgun");
      Q1HUD:AddWeaponIcon("weapon_q1_lavasupernailgun", "qsnailgun");
      Q1HUD:AddWeaponIcon("weapon_q1_lasercannon", "qlaser");
      Q1HUD:AddWeaponIcon("weapon_q1_mjolnir", "qhammer");
      Q1HUD:AddWeaponIcon("weapon_q1_multigrenadelauncher", "qgrenadel");
      Q1HUD:AddWeaponIcon("weapon_q1_multirocketlauncher", "qrocketl");
      Q1HUD:AddWeaponIcon("weapon_q1_plasmagun", "qlightning");
      Q1HUD:AddWeaponIcon("weapon_q1_proxlauncher", "qproxlauncher");

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

      -- add ammunition
      Q1HUD:AddAmmoIcon("quake_shells", "shell", "shells");
      Q1HUD:AddAmmoIcon("quake_rockets", "rocket", "rockets");
      Q1HUD:AddAmmoIcon("quake_cells", "cells", "cell");
      Q1HUD:AddAmmoIcon("quake_lavanails", "lava_nail", "lava");
      Q1HUD:AddAmmoIcon("quake_nails", "nail", "nails");
      Q1HUD:AddAmmoIcon("quake_multirockets", "multi_small", "multi");
      Q1HUD:AddAmmoIcon("quake_plasma", "plasma_ball", "plasma");

      Q1HUD:AddSelectableAmmo("quake_shells", "Shells");
      Q1HUD:AddSelectableAmmo("quake_rockets", "Rockets");
      Q1HUD:AddSelectableAmmo("quake_cells", "Cells");
      Q1HUD:AddSelectableAmmo("quake_lavanails", "Lava nails");
      Q1HUD:AddSelectableAmmo("quake_nails", "Nails");
      Q1HUD:AddSelectableAmmo("quake_multirockets", "Multi-rockets");
      Q1HUD:AddSelectableAmmo("quake_plasma", "Plasma");
    end

    -- quick function that checks whether a powerup is active
    local function hasPowerup(powerup) return powerup and powerup > CurTime(); end

    -- add different icons for armour
    if (q1Armor) then
      Q1HUD:AddHook("GetStatusBarArmor", HOOK_ID, function(ap)
        local powerups = LocalPlayer().QuakePowerups;
        if (powerups and hasPowerup(powerups.Pentagram)) then
          return DISC;
        else
          if (ap > 150) then
            return ARMOR2;
          elseif (ap <= 150 and ap > 100) then
            return ARMOR1;
          elseif (ap <= 100 and ap > 0) then
            return ARMOR0;
          end
        end
      end);
    end

    -- add support for powerups
    if (q1Powerup) then
      -- add pentagram armor indicator
      Q1HUD:AddHook("GetArmor", HOOK_ID, function(ap)
        local powerups = LocalPlayer().QuakePowerups;
        if (powerups and hasPowerup(powerups.Pentagram)) then
          return 666, true;
        end
      end);

      -- change faces according to power ups
      Q1HUD:AddHook("GetStatusBarFace", HOOK_ID, function(hp)
        local powerups = LocalPlayer().QuakePowerups;
        if (not powerups) then return; end
        if (hasPowerup(powerups.Invisibility)) then
          if (hasPowerup(powerups.Pentagram)) then
            return FACE_GODINV;
          else
            return FACE_INV;
          end
        elseif (hasPowerup(powerups.Pentagram)) then
          return FACE_GOD;
        elseif (hasPowerup(powerups.QuadDamage)) then
          return FACE_QUAD;
        end
      end);
    end
  end);

end
