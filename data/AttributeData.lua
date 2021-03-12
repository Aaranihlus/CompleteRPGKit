charAttributes = {}

charAttributes[1] = {
  name = "Strength",
  value = 20,
  icon = ""
}

charAttributes[2] = {
  name = "Intelligence",
  value = 20,
  icon = ""
}

charAttributes[3] = {
  name = "Willpower",
  value = 20,
  icon = ""
}

charAttributes[4] = {
  name = "Agility",
  value = 20,
  icon = ""
}

charAttributes[5] = {
  name = "Speed",
  value = 20,
  icon = ""
}

charAttributes[6] = {
  name = "Endurance",
  value = 20,
  icon = ""
}

charAttributes[7] = {
  name = "Personality",
  value = 20,
  icon = ""
}

charAttributes[8] = {
  name = "Luck",
  value = 20,
  icon = ""
}

for k, v in pairs ( charAttributes ) do
  charAttributes[k].icon = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\" .. v.name .. "Icon.png"))
  SetSpritePosition(charAttributes[k].icon, 200, 200)
  SetSpriteSize(charAttributes[k].icon, 3, -1)
end

return charAttributes
