statusEffects = {}

statusEffects[1] = {
  statusName = "Exhaustion",
  type = "debuff",
  desc = "Cannot sprint or jump until stamina has recovered by 30%",
  duration = "permenant",
  maxStacks = 1,
  icon = ""
}

statusEffects[2] = {
  statusName = "Dehydration",
  type = "damage",
  desc = "You are dehydrated, you will take a slight amount of damage every 5 seconds",
  duration = "permenant",
  maxStacks = 1,
  icon = ""
}

statusEffects[3] = {
  statusName = "Starvation",
  type = "damage",
  desc = "You are starving, you will take a slight amount of damage every 5 seconds",
  duration = "permenant",
  maxStacks = 1,
  icon = ""
}

--statusEffects[1] = { statusName = "Bleeding", type = "damage", amount = 10, tick = 6000, duration = 60000, desc = "Deals 10 damage every 6 seconds for 1 minute" }
--statusEffects[2] = { statusName = "Poison", type = "damage", amount = 15, tick = 5000, duration = 30000, desc = "Deals 15 damage every 5 seconds for 30 seconds" }
--statusEffects[3] = { statusName = "Fracture", type = "debuff", amount = 25, duration = "permenant", desc = "Slows movement speed by 25% until healed" }
--statusEffects[4] = { statusName = "Concussion", type = "debuff", duration = 10000, desc = "Blurs vision for 10 seconds" }
--statusEffects[5] = { statusName = "Stun", type = "debuff", duration = 5000, desc = "Can't move for 5 seconds" }

return statusEffects
