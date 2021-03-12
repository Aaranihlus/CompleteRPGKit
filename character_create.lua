function character_create_init(e)

  classOptions = require("scriptbank\\CompleteRPGKit\\data\\ClassData")
  raceOptions = require("scriptbank\\CompleteRPGKit\\data\\RaceData")
  backgroundOptions = require("scriptbank\\CompleteRPGKit\\data\\BackgroundData")
  genderOptions = require("scriptbank\\CompleteRPGKit\\data\\GenderData")
  charAttributes = require("scriptbank\\CompleteRPGKit\\data\\AttributeData")
  charSkills = require("scriptbank\\CompleteRPGKit\\data\\SkillData")

  LoadGlobalSound("scriptbank\\CompleteRPGKit\\audio\\paperTurn.mp3" , 1)

  characterCreationActive = true
  characterCreationStage = 1

  charClass = ""
  charRace = ""
  charGender = ""
  charBackground = ""
  charString = ""
  lastChar = ""

  keyInput = false

  mouseOverOption = {
    type = "",
    name = ""
  }

  charNameArray = { "A", "d", "v", "e", "n", "t", "u", "r", "e", "r" }

  unspentAttributePoints = 20
  unspentSkillPoints = 0

end




function character_create_main(e)

  if ( characterCreationActive ) then

    FreezePlayer()
    TextCenterOnXColor(50, 4, 3, "Character Creation")
    HideHuds()
    ActivateMouse()
    SetSpritePosition ( cursorSprite , g_MouseX , g_MouseY )

    mouseOverOption.type = ""
    mouseOverOption.name = ""

    if ( mouseOverOption.type == "" ) then
      SetSpritePosition(mouseOverOptionSprite, 200, 200)
    end

    if ( characterCreationStage == 1 ) then

      PasteSpritePosition ( step1Background, 0, 0 )

      TextCenterOnXColor(10, 13, 3, "Name: ")
      Panel( 13, 10, 50, 15 )
      TextCenterOnX(32, 13, 3, table.concat( charNameArray ) )

      if GetScancode() > 0 and not keyInput then
        ScanCodeToLetter( GetScancode() )
        keyInput = true
      elseif GetScancode() > 0 then
        keyInput = true
      else
        keyInput = false
      end

      -- Race Options
      TextColor(10, 22, 3, "Race: ")
      raceY = 26
      for k, v in pairs ( raceOptions ) do
        if ( charRace == v.raceName ) then
          TextColor(10, raceY, 3, v.raceName, 43, 255, 0)
        elseif ( g_MouseX > 10 and g_MouseX < 15 and g_MouseY > raceY - 1 and g_MouseY < raceY + 1 ) then
          TextColor(10, raceY, 3, v.raceName, 255, 0, 0)
          mouseOverOption.type = "race"
          mouseOverOption.name = v.raceName
          ShowMouseOverPanel()
          if( g_MouseClick == 1 and not mouseClicked ) then
            charRace = v.raceName
          end
        else
          TextColor(10, raceY, 3, v.raceName)
        end
        raceY = raceY + 4
      end


      -- Class Options
      TextColor(20, 22, 3, "Class: ")
      raceY = 26
      for k, v in pairs ( classOptions ) do
        if ( charClass == v.className ) then
          TextColor(20, raceY, 3, v.className, 43, 255, 0)
        elseif ( g_MouseX > 20 and g_MouseX < 25 and g_MouseY > raceY - 1 and g_MouseY < raceY + 1 ) then
          TextColor(20, raceY, 3, v.className, 255, 0, 0)
          mouseOverOption.type = "class"
          mouseOverOption.name = v.className
          ShowMouseOverPanel()
          if( g_MouseClick == 1 and not mouseClicked ) then
            charClass = v.className
          end
        else
          TextColor(20, raceY, 3, v.className)
        end
        raceY = raceY + 4
      end


      -- Background Options
      TextColor(30, 22, 3, "Background: ")
      raceY = 26
      for k, v in pairs ( backgroundOptions ) do
        if ( charBackground == v.backgroundName ) then
          TextColor(30, raceY, 3, v.backgroundName, 43, 255, 0)
        elseif ( g_MouseX > 30 and g_MouseX < 35 and g_MouseY > raceY - 1 and g_MouseY < raceY + 1 ) then
          TextColor(30, raceY, 3, v.backgroundName, 255, 0, 0)
          mouseOverOption.type = "background"
          mouseOverOption.name = v.backgroundName
          ShowMouseOverPanel()
          if( g_MouseClick == 1 and not mouseClicked ) then
            charBackground = v.backgroundName
          end
        else
          TextColor(30, raceY, 3, v.backgroundName)
        end
        raceY = raceY + 4
      end


      -- Gender Options
      TextColor(42, 22, 3, "Gender: ")
      raceY = 26
      for k, v in pairs ( genderOptions ) do
        if ( charGender == v ) then
          TextColor(42, raceY, 3, v, 43, 255, 0)
        elseif ( g_MouseX > 40 and g_MouseX < 45 and g_MouseY > raceY - 1 and g_MouseY < raceY + 1 ) then
          TextColor(42, raceY, 3, v, 255, 0, 0)
          if( g_MouseClick == 1 and not mouseClicked ) then
            charGender = v
          end
        else
          TextColor(42, raceY, 3, v)
        end
        raceY = raceY + 4
      end



      --charString = ""
      --if ( charGender ~= '' ) then charString = charString .. charGender .. " " end
      --if ( charRace ~= '' ) then charString = charString .. charRace .. " " end
      --if ( charClass ~= '' ) then charString = charString .. charClass .. " " end
      --if ( charBackground ~= '' ) then charString = charString .. " from a " .. charBackground .. " background" end
      --TextColor(5, 70, 4, "Your Character: " .. charString)

      TextColor(8, 70, 4, "Total Bonuses: ")

      -- Stage One Continue Button
      if ( charGender ~= "" and charRace ~= "" and charClass ~= "" and charBackground ~= "" ) then
        if g_MouseX > 45 and g_MouseX < 55 and g_MouseY > 95 and g_MouseY < 97 then
          TextCenterOnXColor(50, 95, 4, "Continue", 76, 207, 0)
          if( g_MouseClick == 1 and not mouseClicked ) then
            mouseClicked = true
            characterCreationStage = 2
            mouseOverOption.type = ""
            mouseOverOption.name = ""
            unspentSkillPoints = 40 + ( skillPointIntelBonus * charAttributes[2].value )
            PlayGlobalSound( 1 )
          end
        else
          TextCenterOnXColor(50, 95, 4, "Continue")
        end
      else
        TextCenterOnXColor(50, 95, 4, "Select a gender, race, class and background to continue")
      end

    end




    if ( characterCreationStage == 2 ) then

      PasteSpritePosition ( step2Background, 0, 0 )

      TextCenterOnXColor(19, 7, 3, "Starting Stats")

      PasteSpritePosition ( healthSprite, 5, 10 )
      TextColor( 9, 13, 3, "Health: 100" )

      PasteSpritePosition ( staminaSprite, 21, 10 )
      TextColor( 25, 13, 3, "Stamina: 100" )

      PasteSpritePosition ( manaSprite, 5, 20 )
      TextColor( 9, 23, 3, "Mana: 100" )

      PasteSpritePosition ( goldSprite, 21, 20 )
      TextColor( 25, 23, 3, "Gold: 20" )

      TextCenterOnXColor(19, 40, 3, "Attribute Points: " .. unspentAttributePoints )

      attributeX = 14
      attributeY = 44
      for k, v in pairs ( charAttributes ) do

        TextCenterOnXColor( attributeX, attributeY, 3, v.name )
        TextCenterOnXColor( attributeX, attributeY + 4, 3, v.value )
        PasteSpritePosition ( minusSprite, attributeX - 3, attributeY + 3 )
        PasteSpritePosition ( plusSprite,  attributeX + 2, attributeY + 3 )
        PasteSpritePosition ( v.icon, attributeX - 8, attributeY - 1 )

        if g_MouseX > attributeX - 4 and g_MouseX < attributeX - 2 and g_MouseY > attributeY + 3 and g_MouseY < attributeY + 5 then
          PasteSpritePosition ( minusSelectedSprite, attributeX - 3, attributeY + 3 )
          if( g_MouseClick == 1 and not mouseClicked ) then DecreaseAttribute(v.name) end
        end

        if g_MouseX > attributeX + 2 and g_MouseX < attributeX + 4 and g_MouseY > attributeY + 3 and g_MouseY < attributeY + 5 then
          PasteSpritePosition ( plusSelectedSprite, attributeX + 2, attributeY + 3 )
          if( g_MouseClick == 1 and not mouseClicked ) then IncreaseAttribute(v.name) end
        end

        if k % 2 == 0 then
          attributeY = attributeY + 12
          attributeX = 14
        else
          attributeX = attributeX + 15
        end

      end




      skillX = 50
      skillY = 11
      for k, v in pairs ( charSkills ) do

        TextCenterOnXColor( skillX, skillY, 3, v.name )
        TextCenterOnXColor( skillX, skillY + 4, 3, v.value )
        PasteSpritePosition ( minusSprite, skillX - 3, skillY + 3 )
        PasteSpritePosition ( plusSprite,  skillX + 2, skillY + 3 )
        PasteSpritePosition ( v.icon, skillX - 8, skillY - 1 )

        if g_MouseX > skillX - 4 and g_MouseX < skillX - 2 and g_MouseY > skillY + 3 and g_MouseY < skillY + 5 then
          PasteSpritePosition ( minusSelectedSprite, skillX - 3, skillY + 3 )
          if( g_MouseClick == 1 and not mouseClicked ) then DecreaseSkill(v.name) end
        end

        if g_MouseX > skillX + 2 and g_MouseX < skillX + 4 and g_MouseY > skillY + 3 and g_MouseY < skillY + 5 then
          PasteSpritePosition ( plusSelectedSprite, skillX + 2, skillY + 3 )
          if( g_MouseClick == 1 and not mouseClicked ) then IncreaseSkill(v.name) end
        end

        if k % 8 == 0 then
          skillX = skillX + 18
          skillY = 11
        else
          skillY = skillY + 10
        end

      end


      -- Stage Two Back Button
      if g_MouseX > 41 and g_MouseX < 49 and g_MouseY > 95 and g_MouseY < 97 then
        TextCenterOnXColor(45, 95, 4, "Back", 76, 207, 0)
        if( g_MouseClick == 1 and not mouseClicked ) then
          mouseClicked = true
          characterCreationStage = 1
          PlayGlobalSound( 1 )
        end
      else
        TextCenterOnXColor(45, 95, 4, "Back")
      end

      -- Stage Two Continue Button
      if g_MouseX > 51 and g_MouseX < 59 and g_MouseY > 95 and g_MouseY < 97 then
        TextCenterOnXColor(55, 95, 4, "Continue", 76, 207, 0)
        if( g_MouseClick == 1 and not mouseClicked ) then
          mouseClicked = true
          characterCreationStage = 3
          PlayGlobalSound( 1 )
        end
      else
        TextCenterOnXColor(55, 95, 4, "Continue")
      end

    end



    if ( characterCreationStage == 3 ) then

      if g_MouseX > 40 and g_MouseX < 45 and g_MouseY > 83 and g_MouseY < 87 then
        TextColor(40, 85, 4, "Back", 255, 191, 63)
        if( g_MouseClick == 1 and not mouseClicked ) then
          mouseClicked = true
          characterCreationStage = 2
        end
      else
        Text(40, 85, 4, "Back")
      end

      if g_MouseX > 60 and g_MouseX < 65 and g_MouseY > 83 and g_MouseY < 87 then
        TextColor(60, 85, 4, "Finish", 255, 191, 63)
        if( g_MouseClick == 1 and not mouseClicked ) then
          mouseClicked = true
          characterCreationActive = false
          characterCreationStage = 0
          DeactivateMouse()
          SetSpritePosition ( cursorSprite , 200 , 200 )
        end
      else
        Text(60, 85, 4, "Finish")
      end

    end

    if ( characterCreationStage == 4 ) then
      characterCreated = true
      characterCreationActive = false

    end


  else

    UnFreezePlayer()
    DeactivateMouse()

  end -- End Character Creation Active

