function rpg_core_init(e)
  LoadImages()
  mouseClicked = false
end


function rpg_core_main(e)

  if ( g_MouseClick == 0 ) then
    mouseClicked = false
  end

end







function LoadImages ()
  cursorSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\pointer2.png"))

  mouseOverOptionSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\background_round.png"))
  SetSpritePosition(mouseOverOptionSprite, 200, 200)
  SetSpriteSize(mouseOverOptionSprite, 26, 85)
  SetSpriteDepth (mouseOverOptionSprite, 3)

  step1Background = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\paperbg1border.png"))
  SetSpritePosition(step1Background, 200, 200)
  SetSpriteSize(step1Background, 100, 100)
  SetSpriteDepth (step1Background, 3)

  step2Background = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\paperbg2border.png"))
  SetSpritePosition(step2Background, 200, 200)
  SetSpriteSize(step2Background, 100, 100)
  SetSpriteDepth (step2Background, 3)

  step3Background = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\paperbg3.jpg"))
  SetSpritePosition(step3Background, 200, 200)
  SetSpriteSize(step3Background, 100, 100)
  SetSpriteDepth (step3Background, 3)

  plusSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\plusicon.png"))
  SetSpritePosition ( plusSprite , 200 , 200 )
  SetSpriteSize ( plusSprite , 1 , -1 )

  minusSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\minusicon.png"))
  SetSpritePosition ( minusSprite , 200 , 200 )
  SetSpriteSize ( minusSprite , 1 , -1 )

  plusSelectedSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\plusiconSelected.png"))
  SetSpritePosition ( plusSelectedSprite , 200 , 200 )
  SetSpriteSize ( plusSelectedSprite , 1 , -1 )

  minusSelectedSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\minusiconSelected.png"))
  SetSpritePosition ( minusSelectedSprite , 200 , 200 )
  SetSpriteSize ( minusSelectedSprite , 1 , -1 )

  healthSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\HealthIcon.png"))
  SetSpritePosition(healthSprite, 200, 200)
  SetSpriteSize(healthSprite, 3, -1)

  staminaSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\StaminaIcon.png"))
  SetSpritePosition(staminaSprite, 200, 200)
  SetSpriteSize(staminaSprite, 3, -1)

  manaSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\ManaIcon.png"))
  SetSpritePosition(manaSprite, 200, 200)
  SetSpriteSize(manaSprite, 3, -1)

  goldSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\GoldIcon.png"))
  SetSpritePosition(goldSprite, 200, 200)
  SetSpriteSize(goldSprite, 3, -1)
end
