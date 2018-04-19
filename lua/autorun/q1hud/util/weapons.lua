--[[
  WEAPON ICONS

  Icons by default are resources searched in the texture table. In order
  to link one of these icons to a weapon, you need to add an entry on
  the 'WeaponIcons' table.

  But because it's not recommended to edit the default skin in order to add
  more icons, they can be added as if they were textures by adding entries
  to the 'WeaponResources' table.

  This way, you can link a custom resource to an weapon just as if it was
  a default texture.
]]

if CLIENT then

    -- Parameters
    local TEXTURE_WIDTH, ICON_HEIGHT, MATERIAL_WIDTH = 32, 16, 24;
    local XOFFSET, YOFFSET = 0, 1; -- The highlight x and y offsets
    local ID_XOFFSET, ID_YOFFSET = 2, 9;
    local ANIM_SPEED = 0.085;
    local CYCLES = 9;
    local ANIM_CYCLE = {3, 0, 1, 2, 3, 0, 1, 2, 3}; -- Animation frames cycle
    local TEXTURE = "highlight";

    -- Tables
    Q1HUD.WeaponIcons = {}; -- Weapon linked to their icon
    Q1HUD.WeaponResources = {}; -- Custom weapon textures

    -- Variables
    local anims = {};
    local think = 0;

    --[[
      Adds a weapon icon
      @param {string} weapon
      @param {string} icon
      @void
    ]]
    function Q1HUD:AddWeaponIcon(weapon, icon)
      self.WeaponIcons[weapon] = icon;
    end

    --[[
      Returns an icon given the weapon
      @param {string} weapon
      @return {string} icon
    ]]
    function Q1HUD:GetWeaponIcon(weapon)
      return self.WeaponIcons[weapon];
    end

    --[[
      Adds a custom weapon icon resource to draw
      @param {string} path
      @param {number} w
      @param {number} h
      @param {boolean|null} isMaterial
    ]]
    function Q1HUD:AddWeaponResource(icon, path, isMaterial)
      self.WeaponResources[icon] = {path = path, isMaterial = isMaterial or false};
    end

    --[[
      Returns the icon resource data from a texture
      @param {string} path
      @return {table} resources
    ]]
    function Q1HUD:GetWeaponResource(icon)
      return self.WeaponResources[icon] or nil;
    end

    --[[
      Returns whether a weapon has an icon
      @param {string} weapon
    ]]
    function Q1HUD:HasWeaponIcon(weapon)
      return self:GetWeaponIcon(weapon) ~= nil;
    end

    --[[
      Returns whether an weapon has a custom weapon icon
      @param {string} weapon
      @return {boolean} hasCustomResource
    ]]
    function Q1HUD:HasCustomWeaponResource(weapon)
      if (not self:HasWeaponIcon(weapon)) then return false end;
      return self:GetWeaponResource(self:GetWeaponIcon(weapon)) ~= nil;
    end

    --[[
      Draws the highlighting animation for a weapon
      @param {number} x
      @param {number} y
      @param {string} weapon
      @void
    ]]
    function Q1HUD:DrawHighlightAnimation(x, y, weapon)
      if (anims[weapon] == nil or anims[weapon] <= 0) then return end;
      local scale = self:GetHUDScale();
      self:DrawTexture(x + XOFFSET * scale, y + YOFFSET * scale, TEXTURE..ANIM_CYCLE[anims[weapon]]);
    end

    --[[
      Returns the icon for the given weapon
      @param {number} x
      @param {number} y
      @param {string} weapon
      @param {number|null} id
      @param {boolean|null} selected
      @void
    ]]
    function Q1HUD:DrawWeaponIcon(x, y, weapon, id, selected)
      if (not self:HasWeaponIcon(weapon)) then return end;
      local scale = self:GetHUDScale();
      -- Draw the weapon icon
      if (self:HasCustomWeaponResource(weapon)) then
        -- If there's a custom icon for this weapon, draw it
        local scale = self:GetHUDScale();
        local resource = self:GetWeaponResource(self:GetWeaponIcon(weapon));
        local w, h = TEXTURE_WIDTH, ICON_HEIGHT;
        if (resource.isMaterial) then -- Difference between Material and Texture
          w = MATERIAL_WIDTH;
          surface.SetMaterial(Material(resource.path));
        else
          surface.SetTexture(surface.GetTextureID(resource.path));
        end
        Q1HUD.LastBufferedTexture = nil; -- Reset the default texture buffer
        surface.SetDrawColor(Color(255, 255, 255));
        surface.DrawTexturedRect(x, y, w * scale, h * scale);
      else
        self:DrawTexture(x, y, self:GetWeaponIcon(weapon));
      end

      -- Draw the highlight effect
      if (anims[weapon] ~= nil) then
        self:DrawHighlightAnimation(x, y, weapon);
      else
        if (selected) then
          self:DrawTexture(x + XOFFSET * scale, y + YOFFSET * scale, "highlight3");
        end
      end

      -- Draw the weapon id
      if (id ~= nil) then
        selected = selected or anims[weapon] ~= nil or false;
        self:DrawWeaponID(id, x + ID_XOFFSET * scale, y + ID_YOFFSET * scale, selected);
      end
    end

    --[[
      Triggers the weapon pickup animation
      @param {string} weapon
      @void
    ]]
    function Q1HUD:AddWeaponAnimation(weapon)
      anims[weapon] = 0;
    end

    --[[
      Think hook
    ]]
    hook.Add("Think", "q1hud_weapon_anim_think", function()
      -- Only work if there are animations present
      if (table.Count(anims) > 0) then
        if (think < CurTime()) then
          for k, anim in pairs(anims) do
            if (anim < CYCLES) then
              anims[k] = anim + 1;
            else
              anims[k] = nil;
            end
          end
          think = CurTime() + ANIM_SPEED;
        end
      end
    end);

end
