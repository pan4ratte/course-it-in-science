--[[
  list-styles.lua  —  pandoc Markdown → docx

  Applies your Word list styles to every list item, per nesting level, instead
  of pandoc's built-in "Compact" style.

  Why this is needed: pandoc draws the bullets/numbers themselves through Word
  numbering definitions (numPr), not through a paragraph style. Separately it
  tags tight-list items with "Compact" and loose-list items with no style, and
  it NEVER uses "List Bullet"/"List Number". This filter attaches the correct
  leveled style to each list paragraph while leaving the numbering intact, so
  bullets and numbers still render exactly as before.

  Level mapping (nesting depth 1..6 -> style name):
      bullets:  List Bullet, List Bullet 2 ... List Bullet 6
      numbers:  List Number, List Number 2 ... List Number 6
  Depths beyond the table length reuse the last entry. Edit the two tables
  below to match the *style names* (not IDs) that exist in your reference.docx.

  Requirements:
    * Run with  --reference-doc=your-reference.docx  containing these styles.
    * pandoc 2.x or 3.x.

  Handles: tight and loose lists, arbitrary nesting, mixed bullet/number
  nesting, and lists inside block quotes / fenced divs.
]]

local BULLET_STYLES = {
  "List Bullet", "List Bullet 2", "List Bullet 3",
  "List Bullet 4", "List Bullet 5", "List Bullet 6",
}
local NUMBER_STYLES = {
  "List Number", "List Number 2", "List Number 3",
  "List Number 4", "List Number 5", "List Number 6",
}

local function pick(styles, level)
  return styles[math.min(level, #styles)]
end

-- forward declarations (mutual recursion)
local style_list, transform_blocks

-- Style the blocks of a single list item sitting at depth `level`.
local function style_item(item, styles, level)
  local out = {}
  for _, b in ipairs(item) do
    if b.t == "Para" then
      out[#out + 1] = pandoc.Div(b, { ["custom-style"] = pick(styles, level) })
    elseif b.t == "Plain" then
      out[#out + 1] = pandoc.Div(pandoc.Para(b.content), { ["custom-style"] = pick(styles, level) })
    elseif b.t == "BulletList" then
      out[#out + 1] = style_list(b, BULLET_STYLES, level + 1)
    elseif b.t == "OrderedList" then
      out[#out + 1] = style_list(b, NUMBER_STYLES, level + 1)
    elseif b.t == "BlockQuote" or b.t == "Div" then
      b.content = transform_blocks(b.content, level + 1)
      out[#out + 1] = b
    else
      out[#out + 1] = b -- code blocks, tables, etc.: leave untouched
    end
  end
  return out
end

style_list = function(el, styles, level)
  for i, item in ipairs(el.content) do
    el.content[i] = style_item(item, styles, level)
  end
  return el
end

-- Process a block sequence that is NOT directly inside a list item.
-- `base` is the depth to assign to any top-level list found here (1 at the
-- document root; deeper when reached through a quote/div inside a list item).
transform_blocks = function(blocks, base)
  base = base or 1
  local out = {}
  for _, b in ipairs(blocks) do
    if b.t == "BulletList" then
      out[#out + 1] = style_list(b, BULLET_STYLES, base)
    elseif b.t == "OrderedList" then
      out[#out + 1] = style_list(b, NUMBER_STYLES, base)
    elseif b.t == "BlockQuote" or b.t == "Div" then
      b.content = transform_blocks(b.content, base)
      out[#out + 1] = b
    else
      out[#out + 1] = b
    end
  end
  return out
end

function Pandoc(doc)
  doc.blocks = transform_blocks(doc.blocks, 1)
  return doc
end