--[[
  DRAW THE HUD ELEMENTS
]]

if CLIENT then

  -- Parameters
  local LOG_XOFFSET, LOG_YOFFSET = 5, 5;

  --[[
    HUDPaint hook
  ]]
  hook.Add("HUDPaint", "q1hud_draw", function()
    if (not Q1HUD:IsEnabled()) then return end;
    local scale = Q1HUD:GetHUDScale();
    Q1HUD:DrawScreenFlash();
    Q1HUD:DrawLog(LOG_XOFFSET * scale, LOG_YOFFSET * scale);
    Q1HUD:DrawMainPanel();
    Q1HUD:DrawConsole();
  end);
end
