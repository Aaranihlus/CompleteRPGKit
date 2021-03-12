-- Journal
function journal_init(e)
  journalEntries = {}
  journalQuests = {}
  viewingQuest = 0
  trackedQuest = 0

  --[[
  ...As you approach the hooded man, the rickety wooden door squeaks, a strong gust of wind slams it shut behind you.
  An overwhelming smell of rotten wood and mildew fills your nose, the man appears harmless enough at first, but a feeling
  of unease starts to worm its way your mind, something doesn't feel right...

  A dim candle gently illuminates the mans face, and a slow, creeping grin begins to spread from ear to ear,
  giving you a hint that his business isn't entirely legitimate but is extremely profitable. Whether an attempt at intimidation,
  or a subtle boast, you think there is more going on here than meets the eye...
  ]]--




  --questStatus: 0 = inactive, 1 = active, 2 = completed
  journalQuests[1] = { questGiver = 63, questName = "Package Recovery", rewardXP = 500, rewardMoney = 50, rewardItems = {}, objectives = {}, questStatus = 0, startText = "I must follow the path East to find a collapsed tunnel. I should look for an important document in the tunnel and bring it back to the rebel commander" }
  journalQuests[1].objectives[1] = { type = "pickup", entityID = 89, completed = false, text = "Find the lost document" }
  journalQuests[1].objectives[2] = { type = "deliver", itemID = "q_document", entityID = 63, completed = false, text = "Bring the document back to the commander" }
end

function newJournalEntry(questID, text)
  for n = 1, 10 do
    if journalEntries[n] == nil then
        journalEntries[n] = { questID = questID, text = text }
    break end
  end
end


function completeQuest(id)
  curMoney = curMoney + journalQuests[id].rewardMoney
  curExperience = curExperience + journalQuests[id].rewardXP
  journalQuests[id].questStatus = 2
  NewNotification("Completed " .. journalQuests[id].questName)
end



function journal_main(e)

  if menuSelected == 4 and menuOpen == true then -- menu open

    -- Show Active Quests
    y = 14
    Text(30, 10, 3, "Active Quests:")
    for k, v in pairs(journalQuests) do
      if v.questStatus == 1 then
        if g_MouseX > 20 and g_MouseX < 50 and g_MouseY > y - 2 and g_MouseY < y + 1 then
          TextColor(30, y, 3, v.questName, 255, 191, 63)
          if g_MouseClick == 1 then
            viewingQuest = k
          end
        else
          Text(30, y, 3, v.questName)
        end
        y = y + 5
      end
    end


    -- Show notes for currently selected quest
    y = 20
    if viewingQuest > 0 then

      Text(70, 10, 2, journalQuests[viewingQuest].questName)
      Text(70, 14, 2, journalQuests[viewingQuest].startText)

      Text(70, 18, 2, "Objectives")

      for k, v in pairs(journalQuests[viewingQuest].objectives) do
        Text(70, y, 2, v.text)
        y = y + 2
      end

      --[[for k, v in pairs(journalEntries) do
        if k == viewingQuest then
          Text(70, y, 3, v.text)
          y = y + 8
        end
      end--]]

    end

  end -- end menu open


end -- end main
