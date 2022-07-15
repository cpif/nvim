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
}
mapfloatingwindow(scratchpad)

--}}}

-- Delete unwanted copy-paste artifacts
vim.keymap.set('n', '<leader>q', function()
	require('quoteclean')
	quoteclean()
end)

-- Codeblock fencing -- should this be in another file?
vim.g.markdown_fenced_languages = {
  'awk', 'lua', 'perl', 'html',
  'sh', 'bash', 'bib',
}

-- Requirements -- obviously these go somewhere else
require('cipher')

-- Default options
-- I like the idea of keeping these in the init.lua
-- Is there a way to make them more "literate"? I don't care
-- about overspecifying them -- this is the most boring part.
-- What will matter is indicating which ones are relevant for
-- editing writing.
local options           = vim.o   -- Kind of distracting

-- I think these two encoding lines need to run every time a new
-- file opens? And `encoding` isn't the right option anyhow, lol.
-- Do `:h fileencoding`
options.encoding        = 'utf-8'
options.fileformat      = 'unix'

options.linebreak       = true
options.textwidth       = 65
options.autoindent      = true
options.number          = false
options.rnu             = true
options.hlsearch        = false
options.foldlevelstart  = 0
options.foldmethod      = 'marker'
options.expandtab       = true
options.tabstop         = 4
options.shiftwidth      = 4
options.guifont         = "Courier:h16"
options.shell           = '/usr/bin/fish'
options.dictionary      = '/usr/share/dict/american-english'
options.makeprg         = 'gcc %'

require('highlight')
require('status')

-- Mappings and abbreviations 
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

-- Experimental: pasting quotations
vim.keymap.set('n', '<M-p>',    function()
  require('strings')
  clipb = vim.split(vim.fn.getreg('+'), '\n')
  vim.api.nvim_set_current_line(joinstrings(clipb))
end)

-- Experimental: checking markdown boxes
vim.keymap.set('n', '<leader>d',  function()
  require('checkbox')
  local checkline = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(checkuncheck(checkline))
end)

-- Undo and swap directories 
vim.cmd('set backupdir=~/.vim-temp//')
vim.cmd('set directory=~/.vim-temp//')
vim.cmd('set undodir=~/.vim-temp//')

require('filetypes')
