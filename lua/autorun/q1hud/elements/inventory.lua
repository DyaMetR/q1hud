--[[
  WEAPON AND AMMUNITION INVENTORY
]]

if CLIENT then

  -- Parameters
  local PING_XOFFSET, PING_YOFFSET = 288, 9; -- Ping meter offset
  local WEAPON_XOFFSET, WEAPON_YOFFSET = 0, 8; -- Weapon icon offset
  local WEAPON_WIDTH, WEAPON_HEIGHT = 24, 12; -- Weapon icon dimensions
  local AMMO_XOFFSET, AMMO_YOFFSET, AMMO_SEPARATION = 42, 1, 42;

  --[[
    Draws the inventory panel
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawInventory(x, y)
    local scale = Q1HUD:GetHUDScale();
    local w, h = Q1HUD:GetTextureDimensions("inventory");

    Q1HUD:DrawTexture(x, y, "inventory", scale, nil, nil, nil, Q1HUD:GetStatusBarAlpha());
    Q1HUD:DrawReserveAmmoLine(x, y);
    Q1HUD:DrawWeaponsLine(x, y);
    Q1HUD:DrawPingMeter(x + (PING_XOFFSET * scale), y + (PING_YOFFSET * scale));
  end

  --[[
    Draws a line of numbers with each ammo type relative to the inventory pos
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawReserveAmmoLine(x, y)
    local scale = Q1HUD:GetHUDScale();
    for k, ammo in pairs(Q1HUD:GetInventoryAmmoTypes()) do
      Q1HUD:DrawSmallNumber(LocalPlayer():GetAmmoCount(game.GetAmmoID(ammo)), x + (AMMO_XOFFSET * scale) + (AMMO_SEPARATION * (k - 1) * scale), y + (AMMO_YOFFSET * scale));
      Q1HUD:DrawSmallAmmoIcon(x + (AMMO_XOFFSET * scale) + (AMMO_SEPARATION * (k - 1) * scale), y + (AMMO_YOFFSET * scale), ammo);
    end
  end

  --[[
    Draws a line of weapon icons relative to the inventory pos
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawWeaponsLine(x, y)
    local scale = Q1HUD:GetHUDScale();
    local activeWeapon = LocalPlayer():GetActiveWeapon();
    local class = false;
    if (activeWeapon ~= NULL) then
      class = activeWeapon:GetClass();
    end

    for k, weapon in pairs(Q1HUD:GetInventoryWeapons()) do
      if (LocalPlayer():HasWeapon(weapon)) then
        Q1HUD:DrawWeaponIcon(x + (WEAPON_XOFFSET + (WEAPON_WIDTH * (k-1))) * scale, y + (WEAPON_YOFFSET * scale), weapon, k, class == weapon);
      end
    end
  end

  --[[
    Draws the runes that represent ping
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawPingMeter(x, y)
    local scale = Q1HUD:GetHUDScale();
    local w, h = Q1HUD:GetTextureDimensions("rune0");
    local ping = LocalPlayer():Ping();
    local rune = -1;

    if (ping > 50 and ping < 100) then
      rune = 0;
    elseif (ping >= 100 and ping < 250) then
      rune = 1;
    elseif (ping >= 250 and ping < 400) then
      rune = 2;
    elseif (ping >= 400) then
      rune = 3;
    else
      rune = -1;
    end

    if (rune >= 0) then
      for i=0, rune do
        Q1HUD:DrawTexture(x + (w * scale * i), y, "rune"..i, scale);
      end
    end
  end

end
