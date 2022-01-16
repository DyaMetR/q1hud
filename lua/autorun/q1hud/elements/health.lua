--[[
  HEALTH METER
]]

if CLIENT then

  -- Parameters
  local SUFIX = "_d";
  local DAMAGE_TIME = 0.25; -- The time the damage face is shown
  local HOOK_NAME = "GetStatusBarFace"
  local FACE0, FACE1, FACE2, FACE3, FACE4 = "face0", "face1", "face2", "face3", "face4";
  local ZERO_SPRITE = "0";

  -- Variables
  local anim = 0; -- Animation timer

  --[[
    Triggers the face damage animation.
    @void
  ]]
  function Q1HUD:ShowDamageFace()
    anim = CurTime() + DAMAGE_TIME;
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
    local texture, damage = face, face .. SUFIX;
    if (self:GetTexture(damage) ~= nil and anim > CurTime()) then
      texture = damage
    end
    self:DrawTexture(x, y, texture, scale);
  end

  --[[
    Draws the health panel, with animated face and number
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawHealthPanel(x, y)
    local scale = self:GetHUDScale();
    local hp = LocalPlayer():Health();
    local offset = self:GetTextureDimensions(ZERO_SPRITE);
    local face = self:RunHook(HOOK_NAME, hp);

    -- select face sprite
    if (not face) then
      if (hp > 60 and hp <= 80) then
        face = FACE1;
      elseif (hp > 40 and hp <= 60) then
        face = FACE2;
      elseif (hp > 20 and hp <= 40) then
        face = FACE3;
      elseif (hp <= 20) then
        face = FACE4;
      else
        face = FACE0;
      end
    end

    -- get face dimensions
    local w, h = self:GetTextureDimensions(face);

    -- draw health
    self:DrawFace(x, y, face);
    self:DrawNumber(math.Clamp(hp, 0, hp), x + (offset * scale * 3) + (w * scale), y, hp <= 25);
  end

end
