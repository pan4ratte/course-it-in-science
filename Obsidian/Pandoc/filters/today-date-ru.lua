local months_ru = {
  "января", "февраля", "марта", "апреля", "мая", "июня",
  "июля", "августа", "сентября", "октября", "ноября", "декабря"
}

local function get_russian_date()
  local t = os.date("*t")
  return string.format("%d %s %d г.", t.day, months_ru[t.month], t.year)
end

-- Replaces $today in titles, subtitles, headers, and body text
function Str(el)
  if el.text:find("%$today") then
    return pandoc.Str(el.text:gsub("%$today", get_russian_date()))
  end
end

-- Replaces $today in plain unformatted metadata fields
function Meta(m)
  local russian_date = get_russian_date()
  for key, val in pairs(m) do
    if val.t == "MetaString" and val.text:find("%$today") then
      m[key] = val.text:gsub("%$today", russian_date)
    end
  end
  return m
end