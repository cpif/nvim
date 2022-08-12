-- Cite sources
vim.keymap.set('i', '<F2>', '')

-- Make the tagfile from the bibliography globally available
local bibtags = vim.o.tags .. ',' .. vim.fn.expand('~/Bibliography/tags')
vim.o.tags    = bibtags
