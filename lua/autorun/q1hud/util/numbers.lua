--[[
  NUMBERS
]]

if CLIENT then

  -- Parameters
  local SUFIX = "s";
  local CHAR_SUFIX = "c";
  local TINY_SUFIX = "i";
  local TINY_SUFIX_ACTIVATED = "ia"
  local VER_SUFIX = "sv";

  --[[
    Draws a number on the screen
    @param {number} value
    @param {number} x
    @param {number} y
    @param {boolean} crit
    @return {number} width
  ]]
  function Q1HUD:DrawNumber(value, x, y, crit)
    local scale = Q1HUD:GetHUDScale();
    crit = crit or false;

    local tab = string.ToTable(tostring(value));

    local a = "";
    if (crit) then
      a = "A";
    end

    local i = #tab;
    while (i>0) do
      local k = (#tab - i)+1;
      local w, h = self:GetTextureDimensions(tab[k]..a);
      Q1HUD:DrawTexture(x - (w*k) * scale, y, tab[i]..a, scale);
      i = i - 1;
    end
  end

  --[[
    Draws a small number on the screen
    @param {number} value
    @param {number} x
    @param {number} y
    @param {boolean} crit
    @return {number} width
  ]]
  local w, h = 7, 6;
  function Q1HUD:DrawSmallNumber(value, x, y)
    local scale = Q1HUD:GetHUDScale();

    local tab = string.ToTable(tostring(value));

    local i = #tab;
    while (i>0) do
      local k = (#tab - i)+1;
      Q1HUD:DrawTexture(x - (w*k) * scale, y, tab[i]..SUFIX, scale);
      i = i - 1;
    end
  end

  --[[
    Draws a text
    @param {string} text
    @param {number} x
    @param {number} y
    @param {number|null} scale
    @void
  ]]
  local numbers = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
  function Q1HUD:DrawText(text, x, y, scale)
    scale = scale or Q1HUD:GetHUDScale();
    local tab = string.ToTable(text);

    local offset = 0;
    for pos, char in pairs(tab) do
      if (table.HasValue(numbers, char)) then
        char = char..CHAR_SUFIX;
      end
      Q1HUD:DrawTexture(x + (offset * scale), y, char, scale);
      if (Q1HUD:GetTexture(char) ~= nil) then
        local offsetX, offsetY = Q1HUD:GetTextureDimensions(char);
        offset = offset + offsetX;
      end
    end
  end

  --[[
    Draws a tiny number for the weapon ids
    @param {number} nums
    @param {number} x
    @param {number} y
    @param {boolean|null} highlight
    @void
  ]]
  function Q1HUD:DrawWeaponID(nums, x, y, highlight)
    highlight = highlight or false;
    local scale = Q1HUD:GetHUDScale();
    local tab = string.ToTable(nums);

    local offset = 0;
    for pos, num in pairs(tab) do
      -- Get the texture
      if (highlight) then
        num = num..TINY_SUFIX_ACTIVATED;
      else
        num = num..TINY_SUFIX;
      end
      -- Draw the number
      Q1HUD:DrawTexture(x + (offset * scale), y, num);
      if (Q1HUD:GetTexture(num) ~= nil) then
        local offsetX, offsetY = Q1HUD:GetTextureDimensions(num);
        offset = offset + offsetX;
      end
    end
  end

  --[[
    Draws a small number coloured orange, with numeric and '.' support only
    @param {string} version
    @param {number} x
    @param {number} y
    @param {number|null} scale
    @void
  ]]
  function Q1HUD:DrawVersionNumber(version, x, y, scale)
    scale = scale or Q1HUD:GetHUDScale();
    local tab = string.ToTable(version);

    local offset = 0;
    for pos, num in pairs(tab) do
      num = num..VER_SUFIX;
      Q1HUD:DrawTexture(x + (offset * scale), y, num, scale);
      if (Q1HUD:GetTexture(num) ~= nil) then
        local offsetX, offsetY = Q1HUD:GetTextureDimensions(num);
        offset = offset + offsetX;
      end
    end
  end

end
