local fishvariable = 'Cyan'
local fishkeyword = 'DarkBlue'
local fishcomment = 'DarkRed'
local fishparenthesis = 'Green'
local fishstring = 'Brown'

local fishkeywords = {
  'if',           'for',    'break',    'function',
  'return',       'begin',  'and',      'switch',
  'end',          'cd',     'echo',     'printf',
  'set',          'read',   'string',   'math',
  'argparse',     'count',  'type',     'test',
  'contains',     'abbr',   'eval',     'source',
  'set_color',    'status', 'bind',     'commandline',
  'fish_config',  'random', 'basename', 'mv',

}
for i=1, #fishkeywords do
  vim.cmd('syntax keyword fishkeyword ' .. fishkeywords[i])
end
vim.cmd('highlight fishkeyword ctermfg=' .. fishkeyword)

vim.cmd('syntax match fishcomment "\\v#.*$"')
vim.cmd('highlight fishcomment ctermfg=' .. fishcomment)

vim.cmd('syntax match fishparenthesis "\\((\\|)\\)"')
vim.cmd('highlight fishparenthesis ctermfg=' .. fishparenthesis)

vim.cmd('syntax match fishvariable "$\\(\\w\\|\\d\\|_\\)\\+"')
vim.cmd('highlight fishvariable ctermfg=' .. fishvariable)

vim.cmd('syntax match fishstring "\\(\'\\|\\"\\).*\\(\'\\|\\"\\)"')
vim.cmd('highlight fishstring ctermfg=' .. fishstring)
