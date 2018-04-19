--[[
  SKINS
]]

if CLIENT then

  -- Skin table
  Q1HUD.Skins = {};

  -- Parameters
  Q1HUD.DefaultSkin = "Default";

  --[[
    Adds a selectable skin
    @param {string} name
    @param {table} data
    @void
  ]]
  function Q1HUD:AddSkin(name, data)
    self.Skins[name] = data;
  end

  --[[
    Returns a skin's data
    @param {string} name
    @return {table} data
  ]]
  function Q1HUD:GetSkin(name)
    if self.Skins[name] == nil then return self.Skins[self.DefaultSkin] end;
    return self.Skins[name];
  end

  --[[
    Returns all skins'
    @return {table} Q1HUD.Skins
  ]]
  function Q1HUD:GetSkins()
    return self.Skins;
  end

end
