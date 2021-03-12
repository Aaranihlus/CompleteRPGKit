conversationData = {}

conversationData[18] = {
  charName = "Rebel Soldier",
  introText = "Ah, you must be the new guy",
  playerResponses = {},
  charResponses = {},
  conversationSequence = 0
}

conversationData[18].playerResponses[1] = {
  sequence = 0,
  text = "Yeah, that's me."
}

conversationData[18].playerResponses[2] = {
  sequence = 0,
  text = "I'm looking for the commander."
}

conversationData[18].charResponses[1] = {
  responseTo = 1,
  text = "Good, welcome aboard. You'll find the commander in his tent just up the road, you'll find it off to the right. He will issue you some gear and give you your tasks for the day."
}

conversationData[18].charResponses[2] = {
  responseTo = 2,
  text = "Straight to the point. I'm sure the commander will appreciate your eagerness. You'll find him in the tent along road."
}




conversationData[63] = { charName = "Rebel Commander", introText = "You're the new blood, right?", playerResponses = {}, charResponses = {}, conversationSequence = 0 }

conversationData[63].playerResponses[1] = { sequence = 0, text = "Reporting for duty, sir." }
conversationData[63].charResponses[1] = { responseTo = 1, text = "Just in time, I would give you a tour of the base, but I need some work done ASAP and all of my other boys are busy." }

conversationData[63].playerResponses[2] = { sequence = 1, text = "What can I do to help?" }
conversationData[63].charResponses[2] = { responseTo = 2, text = "Some important cargo was on it's way to me, but I've just received word that our enemy has intercepted it. I need you to go there and retrieve it for me." }

conversationData[63].playerResponses[3] = { sequence = 2, text = "Sure, you can count on me", questID = 1, getItemID = "k_ba" }
conversationData[63].playerResponses[4] = { sequence = 2, text = "I can't do that" }

conversationData[63].charResponses[3] = { responseTo = 3, text = "Good to have you on board, take this key. You'll be able to open the armoury just outside this tent. Take whatever you need. When you're ready, follow the path out of the camp. Keep following the path East and you'll find the tunnel." }
conversationData[63].charResponses[4] = { responseTo = 4, text = "That's a shame. I had high hopes for you. Leave immediatley." }

conversationData[63].playerResponses[5] = { sequence = 3, text = "Do you have any extra info on the situation?", requiresActiveQuest = 1 }
conversationData[63].charResponses[5] = { responseTo = 5, text = "The report I recieved mentioned that there may be some enemies still in the area.", questID = 1, journalText = "I was told that there may be some remaining enemy presence around the area" }

conversationData[63].playerResponses[6] = { sequence = 4, text = "Here is the document you asked for", completeQuestID = 1, requiresItem = "q_document" }
conversationData[63].charResponses[6] = { responseTo = 6, text = "Great job, thanks for that." }

conversationData[63].playerResponses[7] = { sequence = 5, text = "Got anything else for me?", requiresCompletedQuest = 1}
conversationData[63].charResponses[7] = { responseTo = 7, text = "I do, actually. Some of our men have set up a forward post north east of here. I need you to go there and help them out." }

conversationData[63].playerResponses[8] = { sequence = 6, text = "On the way", questID = 2 }
conversationData[63].playerResponses[9] = { sequence = 6, text = "So be it. Please leave my base right now." }

return conversationData
