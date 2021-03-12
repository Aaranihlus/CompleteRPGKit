charSkills = {}

charSkills[1] = { name = "Blade", value = 5, icon = "" }
charSkills[2] = { name = "Axe", value = 5, icon = "" }
charSkills[3] = { name = "Mace", value = 5, icon = "" }
charSkills[4] = { name = "Bow", value = 5, icon = "" }
charSkills[5] = { name = "Destruction", value = 5, icon = "" }
charSkills[6] = { name = "Restoration", value = 5, icon = "" }
charSkills[7] = { name = "Alteration", value = 5, icon = "" }
charSkills[8] = { name = "Illusion", value = 5, icon = "" }
charSkills[9] = { name = "Parry", value = 5, icon = "" }
charSkills[10] = { name = "Block", value = 5, icon = "" }
charSkills[11] = { name = "Heavy-Armour", value = 5, icon = "" }
charSkills[12] = { name = "Light-Armour", value = 5, icon = "" }
charSkills[13] = { name = "Athletics", value = 5, icon = "" }
charSkills[14] = { name = "Acrobatics", value = 5, icon = "" }
charSkills[15] = { name = "Stealth", value = 5, icon = "" }
charSkills[16] = { name = "Speech", value = 5, icon = "" }
charSkills[17] = { name = "Barter", value = 5, icon = "" }
charSkills[18] = { name = "Smithing", value = 5, icon = "" }
charSkills[19] = { name = "Lockpicking", value = 5, icon = "" }
charSkills[20] = { name = "Mining", value = 5, icon = "" }
charSkills[21] = { name = "Alchemy", value = 5, icon = "" }
charSkills[22] = { name = "Herbalism", value = 5, icon = "" }
charSkills[23] = { name = "Enchanting", value = 5, icon = "" }
charSkills[24] = { name = "Hunting", value = 5, icon = "" }

for k, v in pairs ( charSkills ) do
  charSkills[k].icon = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\" .. v.name .. "Icon.png"))
  SetSpritePosition(charSkills[k].icon, 200, 200)
  SetSpriteSize(charSkills[k].icon, 3, -1)
end

return charSkills
