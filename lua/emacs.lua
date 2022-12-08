-- A bunch of insert mode controls aren't very useful to me in
-- vim -- mostly autocompletions. These are useful motions in
-- emacs, which I would like to learn. So this is an evil
-- remapping.

-- hello hello hello hello hello hello 

vim.keymap.set('i', '<C-B>', '<Left>')
vim.keymap.set('i', '<C-F>', '<Right>')
vim.keymap.set('i', '<A-b>', '<C-Left>')
vim.keymap.set('i', '<A-f>', '<C-Right>')