end -- End Main Script





function ScanCodeToLetter ( scanCode )

  scanCodesToLetters = {}
  scanCodesToLetters[16] = "q"
  scanCodesToLetters[17] = "w"
  scanCodesToLetters[18] = "e"
  scanCodesToLetters[19] = "r"
  scanCodesToLetters[20] = "t"
  scanCodesToLetters[21] = "y"
  scanCodesToLetters[22] = "u"
  scanCodesToLetters[23] = "i"
  scanCodesToLetters[24] = "o"
  scanCodesToLetters[25] = "p"
  scanCodesToLetters[30] = "a"
  scanCodesToLetters[31] = "s"
  scanCodesToLetters[32] = "d"
  scanCodesToLetters[33] = "f"
  scanCodesToLetters[34] = "g"
  scanCodesToLetters[35] = "h"
  scanCodesToLetters[36] = "j"
  scanCodesToLetters[37] = "k"
  scanCodesToLetters[38] = "l"
  scanCodesToLetters[44] = "z"
  scanCodesToLetters[45] = "x"
  scanCodesToLetters[46] = "c"
  scanCodesToLetters[47] = "v"
  scanCodesToLetters[48] = "b"
  scanCodesToLetters[49] = "n"
  scanCodesToLetters[50] = "m"
  scanCodesToLetters[57] = " "

  if ( scanCode == 14 ) then
    table.remove(charNameArray)
  end

  for k, v in pairs( scanCodesToLetters ) do
    if ( k == scanCode ) then
      if ( #charNameArray == 0 or lastChar == " " ) then
        table.insert(charNameArray, string.upper(v) )
        lastChar = v
      else
        table.insert(charNameArray, v )
        lastChar = v
      end
    end
  end

end


function getRaceByName ( name )
  for k, v in pairs ( raceOptions ) do
    if ( v.raceName == name ) then
      return v
    end
  end
end

function getClassByName ( name )
  for k, v in pairs ( classOptions ) do
    if ( v.className == name ) then
      return v
    end
  end
end

function getBackgroundByName ( name )
  for k, v in pairs ( backgroundOptions ) do
    if ( v.backgroundName == name ) then
      return v
    end
  end
end


function ShowMouseOverPanel ()

  if ( mouseOverOption.type ~= "" ) then

    TextCenterOnX(85, 13, 3, mouseOverOption.name)

    if ( mouseOverOption.type == "race" ) then
      raceOptionData = getRaceByName( mouseOverOption.name )
      raceDataY = 17

      for k, v in pairs ( raceOptionData.raceDescription ) do
        TextCenterOnX(85, raceDataY, 3, v)
        raceDataY = raceDataY + 3
      end

      raceDataY = raceDataY + 4
      TextCenterOnX(85, raceDataY, 3, "Bonus Attributes")
      raceDataY = raceDataY + 3
      for k, v in pairs ( raceOptionData.raceBonusAttributes ) do
        TextCenterOnX(85, raceDataY, 3, v.name .. " +" .. v.value )
        raceDataY = raceDataY + 3
      end

      raceDataY = raceDataY + 4
      TextCenterOnX(85, raceDataY, 3, "Bonus Skills")
      raceDataY = raceDataY + 3
      for k, v in pairs ( raceOptionData.raceBonusSkills ) do
        TextCenterOnX(85, raceDataY, 3, v.name .. " +" .. v.value )
        raceDataY = raceDataY + 3
      end
    end


    if ( mouseOverOption.type == "class" ) then
      classOptionData = getClassByName( mouseOverOption.name )
      classDataY = 17

      for k, v in pairs ( classOptionData.classDescription ) do
        TextCenterOnX(85, classDataY, 3, v)
        classDataY = classDataY + 3
      end

      classDataY = classDataY + 4
      TextCenterOnX(85, classDataY, 3, "Bonus Skills")
      classDataY = classDataY + 3
      for k, v in pairs ( classOptionData.classBonusSkills ) do
        TextCenterOnX(85, classDataY, 3, v.name .. " +" .. v.value )
        classDataY = classDataY + 3
      end

      classDataY = classDataY + 4
      TextCenterOnX(85, classDataY, 3, "Bonus Starting Equipment")
      classDataY = classDataY + 3
      for k, v in pairs ( classOptionData.classStartingEquipment ) do
        TextCenterOnX(85, classDataY, 3, v.name )
        classDataY = classDataY + 3
      end
    end


    if ( mouseOverOption.type == "background" ) then
      backgroundOptionData = getBackgroundByName( mouseOverOption.name )
      backgroundDataY = 17

      for k, v in pairs ( backgroundOptionData.backgroundDescription ) do
        TextCenterOnX(85, backgroundDataY, 3, v)
        backgroundDataY = backgroundDataY + 3
      end

      backgroundDataY = backgroundDataY + 4
      TextCenterOnX(85, backgroundDataY, 3, "Bonus Skills")
      backgroundDataY = backgroundDataY + 3
      for k, v in pairs ( backgroundOptionData.backgroundBonusSkills ) do
        TextCenterOnX(85, backgroundDataY, 3, v.name .. " +" .. v.value )
        backgroundDataY = backgroundDataY + 3
      end

      backgroundDataY = backgroundDataY + 4
      TextCenterOnX(85, backgroundDataY, 3, "Bonus Starting Equipment")
      backgroundDataY = backgroundDataY + 3
      for k, v in pairs ( backgroundOptionData.backgroundStartingEquipment ) do
        TextCenterOnX(85, backgroundDataY, 3, v.name )
        backgroundDataY = backgroundDataY + 3
      end

      backgroundDataY = backgroundDataY + 3
      TextCenterOnX(85, backgroundDataY, 3, "Bonus Starting Gold: " .. backgroundOptionData.backgroundBonusStartingGold )
    end

  end

  PasteSpritePosition(mouseOverOptionSprite, 72, 10)

end




function IncreaseAttribute ( attribute )
  mouseClicked = true
  if ( unspentAttributePoints > 0 ) then
    for k, v in pairs ( charAttributes ) do
      if attribute == v.name then
        charAttributes[k].value = charAttributes[k].value + 1
        unspentAttributePoints = unspentAttributePoints - 1
      end
    end
  end
end


function DecreaseAttribute ( attribute )
  mouseClicked = true
  if ( unspentAttributePoints > 0 ) then
    for k, v in pairs ( charAttributes ) do
      if attribute == v.name then
        charAttributes[k].value = charAttributes[k].value - 1
        unspentAttributePoints = unspentAttributePoints + 1
      end
    end
  end
end


function IncreaseSkill ( skill )
  mouseClicked = true
  if ( unspentSkillPoints > 0 ) then
    for k, v in pairs ( charSkills ) do
      if skill == v.name then
        charSkills[k].value = charSkills[k].value + 1
        unspentSkillPoints = unspentSkillPoints - 1
      end
    end
  end
end


function DecreaseSkill ( skill )
  mouseClicked = true
  if ( unspentSkillPoints > 0 ) then
    for k, v in pairs ( charSkills ) do
      if skill == v.name then
        charSkills[k].value = charSkills[k].value - 1
        unspentSkillPoints = unspentSkillPoints + 1
      end
    end
  end
end
