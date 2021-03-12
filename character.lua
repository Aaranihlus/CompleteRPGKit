--==========================================--
-- Title:    Character Status Panel				  --
-- Author:   Nathan Leadbitter							--
-- Date:     17/10/2020											--
-- Version:  1.0														--
--==========================================--

-- ASSIGN THIS SCRIPT TO A DYNAMIC ENTITY
-- SET ALWAYS ACTIVE TO "YES"

function character_init(e)
	characterPanelOpen = false
	keyPressedQ = false
	curLevel = 1
	curExperience = 0
	experienceForNextLevel = 100
	maxHealth = 100 + ( 10 * charAttributes.endurance )
	curHealth = maxHealth
	maxStamina = 100 + ( 10 * charAttributes.agility) + ( 5 * charSkills.athletics )
	curStamina = maxStamina
	baseMovementSpeed = ( 50 + charSkills.athletics ) + ( 5 * charAttributes.dexterity )
	actualMovementSpeed = baseMovementSpeed
	staminaDrainRate = 0.1
	staminaRecoveryRate = 0.1
	characterCreated = false
end


function character_main(e)

	if GetScancode() == 16 and not keyPressedQ then
		characterPanelOpen = not characterPanelOpen
		keyPressedQ = true
	elseif GetScancode() == 16 then
		keyPressedQ = true
	else
		keyPressedQ = false
	end

	if characterPanelOpen then
		Text(1, 11, 3, "Level: " .. curLevel)
		Text(1, 14, 3, "Experience: " .. curExperience .. " / " .. experienceForNextLevel)

		TextColor(1, 21, 3, "// Attributes", 255, 191, 63)
		Text(1, 24, 3, "Strength: " .. charAttributes.strength)
		Text(1, 27, 3, "Perception: " .. charAttributes.perception)
		Text(1, 30, 3, "Endurance: " .. charAttributes.endurance)
		Text(1, 33, 3, "Charisma: " .. charAttributes.charisma)
		Text(1, 36, 3, "Intelligence: " .. charAttributes.intelligence)
		Text(1, 39, 3, "Agility: " .. charAttributes.agility)
		Text(1, 42, 3, "Luck: " .. charAttributes.luck)

		Text(1, 45, 3, "Unspent Attribute Points: " .. unspentAttributePoints)
		Text(1, 48, 3, "Unspent Skill Points: " .. unspentSkillPoints)

		TextColor(1, 52, 3, "// Stats", 255, 191, 63)
		Text(1, 55, 3, "Health: " .. curHealth .. " / " .. maxHealth)
		Text(1, 58, 3, "Stamina: " .. curStamina .. " / " .. maxStamina)
	end

end
