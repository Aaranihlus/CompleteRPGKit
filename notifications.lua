function notifications_init(e)
  notifications = {}
  max_notifications = 10
  message_duration = 1000
end

function notifications_main(e)
  local y = 92
  for k, v in pairs(notifications) do
    v.message_duration = v.message_duration - 1
    if v.message_duration <= 0 then
      RemoveNotification(k)
    else
      y = y - 3
      TextCenterOnX(50, y, 1, v.message)
    end
  end
end

function NewNotification(message)
  for n = 1, max_notifications do
    if notifications[n] == nil then
      notifications[n] = { message = message, message_duration = message_duration }
    break end
  end
end

function RemoveNotification(index)
  table.remove(notifications, index)
end
