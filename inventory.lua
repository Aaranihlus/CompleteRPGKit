function inventory_init(e)

	-- Storage for item data, will look for file "ItemData.lua"
	itemData = require("scriptbank\\CompleteRPGKit\\data\\ItemData")

	-- Storage for loot data, will look for file "LootData.lua"
	lootContainers = require("scriptbank\\CompleteRPGKit\\data\\LootData")

	--LoadGlobalSound("scriptbank\\CompleteRPGKit\\audio\\openInventory.mp3" , 1)
	--LoadGlobalSound("scriptbank\\CompleteRPGKit\\audio\\closeInventory.mp3" , 2)

	-- Initialise pointer sprite
	-- To customise, simply add your custom image to the UI folder and/or change file name
	cursorSprite = CreateSprite(LoadImage("scriptbank\\xanthir\\pointer2.png"))
	SetSpritePosition(cursorSprite, 200, 200)
	SetSpriteDepth ( cursorSprite, 0 )

	-- Initialise backdrop for each inventory slot
	-- To customise, simply add your custom image to the UI folder and change file name (if required)
	inventorySlotSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\invslot.png"))
	SetSpritePosition(inventorySlotSprite, 200, 200)
	SetSpriteSize(inventorySlotSprite, 4, -1)
	SetSpriteDepth(inventorySlotSprite, 20)

	-- Base number of inventory slots
	-- You may edit this freely, however sprite positioning may need to be adjusted, based on number of slots
	numberOfSlots = 55

	--- WARNING: EDITING BELOW VARIABLES MAY BREAK SCRIPT ---
	--inventoryOpen = false -- INVENTORY STATE
	--playerLooting = false -- LOOTING STATE
	playerInventory = {} -- ARRAY OF PLAYER INVENTORY ITEMS

	-- Set up player inventory
	-- x = the HORIZONTAL starting position of the first inventory slot
	-- y = the VERTICAL starting position of the first inventory slot
	x = 1
	y = 8
	for i = 1, numberOfSlots do
    playerInventory[i] = { itemID = "", qty = 0, x = x, y = y, tID = "playerInventory" }
		if i % 5 == 0 then
			y = y + 8
			x = 1
		else
			x = x + 5
		end
	end

	-- Variable to store total inventory weight
	totalInvWeight = 0

	-- Table to store data for the slot the mouse is currently hovering over
	mouseOverSlot = { k = 0, tableName = "", itemID = "", qty = 0, lootContainerID = 0 }

	-- Table to store data for the item currently being held/dragged
	heldItem = { k = 0, tableName = "", itemID = "", qty = 0, lootContainerID = 0 }

end



