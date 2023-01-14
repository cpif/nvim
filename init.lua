--[[
> I was never embarrassed about asking someone, literally, "What
> should I paint?" because how is asking someone for ideas any
> different from looking for them in a magazine? 
                                                -- Andy Warhol ]]
require('abbreviations')
require('bibliography')
require('filetypes')
require('floatingwindows')
--require('highlight')
require('maps')
require('netrw')
require('opts')
require('plug')
require('status')
require('system')
require('trick')
require('utils')

--[[ Floating Windows                                         {{{

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
mapfloatingwindow({
  file        = '~/bibliography/bibliography.bib',
  open        = false,        -- The float is not open... yet
  leader      = 'b',          -- Press <leader> then "b" to open float
  scratch     = false,        -- "Scratch" will make buffer delete instantly
  size        = { 0.8, 0.8 }, -- Width ratio, height ratio
  buffer      = 0,            -- Buffer number (initialized to zero, will be updated by the function)
  window      = 0,            -- Buffer window (initialized to zero)
  write       = true,         -- Should the buffer be written?
  options     = {}            -- Table of buffer-local options
})

mapfloatingwindow({
  file        = '~/wiki/todo.md',
  open        = false,
  leader      = 'l',
  scratch     = false,
  size        = { 0.6, 0.6 },
  buffer      = 0,
  window      = 0,
  write       = true,
  options     = {
    textwidth = 0,
  }
})

mapfloatingwindow({
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
})

--}}}

--[[ Keymaps                                                  {{{

--[[
Deletes unwanted artifacts from copying and pasting, including
"smart" quotes and m- and n-dashes. ]]
vim.keymap.set('n', '<leader>q', function()
	require('utils')
	quoteclean()
end)

-- Add blank line above current line
vim.keymap.set('n', '<leader>o', 'O<esc>0D')

-- Run ctags on bibliography
vim.keymap.set('n', '<leader>t', function() bibtags() end)

-- Update statusline (why? to update the wordcount)
vim.keymap.set('n', '<leader>w',
  function() vim.wo.statusline = setstatus() end)

-- I love the `g-<ctrl-a>` command, but tmux eats it.
vim.keymap.set('v', '<leader>a', 'g<C-a>')
vim.keymap.set('n', '<leader>a', '<C-a>')

-- Better moving between windows
vim.keymap.set('n', '<up>',    '<C-w>k')
vim.keymap.set('n', '<down>',  '<C-w>j')
vim.keymap.set('n', '<left>',  '<C-w>h')
vim.keymap.set('n', '<right>', '<C-w>l')

-- Cipher buffer
vim.keymap.set('n', '<leader>c', function() 
  require('cipher')
  processtext(encipher)
end)

-- Better normal mode -- thanks Steve
-- vim.keymap.set('i', 'jk', '<esc>')
-- (currently disabled for muscle-memory reasons)

-- Tag completion
vim.keymap.set('i', '<F2>', '')

-- Check markdown boxes
vim.keymap.set('n', '<leader>d',  function()
  require('checkbox')
  local checkline = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(checkuncheck(checkline))
end)
-- }}}

--[[ Set makeprg to pandoc                                    {{{
I use John MacFarlane's wonderful pandoc to convert markdown to
Word documents. Here I set it up as my `makeprg`.

I love the fish shell, but it works like shit on WSL so I use
bash. The `cmdsub` external decides which shell I'm using and
picks the syntax for command substitutions (the fish shell uses
parentheses instead of bash's backticks). ]]
local docout  = ' -o ' .. lcmdsub .. 'basename % .md' .. rcmdsub
  .. '.docx'
vim.o.makeprg = 'pandoc % -dbasic ' .. docout
-- }}}
