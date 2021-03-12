-- Returns an array
function getItemData(id)
  for k, v in pairs(itemData) do
      if v.itemID == id then
        return v
      end
  end
end


function getItemSprite(id)
	for k, v in pairs(itemData) do
			if v.itemID == id then
				return v.itemSprite
			end
	end
end


function getItemName(id)
	for k, v in pairs(itemData) do
		if v.itemID == id then
			return v.itemName
		end
	end
end


function getMaxStack(id)
	for k, v in pairs(itemData) do
			if v.itemID == id then
				return v.maxStack
			end
	end
end


function CreateItemSprite ( item )
  v.itemSprite = CreateSprite(LoadImage(v.itemImagePath))
  SetSpritePosition(v.itemSprite, 200, 200)
  SetSpriteOffset(v.itemSprite, -0.4, -0.5)
  SetSpriteDepth ( v.itemSprite, 0 )
end


function useItem(quickslot)
	NewNotification("Used Quickslot: " .. quickslot)
end


function ShowQuickslots()
  quickslotX = 30
  for k, v in pairs(playerInventory.quickslots) do
    Text(quickslotX + 0.4, 95.5, 1, k .. ".")
    PasteSpritePosition(inventorySlotSprite, quickslotX, 94)

    if v.itemID ~= "" then
      thisQuickslotItem = getItemData(v.itemID)
      PasteSpritePosition(thisQuickslotItem.itemSprite, quickslotX, 94)
    end

    quickslotX = quickslotX + 4
  end
end


function givePlayerItem(itemID)
  for k, v in pairs(playerInventory) do
    if v.itemID == "" then
      v.itemID = itemID
      v.itemQty = 1
    break end
  end
end
