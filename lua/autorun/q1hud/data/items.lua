--[[
  ITEMS
]]

if CLIENT then

  -- Weapon and ammo pickups
  Q1HUD:AddItemString("ammo_pickup", "You get %d %s");
  Q1HUD:AddItemString("weapon_pickup", "You got the %s");

  -- Healthkit and healthvial
  Q1HUD:AddItemString("item_healthkit", "You receive 25 health");
  Q1HUD:AddItemString("item_healthvial", "You receive 10 health");

  -- Armor battery
  Q1HUD:AddItemString("item_battery", "You got armor");

end
