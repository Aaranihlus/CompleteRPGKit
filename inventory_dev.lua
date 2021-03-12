function inventory_dev_init(e)

	itemData = require("scriptbank\\CompleteRPGKit\\item_data")

	mouseOverSlot = { k = 0, tableName = "", itemID = "", itemQty = 0, lootContainerID = 0 }
	heldItem = { k = 0, tableName = "", itemID = "", itemQty = 0, lootContainerID = 0 }

	playerInventory = {}
	playerQuickslots = {}
	playerEquipment = {}
	numberOfSlots = 30

	itemUsed = false

	-- Set up player inventory
	x = 1
	y = 13
	for i = 1, numberOfSlots do
    playerInventory[i] = { itemID = "", itemQty = 0, x = x, y = y, tID = "playerInventory" }
		if i % 5 == 0 then
			y = y + 8
			x = 1
		else
			x = x + 5
		end
	end

	-- Set up player quickslots
	x = 82
	y = 70
	for i = 1, 9 do
    playerQuickslots[i] = { itemID = "", itemQty = 0, x = x, y = y, tID = "playerQuickslots" }
		if i % 3 == 0 then
			y = y + 8
			x = 82
		else
			x = x + 5
		end
	end

	--Set up player equipment
	x = 80
	y = 13

	bodyParts = {
		"Head", "Face", "Neck",
		"Chest", "Arms", "Hands",
		"Legs", "Waist", "Feet",
		"Back", "Wrist", "Trinket"
	}

	for k, v in pairs(bodyParts) do
		playerEquipment[k] = { bodyPartID = v, itemID = "", itemCondition = 0, itemQty = 0, tID = "playerEquipment", x = x, y = y }
		if k % 3 == 0 then
			y = y + 12
			x = 80
		else
			x = x + 7
		end
	end

	-- Create item sprites
	for k, v in pairs(itemData) do
		v.itemSprite = CreateSprite(LoadImage(v.itemImagePath))
		SetSpritePosition(v.itemSprite, 200, 200)
		SetSpriteOffset(v.itemSprite, -0.4, -0.5)
		SetSpriteDepth ( v.itemSprite, 0 )
	end

	upperArmourTotal = 0
	middleArmourTotal = 0
	lowerArmourTotal = 0
	totalInvWeight = 0
end

-- Use Quickslot Item
function useItem(quickslot)
	NewNotification("Used Quickslot: " .. quickslot)
end


