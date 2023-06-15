local setmap = vim.keymap.set

--[[ Floating Windows                                         {{{

     The following section creates mappings for "floating
     windows" -- which the nvim documentation says are "useful to
     implement simple widgets, such as tooltips displayed next to
     the cursor." Indeed they are.

     I have "implemented" a few "widgets" here:

     - A bibliography;
     - A todo list;
     - A scratchpad for taking on-the-fly notes that instantly delete
       themselves.

     To see the functions that generate these floating windows,
     go to: lua/floatingwindows.lua

     To get a sense of the tables that get passed to those
     functions work, look a few lines down at the commented
     "bibliography" table. ]]

require('floatingwindows')

-- Bibliography                                               {{{
mapfloatingwindow({
  file        = '~/biblio/bibliography.bib',
  open        = false,        -- The float is not open... yet
  leader      = 'b',          -- Press <leader> then "b" to open float
  scratch     = false,        -- "Scratch" will make buffer delete instantly
  size        = { 0.8, 0.8 }, -- Width ratio, height ratio
  buffer      = 0,            -- Buffer number (initialized to zero, will be updated by the f unction)
  window      = 0,            -- Buffer window (initialized to zero)
  write       = true,         -- Should the buffer be written?
  options     = {}            -- Table of buffer-local options
})
--}}}

-- To-do list                                                 {{{
mapfloatingwindow({
  file        = '~/.todo.md',
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
--}}}

-- Scratch edit window                                        {{{
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

--}}}

--[[ Paste quotations                                         {{{

     The following mapping allows you to paste a quotation with
     <M-p>. I use it with PDFs -- typically a pasted quotation
     will retain line break where I don't want them. This joins
     all the lines, removing any hyphenated words that were
     wrapped across lines. ]]

setmap('n', '<M-p>', function()
  require('strings')
  local clipb = vim.split(vim.fn.getreg('+'), '\n')
  vim.api.nvim_set_current_line(joinstrings(clipb))
end)

--}}}

--[[ Remove copy/paste artifacts                              {{{

     Deletes unwanted artifacts from copying and pasting,
     including "smart" quotes and m- and n-dashes. ]]

setmap('n', '<leader>q', function()
	require('strings')
	quoteclean()
end)

--}}}

-- Add blank line above the current one                       {{{
setmap('n', '<leader>o', 'O<esc>0D')
--}}}

-- Generate tag files                                         {{{
setmap('n', '<leader>t', function()
    require('bibliography')
    bibtags() 
  end)
--}}}

-- Better moving between windows                              {{{
setmap('n', '<up>',    '<C-w>k')
setmap('n', '<down>',  '<C-w>j')
setmap('n', '<left>',  '<C-w>h')
setmap('n', '<right>', '<C-w>l')
--}}}

-- Emacs insert mode motions                                  {{{
setmap('i', '<C-B>', '<Left>')
setmap('i', '<C-F>', '<Right>')
setmap('i', '<A-b>', '<C-Left>')
setmap('i', '<A-f>', '<C-Right>')
--}}}

-- Cipher buffer                                              {{{
setmap('n', '<leader>c', function() 
  require('cipher')
  processtext(encipher)
end)
--}}}

-- Check markdown boxes                                       {{{
setmap('n', '<leader>d',  function()
  require('checkbox')
  local checkline = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(checkuncheck(checkline))
end)
--}}}

