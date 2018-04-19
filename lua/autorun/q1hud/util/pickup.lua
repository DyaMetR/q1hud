--[[
  ITEM PICKUP
]]

if CLIENT then

  -- Parameters
  local AMMO_SUFIX = "_ammo";
  local AMMO_STR = "ammo_pickup";
  local WEAPON_STR = "weapon_pickup";
  local FLASH_COLOR = Color(255, 230, 75);

  -- Item strings
  Q1HUD.ItemStrings = {};

  --[[
    Adds an item string upon picking it up
    @param {string} item
    @param {string} string
    @void
  ]]
  function Q1HUD:AddItemString(item, string)
    self.ItemStrings[item] = string;
  end

  --[[
    Returns an item string
    @param {string} item
    @param {table|null} args
    @return {string} string
  ]]
  function Q1HUD:GetItemString(item, ...)
    if (self.ItemStrings[item] == nil) then return item end;
    return string.format(self.ItemStrings[item], ...);
  end

  --[[
    Triggers the screen flash and adds the string to the log
    @param {string} string
    @void
  ]]
  function Q1HUD:PickupItem(string)
    self:FlashScreen(FLASH_COLOR);
    self:AddLog(string);
  end

  --[[
    Pickup history override
  ]]
  hook.Add("HUDDrawPickupHistory", "q1hud_pickup_override", function()
    if (not Q1HUD:IsEnabled() or not Q1HUD:IsItemPickupEnabled()) then return end;
    if (Q1HUD:IsItemPickupEnabled()) then return true end;
  end);

  --[[
    HUDWeaponPickedUp hook
  ]]
  hook.Add("HUDWeaponPickedUp", "q1hud_pickup_weapon", function(weapon)
    if (not Q1HUD:IsEnabled() or not Q1HUD:IsItemPickupEnabled()) then return end;
    Q1HUD:AddWeaponAnimation(weapon:GetClass());
    Q1HUD:PickupItem(Q1HUD:GetItemString(WEAPON_STR, language.GetPhrase(weapon:GetPrintName())));
  end);

  --[[
    HUDAmmoPickedUp hook
  ]]
  hook.Add("HUDAmmoPickedUp", "q1hud_pickup_ammo", function(item, amount)
    if (not Q1HUD:IsEnabled() or not Q1HUD:IsItemPickupEnabled()) then return end;
    Q1HUD:PickupItem(Q1HUD:GetItemString(AMMO_STR, amount, language.GetPhrase(item..AMMO_SUFIX)));
  end);

  --[[
    HUDItemPickedUp hook
  ]]
  hook.Add("HUDItemPickedUp", "q1hud_pickup_item", function(item)
    if (not Q1HUD:IsEnabled() or not Q1HUD:IsItemPickupEnabled()) then return end;
    Q1HUD:PickupItem(Q1HUD:GetItemString(item) or language.GetPhrase(item));
  end);

end
