--[[
  CUSTOM DEATH SCREEN
  Yes, if you're wondering: It's straight from the GoldSrc HUD. It's the same.
  Half-Life ran on a modified version of the Quake engine, so...
]]

if CLIENT then
  -- Parameters
  local roll = 90;

  -- Variables
  local cameraPos = Vector(0,0,0);
  local alive = true;
  local rotation = 0;

  -- Hooks
  hook.Add("Think", "q1hud_deathscreen", function ()
    if not (Q1HUD:IsDeathScreenEnabled() and Q1HUD:IsEnabled()) then return end;
    if not LocalPlayer():Alive() then
      local tr = util.TraceLine( {
      	start = LocalPlayer():GetPos(),
      	endpos = LocalPlayer():GetPos() - Vector(0,0,5)
      } );

      if not tr.Hit or alive then
        cameraPos = LocalPlayer():GetPos() + Vector(0,0,5);
      end

      alive = false;

      if (rotation ~= 1) then
        rotation = 1;
      end

      if LocalPlayer():GetRagdollEntity() ~= nil then
        LocalPlayer():GetRagdollEntity():SetNoDraw(true);
      end
    else
      if not alive then
        rotation = 0;
        alive = true;
      end
    end
  end);

  hook.Add("CalcView", "q1hud_camera", function( ply, origin, angles, fov, znear, zfar )
    if LocalPlayer():Alive() or not (Q1HUD:IsDeathScreenEnabled() and Q1HUD:IsEnabled()) then return end;
    local view = {};

  	view.origin = cameraPos;
  	view.angles = Angle(angles.p, angles.y, angles.r + roll * rotation);
  	view.fov = fov;

    return view;
  end);

end
