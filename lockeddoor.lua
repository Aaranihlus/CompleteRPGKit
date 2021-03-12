function lockeddoor_init(e)
  thisDoorID = 0
  lockedDoors = {}
  lockedDoors[72] = { requiredKeyID = "k_ba", unlocked = 0 }
end

function lockeddoor_main(e)

  if thisDoorID == 0 then
    for k, v in pairs(lockedDoors) do
      if GetPlayerDistance(k) < 80 then
        thisDoorID = k
      else
        thisDoorID = 0
      end
    end
  end

  if thisDoorID > 0 then
    for k, v in pairs(playerInventory) do
      if v.itemID == lockedDoors[thisDoorID].requiredKeyID then
        TextCenterOnX(50, 90, 3, 'Press E to unlock door')

        if g_KeyPressE == 1 then
          CollisionOff(e)
        end

      else
        TextCenterOnX(50, 90, 3, 'This door is locked.')
      end
    end

  end

  --TextCenterOnX(50,50,2,thisDoorID)

end
