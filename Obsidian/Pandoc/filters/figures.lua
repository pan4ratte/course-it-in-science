-- figures.lua — captionless standalone images get the "Figure" style
local function only_image(el)
  return #el.content == 1 and el.content[1].t == 'Image'
end

function Para(el)
  if only_image(el) then
    return pandoc.Div(el, pandoc.Attr('', {}, {['custom-style'] = 'Figure'}))
  end
end

function Plain(el)   -- images inside tight lists arrive as Plain
  if only_image(el) then
    return pandoc.Div(el, pandoc.Attr('', {}, {['custom-style'] = 'Figure'}))
  end
end