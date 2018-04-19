--[[
  DRAW LOG
]]

if CLIENT then

  -- Parameters
  local TEXT_HEIGHT = 9;

  -- Temporary parameters (will become config)
  local LOG_TIME = 5;
  local MAX_LOG = 7;

  -- Log buffer
  local log = {};

  --[[
    Adds a text to the log
    @param {string} string
    @void
  ]]
  function Q1HUD:AddLog(string)
    if (table.Count(log) >= MAX_LOG) then
      table.remove(log, 1);
    end
    table.insert(log, {string = string, time = CurTime() + LOG_TIME});
  end

  --[[
    Draws the message log
    @param {number} x
    @param {number} y
    @void
  ]]
  function Q1HUD:DrawLog(x, y)
    local scale = self:GetHUDScale();
    if (table.Count(log) <= 0) then return end;
    for k, entry in pairs(log) do
      self:DrawText(entry.string, x, y + TEXT_HEIGHT * scale * (k - 1));
    end
  end

  --[[
    Checks if any of the log entries have timed out
    @void
  ]]
  local function FlushLog()
    for k, entry in pairs(log) do
      if (entry.time < CurTime()) then
        table.remove(log,k);
      end
    end
  end

  --[[
    Think hook
  ]]
  hook.Add("Think", "q1hud_log_think", function()
    if (table.Count(log) > 0) then FlushLog() end;
  end);

end
