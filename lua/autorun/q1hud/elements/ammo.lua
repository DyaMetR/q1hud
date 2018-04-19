--[[
  AMMUNITION
]]

if CLIENT then

  -- Parameters
  local XOFFSET, YOFFSET = 24, 24;
  local SMALL_NUMBER_HEIGHT = 10;
  local XOFFSET_ALT, YOFFSET_ALT = 2, 2;

  --[[
    Draws the ammo panel for a weapon, with the given icon for the ammo type
    @param {number} x
    @param {number} y
    @param {number} weapon
    @void
  ]]
  function Q1HUD:DrawAmmoPanel(x, y, weapon)
    local scale = Q1HUD:GetHUDScale();
    local style = Q1HUD:GetAmmoStyle();
    local inventory = Q1HUD:IsInventoryEnabled();
    local offset = self:GetTextureDimensions("0");

    -- If the weapon is invalid or has no ammo, scrap it
    if (weapon == NULL or weapon:GetPrimaryAmmoType() <= -1 and weapon:GetSecondaryAmmoType() <= -1) then
      Q1HUD:DrawNumber(0, x + (offset * scale * 3) + (XOFFSET * scale), y, true);
      return
    end

    local primary = weapon:GetPrimaryAmmoType();
    local secondary = weapon:GetSecondaryAmmoType();

    local clip = math.Clamp(weapon:Clip1(), 0, weapon:Clip1()) or 0;
    local ammo = LocalPlayer():GetAmmoCount(primary) or 0;
    local alt = LocalPlayer():GetAmmoCount(secondary) or 0;

    local ammoToShow = primary;

    local counter1 = ammo + clip;
    local counter2 = -1;
    local counter3 = -1;

    if (secondary >= 0) then
      counter3 = alt;
    end

    if (primary < 0) then
      counter1 = alt or 0;
      counter3 = -1;
      ammoToShow = secondary;
      style = 0;
    end

    if (weapon:Clip1() <= -1) then
      counter1 = ammo;
    else
      if (style == 1) then
        counter1 = clip;
        counter2 = ammo;
      elseif (style == 2) then
        counter1 = ammo;
        counter2 = clip;
      elseif (style == 3) then
        counter1 = ammo + clip
        counter2 = clip;
      elseif (style == 4) then
        counter1 = clip;
        counter2 = ammo + clip;
      end
    end

    Q1HUD:DrawBigAmmoIcon(x, y, game.GetAmmoName(ammoToShow));
    Q1HUD:DrawNumber(counter1, x + (offset * scale * 3) + (XOFFSET * scale), y, counter1 <= 10);
    if (counter2 >= 0 and (style > 1 or not table.HasValue(Q1HUD:GetInventoryAmmoTypes(), primary) or not inventory)) then
      Q1HUD:DrawSmallNumber(counter2, x + (XOFFSET * scale), y + ((YOFFSET - SMALL_NUMBER_HEIGHT) * scale));
    end
    if (counter3 > 0) then
      Q1HUD:DrawText(counter3, x + (XOFFSET_ALT * scale), y + (YOFFSET_ALT * scale));
    end
  end

end
