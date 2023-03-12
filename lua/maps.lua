-- Move around à la emacs in insert mode

vim.keymap.set('i', '<C-B>', '<Left>')
vim.keymap.set('i', '<C-F>', '<Right>')
vim.keymap.set('i', '<A-b>', '<C-Left>')
vim.keymap.set('i', '<A-f>', '<C-Right>')

-- Paste, removing typical PDF artifacts

vim.keymap.set('n', '<M-p>',    function()
  require('utils')
  clipb = vim.split(vim.fn.getreg('+'), '\n')
  vim.api.nvim_set_current_line(joinstrings(clipb))
end)

--[[ Deletes unwanted artifacts from copying and pasting,
including "smart" quotes and m- and n-dashes. ]]
vim.keymap.set('n', '<leader>q', function()
	require('utils')
	quoteclean()
end)

-- Make a line uppercase
vim.keymap.set('i', '<M-u>', 'gUU`]a')

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

