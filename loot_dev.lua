function loot_dev_init(e)
  lootContainers = {}
  lootContainers[45] = { containerItems = {} }
  lootContainers[45].containerItems[1] = { itemID = "f_chips", itemQty = 2 }
  lootContainers[45].containerItems[2] = { itemID = "d_milk", itemQty = 2 }
  lootContainers[45].containerItems[3] = { itemID = "w_1911", itemQty = 1 }
  lootContainers[45].containerItems[4] = { itemID = "a_38ammo", itemQty = 35 }

  ------- ADVANCED -----------
  canLoot = 0
  playerLooting = false
  keyPressedE = false

  x = 45
  y = 50
  for k, v in pairs (lootContainers) do
    thisContainerID = k
    for k, v in pairs (v.containerItems) do
      v.x = x
      v.y = y
      v.tID = "lootContainers"
      v.containerID = thisContainerID

      if k % 3 == 0 then
        y = y + 8
        x = 45
      else
        x = x + 5
      end

    end
  end

end


function loot_dev_main(e)

  if canLoot > 0  then
    if GetScancode() == 18 and not keyPressedE then
  		playerLooting = not playerLooting
  		keyPressedE = true
  	elseif GetScancode() == 18 then
  		keyPressedE = true
  	else
  		keyPressedE = false
  	end
  end

  if playerLooting then
    menuOpen = true
    menuSelected = 2
  end

  for k, v in pairs(lootContainers) do
    if GetPlayerDistance(k) < 50 then
      canLoot = k
      if playerLooting == false then
        PromptLocal(k, "Press E to loot (containerID = " .. canLoot .. ")")
      else
        TextCenterOnX(50, 45, 3, "Press E to close")
      end
    else
      playerLooting = false
      canLoot = 0
    end
  end

end
