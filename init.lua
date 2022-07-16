--[[

> I was never embarrassed about asking someone, literally, "What
> should I paint?" because how is asking someone for ideas any
> different from looking for them in a magazine? 
                                                    --Andy Warhol

--]]

require('filetypes')
require('highlight')
require('status')
require('cipher')

--[[ Floating Windows {{{

The following section creates mappings for "floating windows" --
which the nvim documentation says are "useful to implement simple
widgets, such as tooltips displayed next to the cursor." Indeed
they are.

I have "implemented" a few "widgets" here:

- A bibliography;
- A todo list;
- A scratchpad for taking on-the-fly notes that instantly delete
  themselves.

To see the functions that generate these floating windows, go to:
lua/floatingwindows.lua

To get a sense of the tables that get passed to those functions
work, look a few lines down at the commented "bibliography"
table.

]]

require('floatingwindows')

-- The following table contains everything you need to make a
-- floating window.
bibliography  = {
  file        = '~/Bibliography/bibliography.bib',
  open        = false,        -- The float is not open... yet
  leader      = 'b',          -- Press <leader> then "b" to open float
  scratch     = false,        -- "Scratch" will make buffer delete instantly
  size        = { 0.8, 0.8 }, -- Width ratio, height ratio
  buffer      = 0,            -- Buffer number (initialized to zero)
  window      = 0,            -- Buffer window (initialized to zero)
  write       = true,         -- Should the buffer be written?
  options     = {}            -- Table of buffer-local options
}
mapfloatingwindow(bibliography)

todolist      = {
  file        = '~/.todo.md',
  open        = false,
  leader      = 't',
  scratch     = false,
  size        = { 0.6, 0.6 },
  buffer      = 0,
  window      = 0,
  write       = true,
  options     = {
    textwidth = 0,
  }
}
mapfloatingwindow(todolist)

scratchpad    = {
  file        = 'scratch',
  open        = false,
  leader      = 's',
  scratch     = true,
  size        = { 0.8, 0.8 },
  buffer      = 0,
  window      = 0,
  write       = false,
  options     = {
    textwidth = 0,
  }
}
mapfloatingwindow(scratchpad)

--}}}

--[[
The following mapping allows you to paste a quotation with <M-p>.
I use it with PDFs -- typically a pasted quotation will retain
line break where I don't want them. This joins all the lines,
removing any hyphenated words that were wrapped across lines.
]]
vim.keymap.set('n', '<M-p>',    function()
  require('strings')
  clipb = vim.split(vim.fn.getreg('+'), '\n')
  vim.api.nvim_set_current_line(joinstrings(clipb))
end)

--[[
Deletes unwanted artifacts from copying and pasting, including
"smart" quotes, m- and n-dashes, and (some) footnotes.
]]
vim.keymap.set('n', '<leader>q', function()
	require('quoteclean')
	quoteclean()
end)

-- Codeblock fencing -- should this be in another file?
vim.g.markdown_fenced_languages = {
  'awk', 'lua', 'perl', 'html',
  'sh', 'bash', 'bib',
}

vim.o.linebreak       = true
vim.o.textwidth       = 65
vim.o.autoindent      = true
vim.o.rnu             = true
vim.o.hlsearch        = false
vim.o.foldlevelstart  = 0
vim.o.foldmethod      = 'marker'
vim.o.expandtab       = true
vim.o.tabstop         = 4
vim.o.shiftwidth      = 4
vim.o.guifont         = "Courier:h16"
vim.o.shell           = '/usr/bin/fish'
vim.o.dictionary      = '/usr/share/dict/american-english'
vim.o.makeprg         = 'gcc %'

-- Add blank line above current
vim.keymap.set('n', '<leader>o', 'O<esc>D')
-- Capitalize entire word
vim.keymap.set('n', '<leader>u', 'gUaw')
-- Better moving between windows
vim.keymap.set('n', '<up>',      '<C-w>k')
vim.keymap.set('n', '<down>',    '<C-w>j')
vim.keymap.set('n', '<left>',    '<C-w>h')
vim.keymap.set('n', '<right>',   '<C-w>l')
-- Open previous buffer in split
vim.keymap.set('n', '<leader>p', '<cmd>rightbelow split #<cr>')
-- Cipher buffer
vim.keymap.set('n', '<leader>c', '<cmd>luado return encipher(line)<cr>')
-- Better normal mode
vim.keymap.set('i', 'jk',        '<esc>')
-- Cite
vim.keymap.set('i', '<M-c>',        '')
-- I don't like capitalizing
vim.cmd('cnorea myvimrc $MYVIMRC', false)

-- Check markdown boxes
vim.keymap.set('n', '<leader>d',  function()
  require('checkbox')
  local checkline = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(checkuncheck(checkline))
end)

-- Hide those pesky swapfiles
local backups   = vim.fn.expand('~/.vim-temp//')
vim.o.backupdir = backups
vim.o.directory = backups
vim.o.undodir   = backups
