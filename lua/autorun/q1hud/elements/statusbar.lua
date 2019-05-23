--[[
  STATUS BAR
]]

if CLIENT then

  -- Parameters
  local HEALTH_XOFFSET = 112;
  local AMMO_XOFFSET = 224;

  --[[
    Draws the scoreboard
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawScoreboard(x, y)
    local scale = self:GetHUDScale();
    local kills = LocalPlayer():Frags();
    local deaths = LocalPlayer():Deaths();
    local ping = LocalPlayer():Ping();
    local map = game.GetMap();
    local w, h = self:GetTextureDimensions("scoreboard");
    -- Draw the background
    Q1HUD:DrawTexture(x, y, "scoreboard", scale, nil, nil, nil, Q1HUD:GetStatusBarAlpha());

    -- Draw the info
    Q1HUD:DrawText("Kills: "..kills, x + 8 * scale, y + 5 * scale);
    Q1HUD:DrawText("Deaths: "..deaths, x + 8 * scale, y + 13 * scale);
    Q1HUD:DrawText("Ping: "..ping, x + (w/2) * scale, y + 5 * scale);
    Q1HUD:DrawText(map, x + (w/2) * scale, y + 13 * scale);
  end

  --[[
    Draws the statusbar
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawStatusBar(x, y)
    local scale = Q1HUD:GetHUDScale();
    local w, h = Q1HUD:GetTextureDimensions("statusbar");

    -- Draw the statusbar
    Q1HUD:DrawTexture(x, y, "statusbar", scale, nil, nil, nil, Q1HUD:GetStatusBarAlpha());
    -- Draw the health panel
    Q1HUD:DrawHealthPanel(x + HEALTH_XOFFSET * scale, y);
    -- Draw the armor panel
    Q1HUD:DrawArmorPanel(x, y);
    -- Draw the ammunition panel
    Q1HUD:DrawAmmoPanel(x + AMMO_XOFFSET * scale, y, LocalPlayer():GetActiveWeapon());
  end

  --[[
    Draws the main HUD panel, that'll draw the statusbar and inventory
    @void
  ]]
  -- Draw the Scoreboard upon dying! (also make it an option)
  function Q1HUD:DrawMainPanel()
    if (not Q1HUD:IsStatusbarEnabled()) then return; end
    local backtile = Q1HUD:GetBacktileAlpha();
    local inventory = Q1HUD:IsInventoryEnabled();
    local scale = Q1HUD:GetHUDScale();
    local dead = LocalPlayer():Health() <= 0;
    local scoreboard = LocalPlayer():KeyDown(IN_SCORE);
    local w, h = Q1HUD:GetTextureDimensions("statusbar");
    local iW, iH = Q1HUD:GetTextureDimensions("inventory");
    local x, y = (ScrW()/2) - (w * scale)/2, ScrH() - (h * scale);

    if (backtile > 0) then
      -- Draw the background if enabled
      local h = h;
      if (inventory) then
        h = h + iH; -- Make the background taller if the inventory is enabled
      end
      Q1HUD:DrawTexture(0, ScrH() - (h * scale), "backtile", scale, nil, ScrW()/scale, nil, backtile);
    end

    if (inventory) then
      Q1HUD:DrawInventory(x, y - (h * scale));
    end

    if ((dead and Q1HUD:IsScoreboardOnDeathEnabled()) or scoreboard) then
      Q1HUD:DrawScoreboard(x, y);
    else
      Q1HUD:DrawStatusBar(x, y);
    end
  end

end
