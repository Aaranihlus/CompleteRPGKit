local ids = {}
local itemAdded = false

function pickup_dev_init_name(e, name)
  ids[e] = name
end

function pickup_dev_main(e)

  if GetPlayerDistance(e) < 50 then

    PromptLocal(e, "Press E to pick up " .. getItemName(ids[e]))

    if g_KeyPressE == 1 then

      for k, v in pairs( playerInventory ) do
        if v.itemID ~= "" and v.itemID == ids[e] and v.itemQty < getMaxStack(v.itemID) then
          v.itemQty = v.itemQty + 1
          itemAdded = true
          break
        elseif v.itemID == "" then
          v.itemID = ids[e]
          v.itemQty = 1
          itemAdded = true
          break
        end
      end

      if itemAdded then
        NewNotification("You picked up " .. getItemName(ids[e]))
        Destroy(e)
      else
        NewNotification("Inventory is full")
      end

    end

    itemAdded = false

  end

end
