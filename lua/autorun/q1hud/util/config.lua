--[[
  HUD CONFIG
]]

if CLIENT then
  -- Default configuration

  Q1HUD.DefaultConfig = {
    Scale = {command = "q1hud_scale", value = 1},
    AmmoStyle = {command = "q1hud_ammostyle", value = 0},
    Skin = {command = "q1hud_skin", value = "Default"},

    Enabled = {command = "q1hud_enabled", value = 1},
    InventoryEnabled = {command = "q1hud_inventory_enabled", value = 0},
    ItemPickupEnabled = {command = "q1hud_pickup_enabled", value = 1},
    DamageEffectEnabled = {command = "q1hud_damage_enabled", value = 1},
    DeathScreenEnabled = {command = "q1hud_deathscreen_enabled", value = 1},
    ScoreboardOnDeathEnabled = {command = "q1hud_scoreboardondeath_enabled", value = 1},
    LoadingScreenEnabled = {command = "q1hud_loadingscreen_enabled", value = 1},

    BacktileAlpha = {command = "q1hud_backtile_alpha", value = 255},
    StatusBarAlpha = {command = "q1hud_statusbar_alpha", value = 255},

    AmmoInvSlot1 = {command = "q1hud_inventory_ammo_1", value = "Pistol"},
    AmmoInvSlot2 = {command = "q1hud_inventory_ammo_2", value = "357"},
    AmmoInvSlot3 = {command = "q1hud_inventory_ammo_3", value = "SMG1"},
    AmmoInvSlot4 = {command = "q1hud_inventory_ammo_4", value = "AR2"},
    AmmoInvSlot5 = {command = "q1hud_inventory_ammo_5", value = "Buckshot"},
    AmmoInvSlot6 = {command = "q1hud_inventory_ammo_6", value = "XBowBolt"},
    AmmoInvSlot7 = {command = "q1hud_inventory_ammo_7", value = "RPG_Round"},

    WeaponInvSlot1 = {command = "q1hud_inventory_weapon_1", value = "weapon_physgun"},
    WeaponInvSlot2 = {command = "q1hud_inventory_weapon_2", value = "weapon_physcannon"},
    WeaponInvSlot3 = {command = "q1hud_inventory_weapon_3", value = "weapon_crowbar"},
    WeaponInvSlot4 = {command = "q1hud_inventory_weapon_4", value = "weapon_pistol"},
    WeaponInvSlot5 = {command = "q1hud_inventory_weapon_5", value = "weapon_357"},
    WeaponInvSlot6 = {command = "q1hud_inventory_weapon_6", value = "weapon_smg1"},
    WeaponInvSlot7 = {command = "q1hud_inventory_weapon_7", value = "weapon_ar2"},
    WeaponInvSlot8 = {command = "q1hud_inventory_weapon_8", value = "weapon_shotgun"},
    WeaponInvSlot9 = {command = "q1hud_inventory_weapon_9", value = "weapon_crossbow"},
    WeaponInvSlot10 = {command = "q1hud_inventory_weapon_10", value = "weapon_rpg"},
    WeaponInvSlot11 = {command = "q1hud_inventory_weapon_11", value = "weapon_frag"},
    WeaponInvSlot12 = {command = "q1hud_inventory_weapon_12", value = "gmod_tool"}
  }

  -- Configuration
  Q1HUD.Config = {};

  for k, config in pairs(Q1HUD.DefaultConfig) do
    Q1HUD.Config[k] = CreateClientConVar(config.command, config.value);
  end

  --[[
    Returns whether the HUD is enabled
    @return {boolean} enabled
  ]]
  function Q1HUD:IsEnabled()
    return self.Config.Enabled:GetInt() > 0;
  end

  --[[
    Returns the HUD scale
    @return {number} scale
  ]]
  function Q1HUD:GetHUDScale()
    return self.Config.Scale:GetFloat();
  end

  --[[
    Returns the ammunition draw style
    @return {number} ammoStyle
  ]]
  function Q1HUD:GetAmmoStyle()
    return self.Config.AmmoStyle:GetInt();
  end

  --[[
    Returns the currently selected skin
    @return {string} skin
  ]]
  function Q1HUD:GetSelectedSkin()
    return self.Config.Skin:GetString();
  end

  --[[
    Returns whether the inventory is enabled
    @return {boolean} inventoryEnabled
  ]]
  function Q1HUD:IsInventoryEnabled()
    return self.Config.InventoryEnabled:GetInt() > 0;
  end

  --[[
    Returns whether the item pickup effect is enabled
    @return {boolean} pickupEnabled
  ]]
  function Q1HUD:IsItemPickupEnabled()
    return self.Config.ItemPickupEnabled:GetInt() > 0;
  end

  --[[
    Returns whether the death screen is enabled
    @return {boolean} deathScreenEnabled
  ]]
  function Q1HUD:IsDeathScreenEnabled()
    return self.Config.DeathScreenEnabled:GetInt() > 0;
  end

  --[[
    Returns whether the damage effect is enabled
    @return {boolean} damageEffectEnabled
  ]]
  function Q1HUD:IsDamageEffectEnabled()
    return self.Config.DamageEffectEnabled:GetInt() > 0;
  end

  --[[
    Returns whether the scoreboard is enabled upon dying
    @return {boolean} scoreboardOnDeathEnabled
  ]]
  function Q1HUD:IsScoreboardOnDeathEnabled()
    return self.Config.ScoreboardOnDeathEnabled:GetInt() > 0;
  end

  --[[
    Returns whether the scoreboard is enabled upon dying
    @return {boolean} scoreboardOnDeathEnabled
  ]]
  function Q1HUD:IsLoadingScreenEnabled()
    return self.Config.LoadingScreenEnabled:GetInt() > 0;
  end

  --[[
    Returns the alpha channel amount for the backtile
    @return {number} backtileAlpha
  ]]
  function Q1HUD:GetBacktileAlpha()
    return self.Config.BacktileAlpha:GetInt();
  end

  --[[
    Returns the alpha channel amount for the status bar
    @return {number} statusbarAlpha
  ]]
  function Q1HUD:GetStatusBarAlpha()
    return self.Config.StatusBarAlpha:GetInt();
  end

  --[[
    Returns the ammo types shown on the inventory
    @return {table} inventoryAmmoTypes
  ]]
  function Q1HUD:GetInventoryAmmoTypes()
    return {
            self.Config.AmmoInvSlot1:GetString(),
            self.Config.AmmoInvSlot2:GetString(),
            self.Config.AmmoInvSlot3:GetString(),
            self.Config.AmmoInvSlot4:GetString(),
            self.Config.AmmoInvSlot5:GetString(),
            self.Config.AmmoInvSlot6:GetString(),
            self.Config.AmmoInvSlot7:GetString()
          };
  end

  --[[
    Returns the weapons shown on the inventory if picked up
    @return {table} inventoryWeapons
  ]]
  function Q1HUD:GetInventoryWeapons()
    return {
            self.Config.WeaponInvSlot1:GetString(),
            self.Config.WeaponInvSlot2:GetString(),
            self.Config.WeaponInvSlot3:GetString(),
            self.Config.WeaponInvSlot4:GetString(),
            self.Config.WeaponInvSlot5:GetString(),
            self.Config.WeaponInvSlot6:GetString(),
            self.Config.WeaponInvSlot7:GetString(),
            self.Config.WeaponInvSlot8:GetString(),
            self.Config.WeaponInvSlot9:GetString(),
            self.Config.WeaponInvSlot10:GetString(),
            self.Config.WeaponInvSlot11:GetString(),
            self.Config.WeaponInvSlot12:GetString()
          };
  end

  --[[
    Reset the configuration to default
    @void
  ]]
  function Q1HUD:ResetConfig()
    for k, config in pairs(Q1HUD.DefaultConfig) do
      RunConsoleCommand(config.command, config.value);
    end
  end

  --[[
    Reset console command
  ]]
  concommand.Add("q1hud_reset", function(ply, com, args)
    Q1HUD:ResetConfig();
  end);

  --[[
    Menu options
  ]]
  local function menuComposition( panel )
  	panel:ClearControls();

    panel:AddControl( "CheckBox", {
  		Label = "Enabled",
  		Command = "q1hud_enabled",
  		}
  	);

    panel:AddControl( "Button", {
  		Label = "Reset settings to default",
  		Command = "q1hud_reset",
  		}
  	);

    -- Style
    panel:AddControl( "Label" , { Text = ""} );
    panel:AddControl( "Label" , { Text = "Style"} );
    panel:AddControl( "Slider", {
      Label = "HUD Scale",
      Type = "Float",
      Min = "0",
      Max = "10",
      Command = "q1hud_scale"}
    );

    panel:AddControl( "Slider", {
      Label = "Ammo display style",
      Type = "Integer",
      Min = "0",
      Max = "4",
      Command = "q1hud_ammostyle"}
    );

    local combobox, label = panel:ComboBox("Skin", "q1hud_skin");
    for skin, _ in pairs(Q1HUD:GetSkins()) do
  		combobox:AddChoice(skin);
    end

    -- Composition
    panel:AddControl( "Label" , { Text = ""} );
    panel:AddControl( "Label" , { Text = "Composition"} );

    panel:AddControl( "CheckBox", {
  		Label = "Inventory enabled",
  		Command = "q1hud_inventory_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Item pickup enabled",
  		Command = "q1hud_pickup_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Death screen enabled",
  		Command = "q1hud_deathscreen_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Damage effect enabled",
  		Command = "q1hud_damage_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Show scoreboard on death",
  		Command = "q1hud_scoreboardondeath_enabled",
  		}
  	);

    panel:AddControl( "CheckBox", {
  		Label = "Fake loading screen enabled",
  		Command = "q1hud_loadingscreen_enabled",
  		}
  	);

    panel:AddControl( "Button", {
  		Label = "Show loading screen",
  		Command = "q1hud_console_reset",
  		}
  	);

    -- Visibility
    panel:AddControl( "Label" , { Text = ""} );
    panel:AddControl( "Label" , { Text = "Visibility"} );
    panel:AddControl( "Slider", {
      Label = "Background alpha",
      Type = "Float",
      Min = "0",
      Max = "255",
      Command = "q1hud_backtile_alpha"}
    );

    panel:AddControl( "Slider", {
      Label = "Statusbar alpha",
      Type = "Float",
      Min = "0",
      Max = "255",
      Command = "q1hud_statusbar_alpha"}
    );

    -- Inventory
    panel:AddControl( "Label",  { Text = ""});
    panel:AddControl( "Label",  { Text = "Inventory"});

    -- Weapons
    for i=1, 12 do
      local combobox, label = panel:ComboBox("Weapon slot "..i, "q1hud_inventory_weapon_"..i);
      for class, name in pairs(Q1HUD:GetSelectableWeapons()) do
    		combobox:AddChoice(name, class);
      end
    end

    panel:AddControl( "Label",  { Text = ""});

    -- Ammo
    for i=1, 7 do
      local combobox, label = panel:ComboBox("Ammo slot "..i, "q1hud_inventory_ammo_"..i);
      for class, name in pairs(Q1HUD:GetSelectableAmmoTypes()) do
        combobox:AddChoice(name, class);
      end
    end

    -- Credits
    panel:AddControl( "Label",  { Text = ""});
  	panel:AddControl( "Label",  { Text = "Credits"});
    panel:AddControl( "Label",  { Text = "Main script: DyaMetR"});
    panel:AddControl( "Label",  { Text = "Textures from: id Software and DyaMetR"});
  end

  local function menuCreation()
  	spawnmenu.AddToolMenuOption( "Options", "DyaMetR", "Q1HUD", "Quake HUD", "", "", menuComposition );
  end
  hook.Add( "PopulateToolMenu", "q1hud_menu", menuCreation );

end
