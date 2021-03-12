function status_effects_init(e)
  statusEffects = require( "scriptbank\\CompleteRPGKit\\status_effects_data" ) -- Storage for status effect data
  charStatusEffects = {} -- Table of effects currently active on the player
end


function status_effects_main(e)
  for key, value in pairs( charStatusEffects ) do

  end
end


function addStatusEffect(name)
  for key, value in pairs( charStatusEffects ) do
    if name == value.statusName then
      -- status is already effecting player
    else
      table.insert(charStatusEffects, name)
    end
  end
end


function removeStatusEffect(name)
  for key, value in pairs( charStatusEffects ) do
    if name == value.statusName then
      table.remove(charStatusEffects, name)
    break end
  end
end
