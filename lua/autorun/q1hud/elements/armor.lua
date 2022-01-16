--[[
  ARMOR METER
]]

if CLIENT then

  local SPRITE_HOOK_NAME, AMOUNT_HOOK_NAME = "GetStatusBarArmor", "GetArmor";
  local ARMOR0, ARMOR1, ARMOR2 = "armor0", "armor1", "armor2";
  local ZERO_SPRITE = "0";

  --[[
    Draws the armor panel, with the icon and number
    @param {number} x
    @param {number} y
    @param {number} value
    @void
  ]]
  function Q1HUD:DrawArmorPanel(x, y)
    local scale = Q1HUD:GetHUDScale();
    local _ap = LocalPlayer():Armor();
    local offset = self:GetTextureDimensions(ZERO_SPRITE);
    local ap, crit = self:RunHook(AMOUNT_HOOK_NAME, _ap);
    ap = ap or _ap;
    crit = crit or ap <= 25;
    local armor = self:RunHook(SPRITE_HOOK_NAME, ap);

    -- select sprite
    if (not armor) then
      if (ap > 65) then
        armor = ARMOR2;
      elseif (ap > 35 and ap <= 65) then
        armor = ARMOR1;
      elseif (ap > 0 and ap <= 35) then
        armor = ARMOR0;
      end
    end

    -- get sprite dimensions
    local w, h = self:GetTextureDimensions(armor or ARMOR0);

    -- draw armor
    Q1HUD:DrawTexture(x, y, armor, scale);
    Q1HUD:DrawNumber(ap, x + (offset * scale * 3) + (w * scale), y, crit);
  end

end