function inventory_dev_main(e)

	--If other panels are open do not show quickslots
	if conversationActive == false and menuOpen == false then
		quickslotX = 30
		for k, v in pairs(playerQuickslots) do
			Text(quickslotX + 0.4, 95.5, 1, k .. ".")
			PasteSpritePosition(inventorySlotSprite, quickslotX, 94)

			if v.itemID ~= "" then
				thisQuickslotItem = getItemData(v.itemID)
				PasteSpritePosition(thisQuickslotItem.itemSprite, quickslotX, 94)
			end

			quickslotX = quickslotX + 4
		end
	end


	--If the inventory menu has been chosen or the player is looting something
	if (menuSelected == 2 and menuOpen == true) or (playerLooting == true) then

		if playerLooting then
			itemArrays = { playerInventory, playerEquipment, playerQuickslots, lootContainers[canLoot].containerItems }
		else
			itemArrays = { playerInventory, playerEquipment, playerQuickslots }
		end

		for k, v in pairs(itemArrays) do
			for k, v in pairs(v) do
				PasteSpritePosition(inventorySlotSprite, v.x, v.y)
				if v.itemID ~= "" then
					thisItemData = getItemData(v.itemID)
					PasteSpritePosition(thisItemData.itemSprite, v.x, v.y)
					if v.itemType ~= "weapon" and v.itemType ~= "armour" then
						Text(v.x + 0.2, v.y + 6, 1, "x" .. v.itemQty)
					end
				end

				if g_MouseX > v.x and g_MouseX < v.x + 5 and g_MouseY > v.y and g_MouseY < v.y + 8 then
					mouseOverSlot = { k = k, tableName = v.tID, itemID = v.itemID, itemQty = v.itemQty, lootContainerID = v.containerID }

					if g_MouseClick == 0 then
						if v.itemID ~= "" then
							PasteSpritePosition(itemHoverPanel, g_MouseX + 1, g_MouseY + 1)
						end
					end

				end

			end
		end
	end


	--If the player is holding the left mouse button, and there is no currently held item
	if g_MouseClick == 1 and heldItem.k == 0 then
		if mouseOverSlot.lootContainerID ~= 0 then
			heldItem = { k = mouseOverSlot.k, tableName = mouseOverSlot.tableName, itemID = mouseOverSlot.itemID, itemQty = mouseOverSlot.itemQty, lootContainerID = mouseOverSlot.lootContainerID }
		else
			heldItem = { k = mouseOverSlot.k, tableName = mouseOverSlot.tableName, itemID = mouseOverSlot.itemID, itemQty = mouseOverSlot.itemQty }
		end
	end


	--Move the currently held item sprite to the mouse position
	if heldItem.k > 0 and g_MouseClick == 1 then
		heldItemID = heldItem.itemID
		heldItemData = getItemData(heldItemID)
		SetSpritePosition(heldItemData.itemSprite, g_MouseX, g_MouseY)
	end




	if g_MouseClick == 0 and heldItem.k > 0 then

		--Move held item slot to mouse over slot
		if mouseOverSlot.tableName == "playerInventory" then
			playerInventory[mouseOverSlot.k].itemID = heldItem.itemID
			playerInventory[mouseOverSlot.k].itemQty = heldItem.itemQty
		end

		if mouseOverSlot.tableName == "playerEquipment" then
			thisItem = getItemData(heldItem.itemID)
			if playerEquipment[mouseOverSlot.k].bodyPartID == thisItem.itemBodyPart and thisItem.itemType == "armour" then
				playerEquipment[mouseOverSlot.k].itemID = heldItem.itemID
				playerEquipment[mouseOverSlot.k].itemQty = heldItem.itemQty
			else
				heldItem = { k = 0, tableName = "", itemID = "", itemQty = 0, lootContainerID = 0 }
				NewNotification("Wrong slot for this item")
			end
		end

		if mouseOverSlot.tableName == "playerQuickslots" then
			playerQuickslots[mouseOverSlot.k].itemID = heldItem.itemID
			playerQuickslots[mouseOverSlot.k].itemQty = heldItem.itemQty
		end

		if mouseOverSlot.tableName == "lootContainers" then
			lootContainers[mouseOverSlot.lootContainerID].containerItems[mouseOverSlot.k].itemID = heldItem.itemID
			lootContainers[mouseOverSlot.lootContainerID].containerItems[mouseOverSlot.k].itemQty = heldItem.itemQty
		end


		--Move mouse over slot to held item slot
		if heldItem.tableName == "playerInventory" then
			playerInventory[heldItem.k].itemID = mouseOverSlot.itemID
			playerInventory[heldItem.k].itemQty = mouseOverSlot.itemQty
		end

		if heldItem.tableName == "playerEquipment" then
			playerEquipment[heldItem.k].itemID = mouseOverSlot.itemID
			playerEquipment[heldItem.k].itemQty = mouseOverSlot.itemQty
		end

		if heldItem.tableName == "playerQuickslots" then
			playerQuickslots[heldItem.k].itemID = mouseOverSlot.itemID
			playerQuickslots[heldItem.k].itemQty = mouseOverSlot.itemQty
		end

		if heldItem.tableName == "lootContainers" then
			lootContainers[heldItem.lootContainerID].containerItems[heldItem.k].itemID = mouseOverSlot.itemID
			lootContainers[heldItem.lootContainerID].containerItems[heldItem.k].itemQty = mouseOverSlot.itemQty
		end

		heldItem = { k = 0, tableName = "", itemID = "", itemQty = 0, lootContainerID = 0 }
		SetSpritePosition(heldItemData.itemSprite, 200, 200)
	end


	if heldItem.k > 0 then
		Text(40, 83, 2, "tableName: " .. heldItem.tableName .. " - index: " .. heldItem.k .. " - itemID: " .. heldItem.itemID .. " - itemQty: " .. heldItem.itemQty)
	end

	if mouseOverSlot.k > 0 then
		Text(40, 86, 2, "tableName: " .. mouseOverSlot.tableName .. " - index: " .. mouseOverSlot.k .. " - itemID: " .. mouseOverSlot.itemID .. " - itemQty: " .. mouseOverSlot.itemQty )
	end


	if GetScancode() > 0 then
		thisQuickslot = "Quickslot_" .. GetScancode()
		for k, v in pairs(playerQuickslots) do
			if k == GetScancode() then
				useItem(GetScancode())
			end
		end
	end


	--[[if GetScancode() == 2 then useItem("Quickslot_1") end
	if GetScancode() == 3 then useItem("Quickslot_2") end
	if GetScancode() == 4 then useItem("Quickslot_3") end
	if GetScancode() == 5 then useItem("Quickslot_4") end
	if GetScancode() == 6 then useItem("Quickslot_5") end
	if GetScancode() == 7 then useItem("Quickslot_6") end
	if GetScancode() == 8 then useItem("Quickslot_7") end
	if GetScancode() == 9 then useItem("Quickslot_8") end
	if GetScancode() == 10 then useItem("Quickslot_9") end--]]


end
