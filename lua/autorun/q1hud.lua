--[[------------
    Q U A K E
Heads Up Display
  Version 1.0.2
    19/02/19

By DyaMetR
]]--------------

-- Main framework table
Q1HUD = {};
Q1HUD.Version = "1. 02";

--[[
  METHODS
]]

--[[
  Correctly includes a file
  @param {string} file
  @void
]]--
function Q1HUD:IncludeFile(file)
  if SERVER then
    include(file);
    AddCSLuaFile(file);
  end
  if CLIENT then
    include(file);
  end
end

--[[
  INCLUDES
]]
Q1HUD:IncludeFile("q1hud/core.lua");
