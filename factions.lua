function factions_init (e)

  factions = {}

  factions[1] = {
    factionName = "Nightfall Pact",

    factionDescription = [[A secretive, loosely connected collection of
    small groups of thieves and killers. They usually keep themselves and their
    business private to the outside world, and work only with their peers to
    accomplish their goals.

    Despite this, they have been known to perform
    assassinations or to spy on individuals and other organisations for
    well-paying members of the public.

    Though not necessarily evil, some question their methods and even more
    question their history, many do not even acknowledge their existence and
    treat them as myth, crafted a long time ago and passed down
    through generations.]],

    factionIcon = "",

    ranks = {
      [1] = { rankName = "Initiate", requiredReputation = 1000 },
      [2] = { rankName = "Acolyte", requiredReputation = 2000 },
      [3] = { rankName = "Journeyman", requiredReputation = 4000 }
    },

    currentRank = 0,
    currentReputation = 0
  }





end



function factions_main (e)

  if menuSelected == 5 and menuOpen == true then -- menu open

    --[[for k, v in pairs(factions[1].ranks) do
      print(v.rankName)
    end]]--

  end

end
