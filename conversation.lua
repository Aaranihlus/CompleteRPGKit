local npcIDs = {}

function conversation_init(e)
  npcIDs[e] = e
  conversationActive = false
  thisConversation = 0
  --thisConversationSequence = 0
  playerResponse = 0
  mouseClicked = false

  conversationData = require("scriptbank\\CompleteRPGKit\\conversation_data")

end







function conversation_main(e)

  if GetPlayerDistance(e) < 80 then
    thisConversation = npcIDs[e]
    if not conversationActive then
      TextCenterOnX(50, 75, 3, "Press E to talk to " .. conversationData[thisConversation].charName)
    end
    if GetScancode() == 18 and not keyPressedE then
      conversationActive = not conversationActive
      keyPressedE = true
    elseif GetScancode() == 18 then
      keyPressedE = true
    else
      keyPressedE = false
    end
  end



  -- If the conversation has been activated
  if conversationActive and GetPlayerDistance(npcIDs[e]) < 80 then
    ActivateMouse()
    RotateToPlayer(e)
    PasteSpritePosition( conversationSprite, 25, 75 )
    SetSpritePosition ( cursorSprite, g_MouseX, g_MouseY )



    -- Character Responses
    if conversationData[thisConversation].conversationSequence == 0 then
      TextCenterOnX(50, 80, 3, conversationData[thisConversation].introText)
    else
      for k, v in pairs(conversationData[thisConversation].charResponses) do

        if v.responseTo == playerResponse then

          -- Add Quest Text for the specifed Quest
          if v.journalText then
            newJournalEntry(v.questID, v.journalText)
          end

          TextCenterOnX(50, 80, 3, v.text)

        end
      end
    end



    --Player Responses
    y = 90
    numResponses = 0
    for k, v in pairs(conversationData[thisConversation].playerResponses) do

      showResponse = 0

      if (v.sequence == conversationData[thisConversation].conversationSequence and not v.requiresActiveQuest and not v.requiresItem) then
        showResponse = 1
        numResponses = numResponses + 1

      elseif (v.requiresActiveQuest and journalQuests[v.requiresActiveQuest].questStatus == 1) and (v.sequence == conversationData[thisConversation].conversationSequence) then
        showResponse = 1
        numResponses = numResponses + 1

      elseif (v.requiresItem) and (v.sequence == conversationData[thisConversation].conversationSequence) then
        requiredItem = v.requiresItem
        for k, v in pairs(playerInventory) do
          if v.itemID == requiredItem then
            showResponse = 1
            numResponses = numResponses + 1
          end
        end

      else
        showResponse = 0
      end


      if showResponse == 1 then

        Text(26, y, 3, v.text)

        if g_MouseX > 25 and g_MouseX < 75 and g_MouseY > y - 2 and g_MouseY < y + 1 then

          TextColor(26, y, 3, v.text, 255, 191, 63)

          if g_MouseClick == 1 and not mouseClicked then
            mouseClicked = true
            playerResponse = k
            conversationData[thisConversation].conversationSequence = conversationData[thisConversation].conversationSequence + 1

            -- Accept the specified quest
            if v.questID then
              journalQuests[v.questID].questStatus = 1
            end

            -- Complete the specified quest
            if v.completeQuestID then
              completeQuest(v.completeQuestID)
            end

            -- Give player 1 of the specifed item
            if v.getItemID then
              givePlayerItem(v.getItemID)
            end

          elseif g_MouseClick == 1 then
            mouseClicked = true
          else
            mouseClicked = false
          end

        end

        y = y + 3

      end

    end



    if numResponses == 0 then
      Text(26, 97, 3, "Goodbye")
      if g_MouseX > 25 and g_MouseX < 75 and g_MouseY > 97 and g_MouseY < 99 then
        TextColor(26, 97, 3, "Goodbye", 255, 191, 63)
        if g_MouseClick == 1 and not mouseClicked then
          mouseClicked = true
          conversationActive = false
        elseif g_MouseClick == 1 then
          mouseClicked = true
        else
          mouseClicked = false
        end
      end
    end








  end -- End Conversation Active Loop

end -- End Main
