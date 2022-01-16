--[[
  DAMAGE EFFECT
]]

local NET = "q1hud_damage"

if CLIENT then

  -- Parameters
  local HEALTH_COLOR = Color( 255, 0, 0 );
  local ARMOR_COLOR = Color( 255, 220, 200 );

  --[[
    Receive damage effect
  ]]
  net.Receive(NET, function(len)
    local color = HEALTH_COLOR;
    if (LocalPlayer():Armor() > 0) then color = ARMOR_COLOR; end
    Q1HUD:FlashScreen(color);
    Q1HUD:ShowDamageFace(); -- trigger damage face animation on the status bar
  end);

end

if SERVER then

  util.AddNetworkString(NET);

  --[[
    Damage receive hook
  ]]
  hook.Add("EntityTakeDamage", "q1hud_damage", function(_player, info)
    if (not _player:IsPlayer() or info:GetDamage() <= 0) then return end
    net.Start(NET);
    net.Send(_player);
  end);

end
