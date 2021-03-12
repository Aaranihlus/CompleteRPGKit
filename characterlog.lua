function characterlog_init(e)
  characterLog = {}
end

function newLogEntry(text)
  table.insert(characterLog, text)
end


function characterlog_main(e)

  if playerTrading then
    PasteSpritePosition ( characterLogSprite , 200 , 200 )
  else
    PasteSpritePosition ( characterLogSprite , 80 , 84 )
  end

  y = 100
  for i = 1, 10 do
    if characterLog[i] ~= nil then
      Text(80, y, 1, characterLog[i])
      y = y - 1
    end
  end


end
