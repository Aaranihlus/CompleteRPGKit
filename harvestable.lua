local harvestableData = {}
local harvestSuccess = false
local canHarvest = false
local harvestProgress = 0

function harvestable_init_name(e, name)

  keyPressedE = false

  harvestableData[e] = {
    name = name,
    ready = "yes"
  }

  progressBarBorderSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\progressBarBorder.png"))
  SetSpritePosition(progressBarBorderSprite, 200, 200)
  SetSpriteDepth (progressBarBorderSprite, 0)
  SetSpriteSize(progressBarBorderSprite, 20, 4)

  progressBarTickSprite = CreateSprite(LoadImage("scriptbank\\CompleteRPGKit\\ui\\progressBarTick.png"))
  SetSpritePosition(progressBarBorderSprite, 200, 200)
  SetSpriteDepth (progressBarBorderSprite, 0)
  SetSpriteSize(progressBarTickSprite, 0, 4)
end

function harvestable_main(e)

  canHarvest = false

  if GetPlayerDistance(e) <= 60 then

    if ( GetHarvestableType(harvestableData[e].name ) == "herbalism" ) then
      if ( checkIfPlayerHasItem("t_herbalist_kit") ) then
        canHarvest = true
      else
        PromptLocal(e, "You need a Herbalist Kit")
      end
    end

    if ( GetHarvestableType(harvestableData[e].name ) == "mining" ) then
      if ( checkIfPlayerHasItem("t_pickaxe") ) then
        canHarvest = true
      else
        PromptLocal(e, "You need a Pickaxe")
      end
    end

    if ( canHarvest and harvestableData[e].ready == "yes" ) then
      PromptLocal(e, "Hold E to collect " .. getItemName(harvestableData[e].name))
      SetSpritePosition(progressBarBorderSprite, 40, 70)
      SetSpritePosition(progressBarTickSprite, 40, 70)
      if GetScancode() == 18 then
        harvestProgress = harvestProgress + 0.5
        spriteWidth = ( harvestProgress / 100 ) * 20
        SetSpriteSize(progressBarTickSprite, spriteWidth, 4)
      else
        harvestProgress = 0
        SetSpritePosition(progressBarTickSprite, 200, 200)
        SetSpriteSize(progressBarTickSprite, 5, 5)
      end
    else
      SetSpritePosition(progressBarBorderSprite, 200, 200)
      SetSpritePosition(progressBarTickSprite, 200, 200)
    end

    if harvestProgress >= 100 then
      FinishHarvesting(e)
    end

  end

end

function FinishHarvesting (e)
  Hide(e)
  harvestableData[e].ready = "no"
  givePlayerItem(harvestableData[e].name)
  NewNotification("You successfully harvested 1x " .. getItemName(harvestableData[e].name))
  harvestProgress = 0
  canHarvest = false
end