function inventory_main(e)

	--[[if GetScancode() == 16 and not keyPressedQ then
		inventoryOpen = not inventoryOpen
		keyPressedQ = true
	elseif GetScancode() == 16 then
		keyPressedQ = true
	else
		keyPressedQ = false
	end]]--

	--If the inventory menu has been chosen or the player is looting something
	if (menuSelected == 2 and menuOpen) or (playerLooting) then

		HideHuds()
		ActivateMouse()
		totalInvWeight = 0
		--PlayGlobalSound(1)

		SetSpritePosition ( cursorSprite , g_MouseX , g_MouseY )

		if playerLooting then
			itemArrays = { playerInventory, lootContainers[canLoot].containerItems }
		else
			itemArrays = { playerInventory }
		end


		for k, v in pairs(itemArrays) do

			for k, v in pairs(v) do

				PasteSpritePosition(inventorySlotSprite, v.x, v.y)

				if v.itemID ~= "" then
					thisItemData = getItemData(v.itemID)
					PasteSpritePosition(thisItemData.itemSprite, v.x, v.y)

					totalInvWeight = totalInvWeight + thisItemData.itemWeight

					if v.qty > 0 then
						Text(v.x, v.y, 2, "x" .. v.qty)
					end

				end

				if g_MouseX > v.x and g_MouseX < v.x + 5 and g_MouseY > v.y and g_MouseY < v.y + 8 then
					mouseOverSlot = { k = k, tableName = v.tID, itemID = v.itemID, qty = v.qty, lootContainerID = v.containerID }
				end

			end

		end

		Text(50, 50, 3, "Inv Weight: " .. totalInvWeight)



		--If the player is holding the left mouse button, and there is no currently held item
		if g_MouseClick == 1 and heldItem.k == 0 then
			if mouseOverSlot.lootContainerID ~= 0 then
				heldItem = { k = mouseOverSlot.k, tableName = mouseOverSlot.tableName, itemID = mouseOverSlot.itemID, qty = mouseOverSlot.qty, lootContainerID = mouseOverSlot.lootContainerID }
			else
				heldItem = { k = mouseOverSlot.k, tableName = mouseOverSlot.tableName, itemID = mouseOverSlot.itemID, qty = mouseOverSlot.qty }
			end
		end

		--Move the currently held item sprite to the mouse position
		if heldItem.itemID ~= "" and g_MouseClick == 1 then
			heldItemData = getItemData(heldItem.itemID)
			SetSpritePosition(heldItemData.itemSprite, g_MouseX, g_MouseY)
		end


		if g_MouseClick == 0 and heldItem.k > 0 then

			--Move held item slot to mouse over slot
			if mouseOverSlot.tableName == "playerInventory" then
				playerInventory[mouseOverSlot.k].itemID = heldItem.itemID
				playerInventory[mouseOverSlot.k].qty = heldItem.qty
			end

			if mouseOverSlot.tableName == "lootContainers" then
				lootContainers[mouseOverSlot.lootContainerID].containerItems[mouseOverSlot.k].itemID = heldItem.itemID
				lootContainers[mouseOverSlot.lootContainerID].containerItems[mouseOverSlot.k].qty = heldItem.qty
			end


			--Move mouse over slot to held item slot
			if heldItem.tableName == "playerInventory" then
				playerInventory[heldItem.k].itemID = mouseOverSlot.itemID
				playerInventory[heldItem.k].qty = mouseOverSlot.qty
			end

			if heldItem.tableName == "lootContainers" then
				lootContainers[heldItem.lootContainerID].containerItems[heldItem.k].itemID = mouseOverSlot.itemID
				lootContainers[heldItem.lootContainerID].containerItems[heldItem.k].qty = mouseOverSlot.qty
			end

			heldItem = { k = 0, tableName = "", itemID = "", lootContainerID = 0 }
			if ( heldItemData.itemSprite ~= nil ) then
				SetSpritePosition(heldItemData.itemSprite, 200, 200)
			end

		end

	else

		--PlayGlobalSound(2)
		DeactivateMouse()
		SetSpritePosition(cursorSprite, 200, 200)

	end

end




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

function GetHarvestableType(id)
	for k, v in pairs(itemData) do
		if v.itemID == id then
			return v.harvestType
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


function givePlayerItem(itemID)

	local thisItemData = getItemData(itemID)
	local inPlayerInv = checkIfPlayerHasItem(itemID)
	local nextFreeSlot = getFirstFreeSlot()

	if thisItemData.itemStackable then
		if inPlayerInv then
			for k, v in pairs(playerInventory) do
				if v.itemID == itemID then
					v.qty = v.qty + 1
				end
			end
		else
			playerInventory[nextFreeSlot].itemID = itemID
			playerInventory[nextFreeSlot].qty = 1
		end
	else
		playerInventory[nextFreeSlot].itemID = itemID
	end

end


function checkIfPlayerHasItem(itemID)
  for k, v in pairs(playerInventory) do
    if v.itemID == itemID then
      return true
    end
  end
end


function getFirstFreeSlot()
	for k, v in pairs(playerInventory) do
		if v.itemID == "" then
			return k
		end
	end
end
