--[[
  AMMO AND WEAPON SELECTION FOR INVENTORY
]]

if CLIENT then

  -- Data table
  Q1HUD.Inventory = {
    Ammo = {},
    Weapons = {}
  }

  --[[
    Adds a selectable weapon for the inventory
    @param {string} weapon_class
    @param {string} name
    @void
  ]]
  function Q1HUD:AddSelectableWeapon(weapon_class, name)
    self.Inventory.Weapons[weapon_class] = name;
  end

  --[[
    Returns all selectable weapons for the inventory
    @return {table} weapons
  ]]
  function Q1HUD:GetSelectableWeapons()
    return self.Inventory.Weapons;
  end

  --[[
    Adds a selectable ammo for the inventory
    @param {string} ammo
    @param {string} name
    @void
  ]]
  function Q1HUD:AddSelectableAmmo(ammo, name)
    self.Inventory.Ammo[ammo] = name;
  end

  --[[
    Returns all selectable ammo types for the inventory
    @return {table} ammoTypes
  ]]
  function Q1HUD:GetSelectableAmmoTypes()
    return self.Inventory.Ammo;
  end

end
