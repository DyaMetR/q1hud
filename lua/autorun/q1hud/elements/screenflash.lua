--[[
  SCREEN FLASHING
]]

if CLIENT then

  -- Parameters
  local MAX_ALPHA = 100;
  local START_ALPHA = 0.3;
  local TICK = 0.01;
  local TAKE_AMOUNT = 0.015;

  -- Variables
  local alpha = 0;
  local think = 0;
  local col = Color(255, 255, 255);

  --[[
    Flashes the screen in a certain colour
    @param {Color} color
    @void
  ]]
  function Q1HUD:FlashScreen(color)
    col = color;
    alpha = START_ALPHA;
  end

  --[[
    Draws the screen flash and animates it
    @void
  ]]
  function Q1HUD:DrawScreenFlash()
    if (alpha <= 0) then return end;
    -- Draw the screen flash
    draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(col.r, col.g, col.b, MAX_ALPHA * alpha));

    -- Animate the effect
    if (think < CurTime()) then
      alpha = alpha - TAKE_AMOUNT;
      think = CurTime() + TICK;
    end
  end

end
