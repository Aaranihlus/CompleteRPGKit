local containerIDs = {}

function loot_init(e)

  ------- ADVANCED -----------
  canLoot = 0
  playerLooting = false
  keyPressedE = false
  containerIDs[e] = e
  lootInteractionDistance = 60

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

    x = 45
    y = 50

  end

end


function loot_main(e)

  if GetPlayerDistance(e) < lootInteractionDistance then
    canLoot = containerIDs[e]

    if not playerLooting then
      PromptLocal(e, "Press E to open")
    end

    if playerLooting then
      PromptLocal(e, "Press E to close")
    end

    if GetScancode() == 18 and not keyPressedE then
      playerLooting = not playerLooting
      keyPressedE = true
    elseif GetScancode() == 18 then
      keyPressedE = true
    else
      keyPressedE = false
    end

  end

end
