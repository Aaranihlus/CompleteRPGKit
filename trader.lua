local traderNPCs = {}

function getTraderItemPrice(id)
  for k, v in pairs(traders[thisTrader].traderItems) do
    if v.itemID == id then
      return v.itemBasePrice
    end
  end
end

function trader_init(e)

  traderNPCs[e] = e
  traders = {}
  traders[128] = { traderItems = {}, traderMoney = 750, traderName = "Iain" }
  traders[128].traderItems[1] = { itemID = "med_fak", itemQty = 5, itemBasePrice = 100 }
  traders[128].traderItems[2] = { itemID = "f_chips", itemQty = 11, itemBasePrice = 25 }
  traders[128].traderItems[3] = { itemID = "d_milk", itemQty = 8, itemBasePrice = 35 }
  traders[128].traderItems[4] = { itemID = "a_38ammo", itemQty = 120, itemBasePrice = 4 }
  traders[128].traderItems[5] = { itemID = "w_1911", itemQty = 2, itemBasePrice = 300 }

  playerTrading = false
  selectedTradeItem = { itemID = "", itemOwner = "" }

  traderPage = 1
  playerPage = 1

  tradeQuantity = 0
  tradeTotal = 0
end





function trader_main(e)

  traderEndPoint = traderPage * 10
  traderStartPoint = traderEndPoint - 9

  -- If trader is in range, show text
  if GetPlayerDistance(e) < 80 then
    thisTrader = traderNPCs[e]

    if not playerTrading then
      TextCenterOnX(50, 75, 3, "Press E to trade")
    end

    if GetScancode() == 18 and not keyPressedE then
      playerTrading = not playerTrading
      keyPressedE = true
    elseif GetScancode() == 18 then
      keyPressedE = true
    else
      keyPressedE = false
    end

  end



  -- If player is trading, show UI
  if playerTrading and GetPlayerDistance(traderNPCs[e]) < 80 then -- Trading Loop

    traderItemCount = #traders[thisTrader].traderItems
    playerItemCount = #playerInventory

    ActivateMouse()
    RotateToPlayer(e)
    SetSpritePosition ( cursorSprite, g_MouseX, g_MouseY )

    -- If an Item is selected
    if selectedTradeItem.itemID ~= "" then

      if selectedTradeItem.itemOwner == "Trader" then
        TextCenterOnX(50, 67, 3, "Buy Item")
      else
        TextCenterOnX(50, 67, 3, "Sell Item")
      end

      thisItemName = getItemName(selectedTradeItem.itemID)
      TextCenterOnX(50, 72, 3, thisItemName)
      thisItemPrice = getTraderItemPrice(selectedTradeItem.itemID)
      TextCenterOnX(50, 80, 3, "Price: " .. thisItemPrice)
      TextCenterOnX(50, 84, 3, "Quantity: " .. tradeQuantity)

      -- If Confirm button is clicked
      if g_MouseX > 45 and g_MouseX < 55 and g_MouseY > 87 and g_MouseY < 89 then
        TextCenterOnXColor(50, 88, 3, "Confirm", 255, 191, 63)

        if g_MouseClick == 1 and not mouseClicked then
          mouseClicked = true
          TextCenterOnX(50, 50, 3, "Trade Confirmed")
        elseif g_MouseClick == 1 then
          mouseClicked = true
        else
          mouseClicked = false
        end

      else
        TextCenterOnX(50, 88, 3, "Confirm")
      end

      PasteSpritePosition ( selectedTradeItemSprite, 38, 65 )

      -- If Plus is clicked
      if g_MouseX > 43 and g_MouseX < 46 and g_MouseY > 83 and g_MouseY < 86 then
        PasteSpritePosition ( minusSelectedSprite, 43, 83 )
        if g_MouseClick == 1 and not mouseClicked then
          mouseClicked = true
          if tradeQuantity > 0 then
            tradeQuantity = tradeQuantity - 1
          end
        elseif g_MouseClick == 1 then
          mouseClicked = true
        else
          mouseClicked = false
        end
      else
        PasteSpritePosition ( minusSprite, 43, 83 )
      end

      -- If Minus is clicked
      if g_MouseX > 55 and g_MouseX < 58 and g_MouseY > 83 and g_MouseY < 86 then
        PasteSpritePosition ( plusSelectedSprite, 55, 83 )
        if g_MouseClick == 1 and not mouseClicked then
          mouseClicked = true
          tradeQuantity = tradeQuantity + 1
        elseif g_MouseClick == 1 then
          mouseClicked = true
        else
          mouseClicked = false
        end
      else
        PasteSpritePosition ( plusSprite, 55, 83 )
      end


    else
      PasteSpritePosition ( selectedTradeItemSprite, 200, 200 )
    end












    --Player Items
    TextCenterOnX(13, 5, 3, "Your Items")
    TextCenterOnX(13, 9, 3, "Your Money: " .. curMoney)
    PasteSpritePosition(traderBgSprite, 0, 0)

    y = 14
    for i = 1, 10 do
      v = playerInventory[i]
      if v.itemID ~= "" then

        PasteSpritePosition(tradeItemBgSprite, 1, y)

        thisItemSprite = getItemSprite(v.itemID)

        PasteSpritePosition(thisItemSprite, 1, y)

        if g_MouseX > 13 and g_MouseX < 25 and g_MouseY > y - 2 and g_MouseY < y + 1 then
          TextColor(13, y, 3, v.itemID .. " x" .. v.itemQty, 255, 191, 63)
          if g_MouseClick == 1 then
            selectedTradeItem.itemID = v.itemID
            selectedTradeItem.itemOwner = "Player"
          end
        else
          Text(13, y, 3, v.itemID .. " x" .. v.itemQty)
        end

      end
      y = y + 8
    end

    --Trader Items
    TextCenterOnX(88, 5, 3, "Trader Items")
    TextCenterOnX(88, 9, 3, "Trader Money: " .. traders[traderNPCs[e]].traderMoney)
    PasteSpritePosition(traderBgSprite, 75, 0)
    y = 14

    for i = traderStartPoint, traderEndPoint do
      if traders[thisTrader].traderItems[i] then
        v = traders[thisTrader].traderItems[i]

        PasteSpritePosition(tradeItemBgSprite, 76, y)

        thisItemSprite = getItemSprite(v.itemID)
        PasteSpritePosition(thisItemSprite, 76, y)

        thisItemName = getItemName(v.itemID)

        if g_MouseX > 75 and g_MouseX < 100 and g_MouseY > y and g_MouseY < y + 7 then
          TextColor(80, y + 4, 3, thisItemName .. " x" .. v.itemQty .. " Price: " .. v.itemBasePrice, 255, 191, 63)
          if g_MouseClick == 1 then
            selectedTradeItem.itemID = v.itemID
            selectedTradeItem.itemOwner = "Trader"
          end
        else
          Text(80, y + 4, 3, thisItemName .. " x" .. v.itemQty .. " Price: " .. v.itemBasePrice)
        end

        y = y + 8
      end
    end




    if traderItemCount > 10 then
      if g_MouseX > 75 and g_MouseX < 85 and g_MouseY > 95 and g_MouseY < 98 then
        TextCenterOnXColor(80, 96, 3, "Prev Page", 255, 191, 63)

        if g_MouseClick == 1 and not mouseClicked then
          mouseClicked = true
          if traderPage > 0 then
            traderPage = traderPage - 1
          end
        elseif g_MouseClick == 1 then
          mouseClicked = true
        else
          mouseClicked = false
        end

      else
        TextCenterOnX(80, 96, 3, "Prev Page")
      end

      if g_MouseX > 90 and g_MouseX < 100 and g_MouseY > 95 and g_MouseY < 98 then
        TextCenterOnXColor(95, 96, 3, "Next Page", 255, 191, 63)

        if g_MouseClick == 1 and not mouseClicked then
          mouseClicked = true
          traderPage = traderPage + 1
        elseif g_MouseClick == 1 then
          mouseClicked = true
        else
          mouseClicked = false
        end

      else
        TextCenterOnX(95, 96, 3, "Next Page")
      end
    end


    if playerItemCount > 10 then
      TextCenterOnX(10, 96, 3, "Prev Page")
      TextCenterOnX(20, 96, 3, "Next Page")
    end


  end -- End Trading Loop


end
