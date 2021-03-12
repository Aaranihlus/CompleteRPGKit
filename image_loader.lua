function image_loader_init(e)

  -- The image used for the health bar
  healthSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\healthbar.png"))
  SetSpritePosition ( healthSprite , 1 , 95 )

  -- The image used for the armour bar
  staminaSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\sprintbar.png"))
  SetSpritePosition ( staminaSprite , 1 , 97 )

  -- The image used as the backdrop for each inventory slot
  inventorySlotSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\invslot.png"))
  SetSpritePosition(inventorySlotSprite, 200, 200)
  SetSpriteSize(inventorySlotSprite, 4, -1)
  SetSpriteDepth ( inventorySlotSprite, 3 )

  -- The image used when an inventory item is currently hovered over
  itemHoverPanel = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\itemHoverPanel.png"))
  SetSpritePosition( itemHoverPanel, 200, 200 )
  SetSpriteDepth ( itemHoverPanel, 0 )

  -- The image used for the conversation panel backdrop
  conversationSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\invslot.png"))
  SetSpriteSize ( conversationSprite, 50, 25 )
  SetSpritePosition ( conversationSprite, 200, 200 )

  characterLogSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\characterLogPanel.png"))
  SetSpriteSize ( characterLogSprite , 20 , 16 ) -- passing -1 as one of the params ensure the sprite retains its aspect ratio
  SetSpritePosition ( characterLogSprite , 200 , 200 )

  cursorSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\pointer2.png"))

  topMenuSprite = CreateSprite(LoadImage("scriptbank\\xanthir\\topbar.png"))
  SetSpriteSize ( topMenuSprite , 100 , 5 )

  mainMenuSprite = CreateSprite(LoadImage("scriptbank\\xanthir\\menubg.png"))
  SetSpriteSize ( mainMenuSprite , 100 , 95 )
  SetSpriteDepth ( mainMenuSprite, 100 )

  attributePanelSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\invslot_rounded.png"))
  SetSpritePosition(attributePanelSprite, 200, 200)
  SetSpriteSize(attributePanelSprite, 74, 60)
  SetSpriteDepth ( attributePanelSprite, 3 )
  --SetSpriteOffset ( attributePanelSprite , -0.5 , 0 )

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

  placeholderSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\placeholder64.png"))
  SetSpritePosition ( placeholderSprite , 200 , 200 )
  SetSpriteOffset ( placeholderSprite , 1.5 , 0 )

  dividerSprite = CreateSprite(LoadImage("scriptbank\\xanthir\\divider.png"))
  SetSpritePosition ( dividerSprite , 200 , 200 )
  SetSpriteSize ( dividerSprite , 90 , 0.2 )

  skillbgSprite = CreateSprite(LoadImage("scriptbank\\xanthir\\skillbg.png"))
  SetSpritePosition ( skillbgSprite , 200 , 200 )
  SetSpriteSize ( skillbgSprite , 11 , 17 )
  SetSpriteOffset ( skillbgSprite , 0.6 , 0 )

  tradeItemBgSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\traderItem.png"))
  SetSpriteSize ( tradeItemBgSprite, 23, 7 ) -- passing -1 as one of the params ensure the sprite retains its aspect ratio
  SetSpritePosition ( tradeItemBgSprite, 200, 200 )

  traderBgSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\tradeBackground.png"))
  SetSpriteSize ( traderBgSprite, 25, 100 ) -- passing -1 as one of the params ensure the sprite retains its aspect ratio
  SetSpritePosition ( traderBgSprite, 200, 200 )

  selectedTradeItemSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\selectedTradeItem.png"))
  SetSpriteSize ( selectedTradeItemSprite, 25, 25 ) -- passing -1 as one of the params ensure the sprite retains its aspect ratio
  SetSpritePosition ( selectedTradeItemSprite, 200, 200 )

end
