reagentData = {}

reagentData[0] = {
  itemID = "r_iron_ore",
  itemName = "Iron Ore",
  itemImagePath = "",
  itemSprite = "",
  itemDesc = "",
  itemType = "reagent",
  harvestType = "mining",
  itemWeight = 1
}

reagentData[1] = {
  itemID = "r_bitterweed_petals",
  itemName = "Bitterweed Petals",
  itemImagePath = "scriptbank\\CompleteRPGKit\\ui\\bitterweed.bmp",
  itemSprite = "",
  itemDesc = "",
  itemStackable = true,
  itemType = "reagent",
  harvestType = "herbalism",
  alchemyProperties = {
    "restore_health",
    "restore_stamina"
  },
  itemWeight = 0.1
}

reagentData[2] = {
  itemID = "r_reddrake_wort",
  itemName = "Crimson Drake Wort",
  itemImagePath = "scriptbank\\CompleteRPGKit\\ui\\reddrake_wort.bmp",
  itemSprite = "",
  itemDesc = "",
  itemStackable = true,
  itemType = "reagent",
  harvestType = "herbalism",
  alchemyProperties = {
    "night_sight",
    "restore_stamina"
  },
  itemWeight = 0.1
}

reagentData[3] = {
  itemID = "r_stennis_root",
  itemName = "Stennis Root",
  itemImagePath = "scriptbank\\CompleteRPGKit\\ui\\stennis_root.bmp",
  itemSprite = "",
  itemDesc = "",
  itemStackable = true,
  itemType = "reagent",
  harvestType = "herbalism",
  alchemyProperties = {
    "restore_health",
    "night_sight"
  },
  itemWeight = 0.1
}

reagentData[4] = {
  itemID = "r_bright_stone",
  itemName = "Bright Stone",
  itemImagePath = "",
  itemSprite = "",
  itemDesc = "",
  itemType = "reagent",
  harvestType = "mining",
  itemWeight = 0.3
}

return reagentData
