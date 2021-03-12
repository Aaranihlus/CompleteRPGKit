function combat_handler_init (e)

  playerCurrentWeapon = "Knife"
  playerCurrentWeaponType = "Melee"
  playerSkillWithWeaponType = 20

  playerAgility = 3
  playerStrength = 4
  playerLuck = 2
  playerPerception = 5

  weaponMaxRange = 220
  weaponMaxDamage = 20

  playerAttacked = false

  lastAttackData = {
    chanceToHit = 0,
    damageOnHit = 0,
    criticalHitChance = 0,
    chanceToHitRoll = 0,
    chanceToCriticalHitRoll = 0,
    targetHit = false,
    targetCriticalHit = false,
    damageDealt = 0
  }

end


function combat_handler_main (e)

  HideHuds()

  TextCenterOnX( 50, 50, 1, "+" )

  if ( Utils.ObjectPlayerLookingAt() ~= 0 ) then

    currentTargetedEntity = Utils.ObjectPlayerLookingAt()
    entityID = Utils.ObjectToEntity( currentTargetedEntity )

    if ( entityID ~= nil ) then
      currentTargetedEntityDistance = g_Entity[entityID]['plrdist']
      Text( 2, 50, 3, "Distance: " .. currentTargetedEntityDistance )
    end

    if ( currentTargetedEntityDistance > weaponMaxRange ) then
      TextCenterOnX( 50, 55, 3, "Target is outside of weapon range" )
    else
      TextCenterOnX( 50, 55, 3, "You can hit this target!" )
      if g_MouseClick == 1 and not playerAttacked then
        lastAttackData = AttackTarget()
        playerAttacked = true
      elseif g_MouseClick == 1 then
        playerAttacked = true
      else
        playerAttacked = false
      end
    end


    Text( 2, 5, 3, "Last Attack Data -- " )
    Text( 2, 10, 3, "chanceToHit: " ..  lastAttackData.chanceToHit )
    Text( 2, 15, 3, "damageOnHit: " ..  lastAttackData.damageOnHit )
    Text( 2, 20, 3, "criticalHitChance: " .. lastAttackData.criticalHitChance )
    Text( 2, 25, 3, "chanceToHitRoll: " .. lastAttackData.chanceToHitRoll )
    Text( 2, 30, 3, "chanceToCriticalHitRoll: " .. lastAttackData.chanceToCriticalHitRoll )

    if ( lastAttackData.targetHit ) then
      Text( 2, 35, 3, "targetHit: Yes!" )
    else
      Text( 2, 35, 3, "targetHit: No" )
    end

    if ( lastAttackData.targetCriticalHit ) then
      Text( 2, 40, 3, "targetCriticalHit: Yes!" )
    else
      Text( 2, 40, 3, "targetCriticalHit: No" )
    end

    Text( 2, 45, 3, "damageDealt: " .. lastAttackData.damageDealt )

  end



end



function AttackTarget ()

  TextCenterOnX( 50, 60, 3, "Attacking!" )

  targetHit = false
  targetCriticalHit = false
  damageDealt = 0

  if ( playerCurrentWeaponType == "Melee" ) then
    chanceToHit = ( playerSkillWithWeaponType + (playerAgility * 5) )
    damageOnHit = ( weaponMaxDamage + (playerStrength * 5) )
  else
    chanceToHit = ( playerSkillWithWeaponType + (playerPerception * 5) )
    damageOnHit = ( weaponMaxDamage + weaponAmmoModifier )
  end

  criticalHitChance = ( (playerSkillWithWeaponType / 2) + (playerLuck * 5) )

  chanceToHitRoll = math.random( 1, 100 )
  chanceToCriticalHitRoll = math.random( 1, 100 )

  if ( chanceToHitRoll <= chanceToHit ) then
    targetHit = true
  end

  if ( targetHit and chanceToCriticalHitRoll <= criticalHitChance ) then
    targetCriticalHit = true
  end

  if ( targetHit and not targetCriticalHit ) then
    damageDealt = math.random( 1, damageOnHit )
  end

  if ( targetHit and targetCriticalHit ) then
    damageDealt = (math.random( 1, damageOnHit )) * 2
  end

  if ( damageDealt > 0 ) then
    SetEntityHealth(entityID, g_Entity[entityID]['health'] - damageDealt)
  end

  data = {
    chanceToHit = chanceToHit,
    damageOnHit = damageOnHit,
    criticalHitChance = criticalHitChance,
    chanceToHitRoll = chanceToHitRoll,
    chanceToCriticalHitRoll = chanceToCriticalHitRoll,
    targetHit = targetHit,
    targetCriticalHit = targetCriticalHit,
    damageDealt = damageDealt
  }

  return data

end
