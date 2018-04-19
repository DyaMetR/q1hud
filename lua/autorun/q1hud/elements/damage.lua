--[[
  DAMAGE EFFECT
]]

if CLIENT then

  -- Parameters
  local HEALTH_COLOR = Color(255, 0, 0);
  local ARMOR_COLOR = Color(255,220,200);

  -- Variable
  local lastHP = 100;
  local lastAP = 0;

  function Q1HUD:DamageEffect()
    if (not Q1HUD:IsDamageEffectEnabled()) then return end;
    local hp = LocalPlayer():Health(); -- Health
    local ap = LocalPlayer():Armor(); -- Armor

    -- If health is affected
    if (lastHP ~= hp) then
      if (lastHP > hp) then
        if (ap > 0) then
          self:FlashScreen(ARMOR_COLOR);
        else
          self:FlashScreen(HEALTH_COLOR);
        end
      end
      lastHP = hp;
    end
  end

  --[[
    Think hook
  ]]
  hook.Add("Think", "q1hud_damage_think", function()
    Q1HUD:DamageEffect();
  end);

end
