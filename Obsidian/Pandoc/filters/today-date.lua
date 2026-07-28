function Meta(m)
  if m.date then
    local date_str = pandoc.utils.stringify(m.date)
    -- Check if the date field contains "$today"
    if date_str:find("%$today") then
      local current_date = os.date("%B %d, %Y")
      -- Replace "$today" with the actual date
      m.date = date_str:gsub("%$today", current_date)
    end
  end
  return m
end