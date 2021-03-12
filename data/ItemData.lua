itemData = {}

weaponData = require("scriptbank\\CompleteRPGKit\\data\\WeaponData")
armourData = require("scriptbank\\CompleteRPGKit\\data\\ArmourData")
potionData = require("scriptbank\\CompleteRPGKit\\data\\PotionData")
clothingData = require("scriptbank\\CompleteRPGKit\\data\\ClothingData")
toolData = require("scriptbank\\CompleteRPGKit\\data\\ToolData")
reagentData = require("scriptbank\\CompleteRPGKit\\data\\ReagentData")

dataArrays = { weaponData, armourData, potionData, clothingData, toolData, reagentData }

for key, array in pairs( dataArrays ) do
  for k, v in pairs( array ) do
    table.insert(itemData, v)
  end
end

-- Create item sprites
-- For each item in the itemData array (from ItemData.lua), will create a sprite for each item based on "itemImagePath"
for k, v in pairs(itemData) do

  if ( v.itemImagePath ~= "" ) then
    v.itemSprite = CreateSprite(LoadImage(v.itemImagePath))
  else
    v.itemSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\placeholder64.png"))
  end

  SetSpritePosition(v.itemSprite, 200, 200)
  SetSpriteOffset(v.itemSprite, -0.4, -0.5)
  SetSpriteDepth (v.itemSprite, 10)
end

return itemData
