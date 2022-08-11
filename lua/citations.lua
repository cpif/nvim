-- Cite sources
vim.keymap.set('i', '<F2>', '')

-- Make the tagfile from the bibliography globally available
vim.o.tags            = vim.fn.expand('~/Bibliography/') .. 'tags'
