local craftingOpen = false
local keyPressedE = false

function crafting_init(e)
end

function crafting_main(e)

  if GetPlayerDistance(e) < 65 then
    if GetScancode() == 18 and not keyPressedE then
      craftingOpen = not craftingOpen
      keyPressedE = true
    elseif GetScancode() == 18 then
      keyPressedE = true
    else
      keyPressedE = false
    end
  end

  if craftingOpen == true then

    Panel(50, 50, 75, 75)

    for k, v in mPairs(playerInventory, playerQuickslots) do
      thisItem = getItemData(v.itemID)
      if thisItem.itemType == "material" then
        --print names
      end
    end


  end





end
