function menu_init(e)
  menus = {}
  menus[1] = { name = "Character", textPosX = 30 }
  menus[2] = { name = "Inventory", textPosX = 40 }
  menus[3] = { name = "Talents", textPosX = 50 }
  menus[4] = { name = "Journal", textPosX = 60 }
  menus[5] = { name = "Factions", textPosX = 70 }

  --LoadGlobalSound ("audiobank\\atmospheric\\woodhammer.wav" , 1)
  --LoopGlobalSound(1)
  --StopGlobalSound (1)

  LoadGlobalSound ("scriptbank\\CompleteRPGKit\\audio\\closeInventoryWAV.wav" , 1)
  LoadGlobalSound ("scriptbank\\CompleteRPGKit\\audio\\openInventoryWAV.wav" , 2)

  menuOpen = false -- Only show the menu is this is true
  menuSelected = 1 -- Show Character Menu by default, can be changed to corresponding menu to change default
  keyPressedQ = false -- Pressing the Q key, toggles the menuOpen variable between true/false
  openSoundPlayed = false
  closeSoundPlayed = true

  HideHuds()
end


function menu_main(e)

  if GetScancode() == 16 and not keyPressedQ then
		menuOpen = not menuOpen
		keyPressedQ = true
	elseif GetScancode() == 16 then
		keyPressedQ = true
	else
		keyPressedQ = false
	end




  if menuOpen == true then
    ActivateMouse()
    SetSpritePosition ( cursorSprite , g_MouseX , g_MouseY )
    --PasteSpritePosition ( topMenuSprite , 0 , 0 ) -- Top Panel
    --PasteSpritePosition ( mainMenuSprite , 0 , 5 ) -- Main Panel

    closeSoundPlayed = false

    if not openSoundPlayed then
      PlayGlobalSound(1)
      SetGlobalSoundVolume ( 1, 70 )
      openSoundPlayed = true
    end

    for k, v in pairs(menus) do
      if menuSelected == k then
        TextCenterOnXColor(v.textPosX, 1, 4, v.name, 255, 191, 63)
      else
        TextCenterOnX(v.textPosX, 1, 4, v.name)
      end

      if g_MouseX > v.textPosX - 5 and g_MouseX < v.textPosX + 5 and g_MouseY > 0 and g_MouseY < 5 then
        if g_MouseClick == 1 then
          g_MouseClick = 0
          menuSelected = k
        end
      end
    end

  else
    DeactivateMouse()
    SetSpritePosition ( cursorSprite , 200 , 200 )
    openSoundPlayed = false

    if not closeSoundPlayed then
      PlayGlobalSound(2)
      SetGlobalSoundVolume ( 2, 70 )
      closeSoundPlayed = true
    end

    --SetSpritePosition ( topMenuSprite , 200 , 200 )
    --SetSpritePosition ( mainMenuSprite , 200 , 200 )
  end

end
