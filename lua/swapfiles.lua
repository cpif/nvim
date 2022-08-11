-- Hide those pesky swapfiles

local backups   = vim.fn.expand('~/.vim-temp//')

vim.o.backupdir = backups
vim.o.directory = backups
vim.o.undodir   = backups
