local map = vim.keymap.set

-- Move around à la emacs in insert mode
map('i', '<C-B>', '<Left>')
map('i', '<C-F>', '<Right>')
map('i', '<A-b>', '<C-Left>')
map('i', '<A-f>', '<C-Right>')

-- UPPERCASE LINE
map('i', '<M-u>', 'gUU`]a')

-- Deletes unwanted artifacts from copying and pasting
map('n', '<leader>q', function() quoteclean() end)

-- Paste, removing typical PDF artifacts
map('n', '<M-p>', function()
  clipb = vim.split(vim.fn.getreg('+'), '\n')
  vim.api.nvim_set_current_line(joinstrings(clipb))
end)

-- Add blank line above current line
map('n', '<leader>o', 'O<esc>0D')

-- Run ctags on bibliography
map('n', '<leader>t', function() bibtags() end)

-- I love the `g-<ctrl-a>` command, but tmux eats it.
map('v', '<leader>a', 'g<C-a>')
map('n', '<leader>a', '<C-a>')

-- HTML comment
map('n', '<leader>c', 'o<!63A-4o64A-A>kk')

-- Check markdown boxes
map('n', '<leader>d',  function()
  local checkline = vim.api.nvim_get_current_line()
  vim.api.nvim_set_current_line(checkuncheck(checkline))
end)

-- Escape gets you out of term mode
map('t', '<C-[>', '<C-\\><C-N>')
