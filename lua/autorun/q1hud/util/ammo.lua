--[[
  AMMUNITION ICONS

  Icons by default are resources searched in the texture table. In order
  to link one of these icons to an ammo type, you need to add an entry on
  the 'AmmoIcons' table.

  But because it's not recommended to edit the default skin in order to add
  more icons, they can be added as if they were textures by adding entries
  to the 'AmmoResources' table.

  This way, you can link a custom resource to an ammo type just as if it was
  a default texture.

  Now, there are some instances when some addons will add a new name to an
  existing ammunition type. In this case, you have to add an entry to the
  'AmmoIconsCustomName' table, where you'll only have to link an icon to
  a custom name.
]]

if CLIENT then

  -- Parameters
  local SMALLICON_TEXTURE_WIDTH, SMALLICON_TEXTURE_HEIGHT, SMALLICON_MATERIAL_WIDTH, SMALLICON_MATERIAL_HEIGHT = 16, 16, 9, 7;
  local TEXTURE_WIDTH, TEXTURE_HEIGHT, MATERIAL_WIDTH, MATERIAL_HEIGHT = 32, 32, 24, 24;
  local SUFIX = "_ammo";
  local NULL_AMMO_SMALL, NULL_AMMO_BIG = "nail", "nails";
  local NULL_AMMO_TABLE = {iconSmall = NULL_AMMO_SMALL, iconBig = NULL_AMMO_BIG};

  -- Tables
  Q1HUD.AmmoIcons = {}; -- Ammo type linked to an icon
  Q1HUD.AmmoResources = {}; -- Custom ammo textures
  Q1HUD.AmmoIconsCustomName = {}; -- Custom ammo textures for custom named ammo types

  --[[
    Adds a set of two icons for an ammo type
    @param {string} ammo
    @param {string} iconSmall
    @param {string} iconBig
    @void
  ]]
  function Q1HUD:AddAmmoIcon(ammo, iconSmall, iconBig)
    self.AmmoIcons[ammo] = {iconSmall = iconSmall, iconBig = iconBig};
  end

  --[[
    Returns the icons data for the given ammo type
    @param {string} ammo
    @return {table} iconData
  ]]
  function Q1HUD:GetAmmoIcon(ammo)
    return self.AmmoIcons[ammo];
  end

  --[[
    Adds a custom available icon
    @param {string} icon
    @param {string} path
    @param {number} w
    @param {number} h
    @param {boolean|null} isMaterial
  ]]
  function Q1HUD:AddAmmoResource(icon, path, isMaterial)
    self.AmmoResources[icon] = {path = path, isMaterial = isMaterial or false};
  end

  --[[
    Returns the custom resource data from an icon
    @param {icon}
    @return {table} iconData
  ]]
  function Q1HUD:GetAmmoResource(icon)
    return self.AmmoResources[icon];
  end

  --[[
    Adds a custom icon to an ammo type if has a certain name
    @param {string} name
    @param {string} iconSmall
    @param {string} iconBig
    @void
  ]]
  function Q1HUD:AddAmmoCustomNameIcon(name, iconSmall, iconBig)
    self.AmmoIconsCustomName[name] = {iconSmall = iconSmall, iconBig = iconBig}
  end

  --[[
    Returns the custom icons for the ammo type that has the given name
    @param {string} name
    @return {table} iconData
  ]]
  function Q1HUD:GetAmmoCustomNameIcon(name)
    return self.AmmoIconsCustomName[name];
  end

  --[[
    Returns whether an ammo type has an icon linked to it
    @param {string} ammo
    @param {boolean} hasIcon
  ]]
  function Q1HUD:HasAmmoIcon(ammo)
    return self:GetAmmoIcon(ammo) ~= nil;
  end

  --[[
    Returns whether an ammo type has a custom resource for the small icon
    @param {string} ammo
    @return {boolean} hasSmallIcon
  ]]
  function Q1HUD:HasSmallCustomAmmoResource(ammo)
    if (not self:HasFinalAmmoIcon(ammo)) then return false end;
    return self:GetAmmoResource(self:GetAmmoIcon(ammo).iconSmall) ~= nil;
  end

  --[[
    Returns whether an ammo type has a custom resource for the big icon
    @param {string} ammo
    @return {boolean} hasBigIcon
  ]]
  function Q1HUD:HasBigCustomAmmoResource(ammo)
    if (not self:HasFinalAmmoIcon(ammo)) then return false end;
    return self:GetAmmoResource(self:GetAmmoIcon(ammo).iconBig) ~= nil;
  end

  --[[
    Returns whether the custom name exists
    @param {string} name
    @return {boolean} hasCustomName
  ]]
  function Q1HUD:HasAmmoCustomName(name)
    return self:GetAmmoCustomNameIcon(name) ~= nil;
  end

  --[[
    Returns the filtered ammo icon
    @param {string} ammo
    @return {table} iconData
  ]]
  function Q1HUD:GetFinalAmmoIcon(ammo)
    if (ammo == nil) then return false end;
    local name = language.GetPhrase(ammo..SUFIX);
    if (self:HasAmmoCustomName(name)) then
      return self:GetAmmoCustomNameIcon(name)
    else
      return self:GetAmmoIcon(ammo);
    end
  end

  --[[
    Returns whether an ammo type has by any mean an icon linked to it
    @param {string} ammo
    @return {boolean} hasIcon
  ]]
  function Q1HUD:HasFinalAmmoIcon(ammo)
    if (ammo == nil) then return false end;
    return self:HasAmmoCustomName(language.GetPhrase(ammo..SUFIX)) or self:HasAmmoIcon(ammo);
  end

  --[[
    Draws the small icon of an ammo type
    @param {number} x
    @param {number} y
    @param {string} ammo
    @void
  ]]
  function Q1HUD:DrawSmallAmmoIcon(x, y, ammo)
    local ammoIcon = NULL_AMMO_TABLE;
    if (self:HasFinalAmmoIcon(ammo)) then
      ammoIcon = self:GetFinalAmmoIcon(ammo);
    end;

    local scale = self:GetHUDScale();
    if (self:HasSmallCustomAmmoResource(ammo)) then
      local texture = self:GetAmmoResource(ammoIcon.iconSmall);
      local w, h = SMALLICON_TEXTURE_WIDTH, SMALLICON_TEXTURE_HEIGHT;
      if (texture.isMaterial) then
        surface.SetMaterial(Material(texture.path));
        w, h = SMALLICON_MATERIAL_WIDTH, SMALLICON_MATERIAL_HEIGHT;
      else
        surface.SetTexture(surface.GetTextureID(texture.path));
      end
      Q1HUD.LastBufferedTexture = nil; -- Reset the default texture buffer
      surface.SetDrawColor(Color(255, 255, 255));
      surface.DrawTexturedRect(x, y, w * scale, h * scale);
    else
      self:DrawTexture(x, y, ammoIcon.iconSmall);
    end
  end

  --[[
    Draws the big icon of an ammo type
    @param {number} x
    @param {number} y
    @param {string} ammo
    @void
  ]]
  function Q1HUD:DrawBigAmmoIcon(x, y, ammo)
    local ammoIcon = NULL_AMMO_TABLE;
    if (self:HasFinalAmmoIcon(ammo)) then
      ammoIcon = self:GetFinalAmmoIcon(ammo);
    end;

    local scale = self:GetHUDScale();
    if (self:HasBigCustomAmmoResource(ammo)) then
      -- If there's a custom ammo resource
      local w, h = TEXTURE_WIDTH, TEXTURE_HEIGHT;
      local texture = self:GetAmmoResource(ammoIcon.iconBig);
      if (texture.isMaterial) then
        -- If it's a material set the real size
        w = MATERIAL_WIDTH;
        h = MATERIAL_HEIGHT;
        surface.SetMaterial(Material(texture.path));
      else
        surface.SetTexture(surface.GetTextureID(texture.path));
      end
      Q1HUD.LastBufferedTexture = nil; -- Reset the default texture buffer
      surface.SetDrawColor(Color(255, 255, 255));
      surface.DrawTexturedRect(x, y, w * scale, h * scale);
    else
      self:DrawTexture(x, y, ammoIcon.iconBig);
    end
  end

end
