--[[
  LOADING SCREEN
]]

if CLIENT then

  -- Parameters
  local TICK = 0.015;
  local DISPLACEMENT_AMOUNT = 0.015;
  local LOADING_TIME_MIN, LOADING_TIME_MAX = 0.03, 0.18;
  local SECRET_TIME_MIN, SECRET_TIME_MAX = 0.5, 2;
  local TEXTURE = "console";
  local VER_XOFFSET, VER_YOFFSET = 557, 377;
  local EASTEREGG_RANDOM = 7;
  local SEQ_WIDTH, SEQ_HEIGHT = 7, 9;
  local SEQ_XOFFSET, SEQ_YOFFSET = 10, 15;

  -- Variables
  local displacement = 0;
  local think = 0;
  local sequence = {};

  --[[
    Draws the console texture on all the screen
    @void
  ]]
  function Q1HUD:DrawConsole()
    if (displacement >= 1 or not self:IsLoadingScreenEnabled()) then return end;
    -- Draw background
    local file = self:GetTexture(TEXTURE).file;
    surface.SetDrawColor(Color(255, 255, 255));
    surface.SetMaterial(Material(file.path..".png"));
    surface.DrawTexturedRect(0, ScrH() * (-displacement), ScrW(), ScrH());

    -- Text data
    local xScale, yScale = ScrW()/file.u, ScrH()/file.v;

    -- Draw version number
    self:DrawVersionNumber(self.Version, VER_XOFFSET * xScale, VER_YOFFSET * yScale + (ScrH() * (-displacement)), xScale * 2);

    -- Draw loading sequence
    local scale = self:GetHUDScale();
    for k, string in pairs(sequence) do
      self:DrawText(string, SEQ_XOFFSET * xScale, ScrH() - (SEQ_YOFFSET + SEQ_HEIGHT * (table.Count(sequence) - k + 1) * scale) + (ScrH() * (-displacement)));
    end
  end

  --[[
    Think hook
  ]]
  hook.Add("Think", "q1hud_console_anim", function()
    if (displacement >= 1) then return end;
    local count = table.Count(Q1HUD:GetSequenceStrings());
    if (think < CurTime()) then
      -- If the loading sequence isn't over
      if (table.Count(sequence) < count) then
        -- If the loading sequence has reached it's end
        if (table.Count(sequence) + 1 == count) then
          -- Show a little easter egg
          if (math.random(1, EASTEREGG_RANDOM) == 1) then
            local secret = Q1HUD:GetEasterEgg(math.random(1, table.Count(Q1HUD:GetEasterEggs())));
            local separator = "";
            for i=0, string.len(secret) do
              separator = separator.."-";
            end
            table.insert(sequence, separator);
            table.insert(sequence, secret);
            table.insert(sequence, separator);
            think = CurTime() + math.random(SECRET_TIME_MIN, SECRET_TIME_MAX);
          end
          table.insert(sequence, game.GetMap());
        else
          table.insert(sequence, Q1HUD:GetSequenceString(table.Count(sequence) + 1));
          think = CurTime() + math.random(LOADING_TIME_MIN, LOADING_TIME_MAX);
        end
      else
        -- Move the loading screen upward
        displacement = displacement + DISPLACEMENT_AMOUNT;
        think = CurTime() + TICK;
      end
    end
  end);

  --[[
    Reset loading screen
  ]]
  concommand.Add("q1hud_console_reset", function(ply, com, args)
    displacement = 0;
    sequence = {};
  end);

end
