function talents_init(e)

  charTalents = require("scriptbank\\CompleteRPGKit\\data\\talent_data")

  talentPoints = 0

  --Sub Menu's
  talentMenus = {}
  talentMenus[1] = { name = "Strength", textPosX = 20, thisTableName = "strengthTalents" }
  talentMenus[2] = { name = "Perception", textPosX = 30, thisTableName = "perceptionTalents" }
  talentMenus[3] = { name = "Endurance", textPosX = 40, thisTableName = "enduranceTalents" }
  talentMenus[4] = { name = "Charisma", textPosX = 50, thisTableName = "charismaTalents" }
  talentMenus[5] = { name = "Intelligence", textPosX = 60, thisTableName = "intelligenceTalents" }
  talentMenus[6] = { name = "Agility", textPosX = 70, thisTableName = "agilityTalents" }
  talentMenus[7] = { name = "Luck", textPosX = 80, thisTableName = "luckTalents" }

  talentSelected = 1
  tableName = "strengthTalents"
end


function talents_main(e)

  if menuSelected == 3 and menuOpen == true then

    --Text(1, 7, 4, "Unspent Talent Points: " .. talentPoints)

    for k, v in pairs(talentMenus) do
      if talentSelected == k then
        TextCenterOnXColor(v.textPosX, 7, 4, v.name, 255, 191, 63)
      else
        TextCenterOnX(v.textPosX, 7, 4, v.name)
      end

      if g_MouseX > v.textPosX - 5 and g_MouseX < v.textPosX + 5 and g_MouseY > 8 and g_MouseY < 10 then
        if g_MouseClick == 1 then
          talentSelected = k
          tableName = v.thisTableName
        end
      end
    end

    Text(5, 21, 3, "Tier 1")
    PasteSpritePosition ( dividerSprite , 5 , 31 )
    Text(5, 44, 3, "Tier 2")
    PasteSpritePosition ( dividerSprite , 5 , 56 )
    Text(5, 67, 3, "Tier 3")

    for k, v in pairs(charTalents[tableName]) do
      TextCenterOnX(v.textPosX, v.textPosY, 3, v.name) -- Skill Name
      TextCenterOnX(v.textPosX + 0.2, v.textPosY + 12, 3, v.points .. " / " .. v.max) -- Points invested in this skill
      PasteSpritePosition ( skillbgSprite , v.textPosX - 5, v.textPosY - 2 ) -- Background sprite

      PasteSpritePosition ( placeholderSprite , v.textPosX, v.textPosY + 3 ) -- Skill Icon

      if g_MouseX > v.textPosX - 6 and g_MouseX < v.textPosX + 5 and g_MouseY > v.textPosY - 2 and g_MouseY < v.textPosY + 13 then
        Panel(g_MouseX + 2, g_MouseY + 2, g_MouseX + 10, g_MouseY + 10)
        Text(g_MouseX + 3, g_MouseY + 4, 3, v.desc)
      end

      if talentPoints > 0 then
        PasteSpritePosition ( minusSprite , v.textPosX - 4 , v.textPosY + 11 ) -- Add Point icon
        PasteSpritePosition ( plusSprite , v.textPosX + 2 , v.textPosY + 11 ) -- Remove Point icon
      end

    end
  end
end
