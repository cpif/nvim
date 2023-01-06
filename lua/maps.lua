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


