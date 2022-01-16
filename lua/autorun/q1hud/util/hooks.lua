--[[
  SIMPLE CUSTOM HOOK LIBRARY
]]

if CLIENT then

  local hooks = {};

  --[[
    Adds a function to the hook.
    @param {string} hook name
    @param {string} identifier
    @param {function} function to run
    @void
  ]]
  function Q1HUD:AddHook(_hook, name, func)
    if (not hooks[_hook]) then hooks[_hook] = {}; end
    hooks[_hook][name] = func;
  end

  --[[
    Removes a function from the hook.
    @param {string} hook name
    @param {string} identifier
    @void
  ]]
  function Q1HUD:RemoveHook(_hook, name)
    if (not hooks[_hook] or not hooks[_hook][name]) then return end
    hooks[_hook][name] = nil;
  end

  --[[
    Run all functions tied to the given hook.
    @param {string} hook name
    @param {vararg} arguments
    @return {vararg} returning values
  ]]
  function Q1HUD:RunHook(_hook, ...)
    if (not hooks[_hook]) then return end
    for _, func in pairs(hooks[_hook]) do
      local a, b, c, d, e, f = func(...); -- run function

      -- if a value was provided, return them
      if (a ~= nil) then
        return a, b, c, d, e, f;
      end
    end
  end

end
