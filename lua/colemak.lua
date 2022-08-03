--[[
Note from vim.keymap.set helpfile:

{mode}  Mode short-name (map command prefix: "n", "i",
        "v", "x", …) or "!" for |:map!|, or empty string
        for |:map|.
]]

function keymap(keytable)
  for i, map in ipairs(keytable.commands) do
    vim.keymap.set('', map.new, map.qwerty)
  end

  for i, map in ipairs(keytable.textobjects) do
    vim.keymap.set('o', 
      keytable.selectin .. map.new, 
      'i' .. map.qwerty
    )
  end
  for i, map in ipairs(keytable.textobjects) do
    vim.keymap.set('o', 
      keytable.selectall .. map.new,
      'a' .. map.qwerty
    )
  end
end

colemakkeytable = {
  commands = {
    { qwerty = ':', new = 'O' },
    { qwerty = ';', new = 'o' },
    { qwerty = 'D', new = 'S' },
    { qwerty = 'd', new = 's' },
    { qwerty = 'E', new = 'F' },
    { qwerty = 'e', new = 'f' },
    { qwerty = 'F', new = 'T' },
    { qwerty = 'f', new = 't' },
    { qwerty = 'G', new = 'D' },
    { qwerty = 'g', new = 'd' },
    { qwerty = 'I', new = 'U' },
    { qwerty = 'i', new = 'u' },
    { qwerty = 'J', new = 'N' },
    { qwerty = 'j', new = 'n' },
    { qwerty = 'K', new = 'E' },
    { qwerty = 'k', new = 'e' },
    { qwerty = 'L', new = 'I' },
    { qwerty = 'l', new = 'i' },
    { qwerty = 'N', new = 'K' },
    { qwerty = 'n', new = 'k' },
    { qwerty = 'O', new = 'Y' },
    { qwerty = 'o', new = 'y' },
    { qwerty = 'P', new = ':' },
    { qwerty = 'p', new = ';' },
    { qwerty = 'R', new = 'P' },
    { qwerty = 'r', new = 'p' },
    { qwerty = 'S', new = 'R' },
    { qwerty = 's', new = 'r' },
    { qwerty = 'T', new = 'G' },
    { qwerty = 't', new = 'g' },
    { qwerty = 'U', new = 'L' },
    { qwerty = 'u', new = 'l' },
    { qwerty = 'Y', new = 'J' },
    { qwerty = 'y', new = 'j' },
  },
  selectin  = 'u',
  selectall = 'a',
  textobjects = {
    { qwerty = '"', new = '"' },
    { qwerty = '(', new = '(' },
    { qwerty = ')', new = ')' },
    { qwerty = '<', new = '<' },
    { qwerty = '>', new = '>' },
    { qwerty = 'B', new = 'B' },
    { qwerty = 'b', new = 'b' },
    { qwerty = 'p', new = ';' },
    { qwerty = 's', new = 'r' },
    { qwerty = 't', new = 'g' },
    { qwerty = 'W', new = 'W' },
    { qwerty = 'w', new = 'w' },
    { qwerty = '[', new = '[' },
    { qwerty = ']', new = ']' },
    { qwerty = '`', new = '`' },
    { qwerty = '{', new = '{' },
    { qwerty = '}', new = '}' },
    { qwerty = '\'', new = '\'' },
  },
}
