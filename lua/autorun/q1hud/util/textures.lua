--[[
  TEXTURES
]]

if CLIENT then

  --[[
    Adds a texture for a skin data table
    @param {table} data
    @param {string} name
    @param {table} file = {path = path, u = u, v = v}
    @param {number} x
    @param {number} y
    @param {number} w
    @param {number} h
    @void
  ]]
  function Q1HUD:AddTexture(data, name, file, x, y, w, h)
    data[name] = {file = file, x = x, y = y, w = w, h = h};
  end

  --[[
    Gets a specific texture's data
    @param {string} name
    @return {table} data
  ]]
  function Q1HUD:GetTexture(name)
    if (self:GetSkin(self.DefaultSkin)[name] == nil) then return nil end;
    if (self:GetSkin(Q1HUD:GetSelectedSkin())[name] == nil) then return self:GetSkin(self.DefaultSkin)[name] end;
    return self:GetSkin(Q1HUD:GetSelectedSkin())[name];
  end

  --[[
    Gets the dimensions of a texture
    @param {string} name
    @return {number} w
    @return {number} h
  ]]
  function Q1HUD:GetTextureDimensions(name)
    if (self:GetTexture(name) == nil) then return 0, 0 end;
    return self:GetTexture(name).w, self:GetTexture(name).h;
  end

  --[[
    Returns the dimenions of the file containing a texture
    @param {string} name
    @return {number} w
    @return {number} h
  ]]
  function Q1HUD:GetTextureFileDimensions(name)
    if (self:GetTexture(name) == nil) then return 0, 0 end;
    return self:GetTexture(name).file.u, self:GetTexture(name).file.v;
  end

  --[[
    Draws the specific texture depending on your current skin
    @param {number} x
    @param {number} y
    @param {string} name
    @param {number|null} scale
    @param {boolean|null} forcePreload
    @param {number|null} w
    @param {number|null} h
    @param {number|null} alpha
    @param {Color|null} color
    @void
  ]]
  function Q1HUD:DrawTexture(x, y, name, scale, forcePreload, w, h, alpha, color)
    if (self:GetTexture(name) == nil) then return end;
    forceTexture = forceTexture or true;
    scale = scale or Q1HUD:GetHUDScale();
    alpha = alpha or 255;
    color = color or Color(255, 255, 255);

    local texture = self:GetTexture(name);
    local a, b, w, h = texture.x, texture.y, w or texture.w, h or texture.h;

    local file = texture.file;
    local path, u, v = file.path, file.u, file.v;

    surface.SetDrawColor(Color(color.r, color.g, color.b, alpha));
    surface.SetTexture(path);
    surface.DrawTexturedRectUV(x, y, w * scale, h * scale, (a/u), (b/v), (a + w)/u, (b + h)/v);
  end

end
