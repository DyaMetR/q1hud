--[[
  ARMOR METER
]]

if CLIENT then

  --[[
    Draws the armor panel, with the icon and number
    @param {number} x
    @param {number} y
    @param {number} value
    @void
  ]]
  function Q1HUD:DrawArmorPanel(x, y)
    local scale = Q1HUD:GetHUDScale();
    local ap = LocalPlayer():Armor();
    local armor = "armor2";
    local w, h = self:GetTextureDimensions(armor);
    local offset = self:GetTextureDimensions("0");

    if (ap > 35 and ap <= 65) then
      armor = "armor1";
    elseif (ap > 0 and ap <= 35) then
      armor = "armor0";
    elseif (ap <= 0) then
      armor = nil;
    end

    Q1HUD:DrawTexture(x, y, armor, scale);
    Q1HUD:DrawNumber(ap, x + (offset * scale * 3) + (w * scale), y, ap <= 25);
  end

end
