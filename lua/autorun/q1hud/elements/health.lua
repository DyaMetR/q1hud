--[[
  HEALTH METER
]]

if CLIENT then

  -- Parameters
  local SUFIX = "_d";
  local DAMAGE_TIME = 0.25; -- The time the damage face is shown

  -- Variables
  local lastHP = 100; -- Last HP before attack
  local anim = 0; -- Animation timer

  --[[
    Runs the animation for the damaged face
    @void
  ]]
  local function Animation()
    local hp = LocalPlayer():Health();
    if (lastHP ~= hp) then
      if (lastHP > hp) then
        anim = CurTime() + DAMAGE_TIME;
      end
      lastHP = hp;
    end
  end

  --[[
    Draws the status bar face
    @param {number} x
    @param {number} y
    @param {string} face
    @void
  ]]
  function Q1HUD:DrawFace(x, y, face)
    local scale = Q1HUD:GetHUDScale();
    local texture = face;
    if (self:GetTexture(face..SUFIX) ~= nil) then
      Animation();
      if (anim > CurTime()) then
        face = face..SUFIX;
      end
    end
    self:DrawTexture(x, y, face, scale);
  end

  --[[
    Draws the health panel, with animated face and number
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawHealthPanel(x, y)
    local scale = Q1HUD:GetHUDScale();
    local hp = LocalPlayer():Health();
    local face = "face0";
    local w, h = self:GetTextureDimensions(face);
    local offset = self:GetTextureDimensions("0");

    if (hp > 60 and hp <= 80) then
      face = "face1";
    elseif (hp > 40 and hp <= 60) then
      face = "face2";
    elseif (hp > 20 and hp <= 40) then
      face = "face3";
    elseif (hp <= 20) then
      face = "face4";
    end

    Q1HUD:DrawFace(x, y, face);
    Q1HUD:DrawNumber(math.Clamp(hp, 0, hp), x + (offset * scale * 3) + (w * scale), y, hp <= 25);
  end

end
