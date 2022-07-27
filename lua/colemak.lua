--[[
Note from vim.keymap.set helpfile:

{mode}  Mode short-name (map command prefix: "n", "i",
        "v", "x", …) or "!" for |:map!|, or empty string
        for |:map|.
]]

function colemakmap(colemakkeytable)
  for i, map in ipairs(keytable) do
    vim.keymap.set('', 
      map.colemak, map.qwerty, 
      { remap = true }
    )
  end
end

colemakkeytable = {
  { qwerty = 'd', colemak = 's' }
  { qwerty = 'e', colemak = 'f' }
  { qwerty = 'f', colemak = 't' }
  { qwerty = 'g', colemak = 'd' }
  { qwerty = 'i', colemak = 'u' }
  { qwerty = 'j', colemak = 'n' }
  { qwerty = 'k', colemak = 'e' }
  { qwerty = 'l', colemak = 'i' }
  { qwerty = 'n', colemak = 'k' }
  { qwerty = 'o', colemak = 'y' }
  { qwerty = 'p', colemak = ';' }
  { qwerty = 'r', colemak = 'p' }
  { qwerty = 's', colemak = 'r' }
  { qwerty = 't', colemak = 'g' }
  { qwerty = 'u', colemak = 'l' }
  { qwerty = 'y', colemak = 'j' }
  { qwerty = ';', colemak = 'o' }
}
