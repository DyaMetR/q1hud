--[[
  CORE
]]

if CLIENT then
  -- Hide default HUD
  local hide = {
  	CHudHealth = true,
  	CHudBattery = true,
    CHudDamageIndicator = true,
    CHudAmmo = true,
    CHudSecondaryAmmo = true,
    CHudHistoryResource = true
  }

  hook.Add( "HUDShouldDraw", "q1hud_hide_default_hud", function( name )
    hide["CHudHistoryResource"] = Q1HUD:IsItemPickupEnabled();
    hide["CHudDamageIndicator"] = Q1HUD:IsDamageEffectEnabled();
  	if ( hide[ name ] and Q1HUD:IsEnabled() ) then return false end;
  end )
end

-- Utils
Q1HUD:IncludeFile("util/hooks.lua");
Q1HUD:IncludeFile("util/config.lua");
Q1HUD:IncludeFile("util/skins.lua");
Q1HUD:IncludeFile("util/textures.lua");
Q1HUD:IncludeFile("util/numbers.lua");
Q1HUD:IncludeFile("util/ammo.lua");
Q1HUD:IncludeFile("util/weapons.lua");
Q1HUD:IncludeFile("util/pickup.lua");
Q1HUD:IncludeFile("util/console.lua");
Q1HUD:IncludeFile("util/inventory.lua");

-- Elements
Q1HUD:IncludeFile("elements/draw.lua");
Q1HUD:IncludeFile("elements/health.lua");
Q1HUD:IncludeFile("elements/armor.lua");
Q1HUD:IncludeFile("elements/ammo.lua");
Q1HUD:IncludeFile("elements/inventory.lua");
Q1HUD:IncludeFile("elements/statusbar.lua");
Q1HUD:IncludeFile("elements/log.lua");
Q1HUD:IncludeFile("elements/screenflash.lua");
Q1HUD:IncludeFile("elements/damage.lua");
Q1HUD:IncludeFile("elements/death.lua");
Q1HUD:IncludeFile("elements/console.lua");

-- Data
Q1HUD:IncludeFile("data/ammo.lua");
Q1HUD:IncludeFile("data/weapons.lua");
Q1HUD:IncludeFile("data/items.lua");
Q1HUD:IncludeFile("data/default_skin.lua");
Q1HUD:IncludeFile("data/console.lua");
Q1HUD:IncludeFile("data/inventory.lua");

-- Load add-ons
local files, directories = file.Find("autorun/q1hud/add-ons/*.lua", "LUA");
for _, file in pairs(files) do
  Q1HUD:IncludeFile("add-ons/"..file);
end
