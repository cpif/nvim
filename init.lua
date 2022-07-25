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
require('startdir')

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
mapfloatingwindow({
  file        = '~/Bibliography/bibliography.bib',
  open        = false,        -- The float is not open... yet
  leader      = 'b',          -- Press <leader> then "b" to open float
  scratch     = false,        -- "Scratch" will make buffer delete instantly
  size        = { 0.8, 0.8 }, -- Width ratio, height ratio
  buffer      = 0,            -- Buffer number (initialized to zero)
  window      = 0,            -- Buffer window (initialized to zero)
  write       = true,         -- Should the buffer be written?
  options     = {}            -- Table of buffer-local options
})

mapfloatingwindow({
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

-- Syntax highlighting in markdown fenced blocks
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
vim.o.dictionary      = '/usr/share/dict/american-english'
vim.o.equalprg        = 'pandoc'

--[[
I use John MacFarlane's wonderful pandoc to convert markdown to
Word documents. Here I set it up as my `makeprg`.

I love the fish shell, but it works like shit on WSL so I use
bash. The `cmdsub` external decides which shell I'm using and
picks the syntax for command substitutions (the fish shell uses
parentheses instead of bash's backticks).
]]
require('cmdsub')
local docout          = ' -o ' .. lcmdsub .. 'basename % .md' .. rcmdsub .. '.docx'
vim.o.makeprg         = 'pandoc % -dbasic ' .. docout

-- Add blank line above current line
vim.keymap.set('n', '<leader>o', 'O<esc>0D')

--[[
This mapping capitalizes the entire word.

It's not that hard to type `gUaw` or `gUiw` -- and most of the
time I end up doing that anyway because I forgot I did this. But
I read about how unnecessary the caps lock key is and believed
it, so I got rid of it. Only problem is: OCCASIONALLY it's nice
to type a word in all caps (like PDF), or a shell-style variable
(like $MYVIMRC).
]]
vim.keymap.set('n', '<leader>u', 'gUaw')
vim.cmd('cnorea myvimrc $MYVIMRC', false)

-- Better moving between windows
vim.keymap.set('n', '<up>',      '<C-w>k')
vim.keymap.set('n', '<down>',    '<C-w>j')
vim.keymap.set('n', '<left>',    '<C-w>h')
vim.keymap.set('n', '<right>',   '<C-w>l')

-- Open previous buffer in split
vim.keymap.set('n', '<leader>p', '<cmd>rightbelow split #<cr>')

-- Cipher buffer
vim.keymap.set('n', '<leader>c', '<cmd>luado return encipher(line)<cr>')

-- Better normal mode -- thanks Steve
vim.keymap.set('i', 'jk',        '<esc>')

-- Cite a source from a tag file
vim.keymap.set('i', '<leader>c', '')

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
