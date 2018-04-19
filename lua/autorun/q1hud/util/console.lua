--[[
  LOADING SCREEN
]]

if CLIENT then

  -- Loading text
  Q1HUD.LoadingSequence = {};
  Q1HUD.LoadingEasterEggs = {};


  --[[
    Adds a string to the loading sequence
    @param {string} string
    @void
  ]]
  function Q1HUD:AddSequenceString(string)
    table.insert(self.LoadingSequence, string);
  end

  --[[
    Returns the loading sequence string table
    @return {table} loadingSequence
  ]]
  function Q1HUD:GetSequenceStrings()
    return self.LoadingSequence;
  end

  --[[
    Returns a single loading sequence string
    @param {number} i
    @return {string} sequence
  ]]
  function Q1HUD:GetSequenceString(i)
    return self:GetSequenceStrings()[i] or "null";
  end

  --[[
    Adds a possible random easter egg to the loading screen
    @param {string} string
    @void
  ]]
  function Q1HUD:AddEasterEgg(string)
    table.insert(self.LoadingEasterEggs, string);
  end

  --[[
    Returns the loading screen possible easter egg table
    @return {table} easterEggs
  ]]
  function Q1HUD:GetEasterEggs()
    return self.LoadingEasterEggs;
  end

  --[[
    Returns a possible random easter egg
    @param {number} i
    @return {string} easterEgg
  ]]
  function Q1HUD:GetEasterEgg(i)
    return self:GetEasterEggs()[i] or "null";
  end

end
