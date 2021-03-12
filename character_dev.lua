--==========================================
-- Title:    Character Creator
-- Author:   Nathan Leadbitter
-- Date:     17/10/2020
-- Version:  1.0
--==========================================

-- ASSIGN THIS SCRIPT TO A DYNAMIC ENTITY

function character_dev_init(e)

	optionEnableSurvivalMechanics = true

	charName = "Chungus"

	charAttributes = {
		strength = 1,
		perception = 1,
		endurance = 1,
		charisma = 1,
		intelligence = 1,
		agility = 1,
		luck = 1
	}

	charSkills = {
		melee = 5,
		handguns = 5,
		shotguns = 5,
		smgs = 5,
		assault_rifles = 5,
		sniper_rifles = 5,
		heavy_weapons = 5,
		athletics = 5,
		stealth = 5,
		speech = 5,
		bartering = 5,
		medical = 5,
		repair = 5,
		construction = 5,
		security = 5,
		computers = 5,
		light_armour = 5,
		heavy_armour = 5,
		looting = 5,
		marksmanship = 5
	}

	curLevel = 1
	curExperience = 0
	experienceForNextLevel = 100
	maxHealth = 100 + ( 10 * charAttributes.endurance )
	curHealth = maxHealth
	maxStamina = 100 + ( 10 * charAttributes.agility) + ( 2 * charSkills.athletics )
	curStamina = maxStamina
	baseMovementSpeed = ( 50 + charSkills.athletics ) + ( 5 * charAttributes.agility )
	actualMovementSpeed = baseMovementSpeed
	staminaDrainRate = 0.1
	staminaRecoveryRate = 0.1
	curMoney = 100
	sprintEnabled = true
	characterPanelOpen = false
	unspentAttributePoints = 0
	unspentSkillPoints = 0
	maxCalories = 500 + ( 5 * charAttributes.endurance )
	curCalories = maxCalories
	maxHydration = 500 + ( 5 * charAttributes.endurance )
	curHydration = maxHydration
end


function character_dev_main(e)

	bearing = math.floor(math.fmod(g_PlayerAngY, 360))
	TextCenterOnX(50, 4, 2, "Bearing: " .. bearing)

	-- prevent variables from exceeding their maximum
	if curHealth > maxHealth then curHealth = maxHealth end
	if curStamina > maxStamina then curStamina = maxStamina end
	if curCalories > maxCalories then curCalories = maxCalories end
	if curHydration > maxHydration then curHydration = maxHydration end

	-- prevent variables from going below 0
	if curHealth < 0 then curHealth = 0 end
	if curStamina < 0 then curStamina = 0 end
	if curCalories < 0 then curCalories = 0 end
	if curHydration < 0 then curHydration = 0 end

	--if curCalories == 0 then addStatusEffect("Starvation") end
	--if curHydration == 0 then addStatusEffect("Dehydration") end
	--if curStamina == 0 then addStatusEffect("Exhaustion") end

	healthPerc = ((curHealth / maxHealth) * 100)
	healthSprSize = healthPerc / 10
	SetSpriteSize(healthSprite, healthSprSize, 2)

	staminaPerc = ((curStamina / maxStamina) * 100)
	staminaSprSize = staminaPerc / 10
	SetSpriteSize(staminaSprite, staminaSprSize, 2)

	-- If sprinting has been disabled after reaching 0
	if not sprintEnabled then
		if staminaPerc > 25 then
			sprintEnabled = true
			SetGamePlayerControlCanRun(1)
		end
	end

	-- If player is currently sprinting
	if GetGamePlayerControlIsRunning() == 1 and sprintEnabled then
		curStamina = curStamina - staminaDrainRate
		if curStamina == 0 then
			curStamina = 0
			sprintEnabled = false
			SetGamePlayerControlCanRun(0)
		end
	else
		curStamina = curStamina + staminaRecoveryRate
	end





	if menuSelected == 1 and menuOpen == true then
		Text(1, 8, 3, "Name: " .. charName)
		Text(1, 11, 3, "Level: " .. curLevel)
		Text(1, 14, 3, "Experience: " .. curExperience .. " / " .. experienceForNextLevel)
		Text(1, 17, 3, "Money: " .. curMoney)

		TextColor(1, 21, 3, "// Attributes", 255, 191, 63)
		Text(1, 24, 3, "Strength: " .. charAttributes.strength)
		Text(1, 27, 3, "Perception: " .. charAttributes.perception)
		Text(1, 30, 3, "Endurance: " .. charAttributes.endurance)
		Text(1, 33, 3, "Charisma: " .. charAttributes.charisma)
		Text(1, 36, 3, "Intelligence: " .. charAttributes.intelligence)
		Text(1, 39, 3, "Agility: " .. charAttributes.agility)
		Text(1, 42, 3, "Luck: " .. charAttributes.luck)
		Text(1, 45, 3, "Unspent Attribute Points: " .. unspentAttributePoints)

		TextColor(1, 52, 3, "// Stats", 255, 191, 63)
		Text(1, 55, 3, "Health: " .. curHealth .. " / " .. maxHealth)
		Text(1, 58, 3, "Stamina: " .. curStamina .. " / " .. maxStamina)
		Text(1, 61, 3, "Calories: " .. curCalories .. " / " .. maxCalories)
		Text(1, 64, 3, "Hydration: " .. curHydration .. " / " .. maxHydration)

		TextColor(30, 21, 3, "// Skills", 255, 191, 63)
		Text(30, 48, 3, "Unspent Skill Points: " .. unspentSkillPoints)


	end

end
