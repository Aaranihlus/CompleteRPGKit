local ids = {}
local itemAdded = false
local canPickup = false

function pickup_init_name(e, name)
  ids[e] = name
end

function pickup_main(e)

  if GetPlayerDistance(e) < 40 then

    canPickup = true

    if canPickup then
      PromptLocal(e, "Press E to pick up " .. getItemName(ids[e]))
      canPickup = ids[e]

      if g_KeyPressE == 1 then
        for k, v in pairs( playerInventory ) do
          if v.itemID == "" then
            v.itemID = ids[e]
            itemAdded = true
            break
          end
        end
        if itemAdded then
          NewNotification("You picked up " .. getItemName(ids[e]))
          Destroy(e)
          g_KeyPressE = 0
        else
          NewNotification("Inventory is full")
        end
      end

      itemAdded = false

    end

  end

end
