--[[
Note from vim.keymap.set helpfile:

{mode}  Mode short-name (map command prefix: "n", "i",
        "v", "x", …) or "!" for |:map!|, or empty string
        for |:map|.
]]

function colemakmap(colemakkeytable)
  for i, map in ipairs(colemakkeytable) do
    vim.keymap.set('', map.colemak, map.qwerty)
  end
end

colemakkeytable = {
  -- Lowercase, normal mode
  { qwerty = 'd', colemak = 's' },
  { qwerty = 'e', colemak = 'f' },
  { qwerty = 'f', colemak = 't' },
  { qwerty = 'g', colemak = 'd' },
  { qwerty = 'i', colemak = 'u' },
  { qwerty = 'j', colemak = 'n' },
  { qwerty = 'k', colemak = 'e' },
  { qwerty = 'l', colemak = 'i' },
  { qwerty = 'n', colemak = 'k' },
  { qwerty = 'o', colemak = 'y' },
  { qwerty = 'p', colemak = ';' },
  { qwerty = 'r', colemak = 'p' },
  { qwerty = 's', colemak = 'r' },
  { qwerty = 't', colemak = 'g' },
  { qwerty = 'u', colemak = 'l' },
  { qwerty = 'y', colemak = 'j' },
  { qwerty = ';', colemak = 'o' },
  -- Uppercase, normal mode
  { qwerty = 'D', colemak = 'S' },
  { qwerty = 'E', colemak = 'F' },
  { qwerty = 'F', colemak = 'T' },
  { qwerty = 'G', colemak = 'D' },
  { qwerty = 'I', colemak = 'U' },
  { qwerty = 'J', colemak = 'N' },
  { qwerty = 'K', colemak = 'E' },
  { qwerty = 'L', colemak = 'I' },
  { qwerty = 'N', colemak = 'K' },
  { qwerty = 'O', colemak = 'Y' },
  { qwerty = 'P', colemak = ';' },
  { qwerty = 'R', colemak = 'P' },
  { qwerty = 'S', colemak = 'R' },
  { qwerty = 'T', colemak = 'G' },
  { qwerty = 'U', colemak = 'L' },
  { qwerty = 'Y', colemak = 'J' },
  { qwerty = ';', colemak = 'O' },
}
