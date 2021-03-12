function jump_handle_init(e)
  keyInput = false
end




function jump_handle_main(e)

  if GetScancode() == 57 and not keyInput then
    ForcePlayer ( -180, 100 )
    keyInput = true
  elseif GetScancode() > 0 then
    keyInput = true
  else
    keyInput = false
  end

end
