-- Requirements {{{
scratchopen = false
require('cipher')
require('notepad')
-- }}}

-- Default options {{{
local options = vim.o

options.encoding        = 'utf-8'
options.fileformat      = 'unix'
options.linebreak       = true
options.textwidth       = 65
options.autoindent      = true
options.number          = true
options.rnu             = true
options.hlsearch        = false
options.foldlevelstart  = 0
options.foldmethod      = 'marker'
options.expandtab       = true
options.tabstop         = 4
options.shiftwidth      = 4
options.guifont = "Courier:h16"
options.shell           = '/usr/bin/fish'
options.dictionary      = '/usr/share/dict/american-english'
options.makeprg         = 'gcc %'
-- }}}

-- Display settings {{{
local basic = {
  foreground  = 'black',
  background  = '#eeeeee',
  ctermfg     = 'grey',
  ctermbg     = 'black'
}

vim.api.nvim_set_hl(0, 'Normal', basic)

vim.api.nvim_set_hl(0, 'LineNr', basic)

vim.api.nvim_set_hl(0, 'Pmenu', basic)

vim.api.nvim_set_hl(0, 'FloatBorder', basic)

vim.api.nvim_set_hl(0, 'Folded', {
  foreground  = 'black',
  background  = '#eeeeee',
  ctermfg='black',
  ctermbg='darkcyan'
})

vim.api.nvim_set_hl(0, 'FoldColumn', {
  foreground  = 'black',
  background  = '#eeeeee',
  ctermfg='darkcyan',
  ctermbg='black'
})

function setstatus()
  local shrug = '¯\\_(ツ)_/¯'
  local file = '%f'
  local line = '%l'
  local column = '%v'
  return string.format(
    '%-13s %.40s LINE:%3s/COL:%3s',
    shrug,
    file,
    line,
    column
  )
end

vim.o.statusline = setstatus()
--}}}

-- Mappings and abbreviations {{{
-- Add blank line above current
vim.keymap.set('n', '<leader>o', 'O<esc>D')
-- Capitalize entire word
vim.keymap.set('n', '<leader>u', 'gUaw')
-- Magic searching
vim.keymap.set('n', '/',         '/\\v')
vim.keymap.set('n', '?',         '?\\v')
-- Better moving between windows
vim.keymap.set('n', '<up>',      '<C-w>k')
vim.keymap.set('n', '<down>',    '<C-w>j')
vim.keymap.set('n', '<left>',    '<C-w>h')
vim.keymap.set('n', '<right>',   '<C-w>l')
-- Open previous buffer in split
vim.keymap.set('n', '<leader>p', '<cmd>rightbelow split #<cr>')
-- Open scratchpad
vim.keymap.set('n', '<leader>s', function ()
  if scratchopen == false then
    scratchpad()
    scratchopen = true
  else
    cscratchpad()
    scratchopen = false
  end
end)
-- Cipher buffer
vim.keymap.set('n', '<leader>c', '<cmd>luado return encipher(line)<cr>')
-- Better normal mode
vim.keymap.set('i', 'jk',        '<esc>')
-- I don't like capitalizing
vim.api.nvim_exec('cnorea myvimrc $MYVIMRC', false)
--}}}

-- Undo and swap directories {{{
vim.api.nvim_exec('set backupdir=~/.vim-temp//', false)
vim.api.nvim_exec('set directory=~/.vim-temp//', false)
vim.api.nvim_exec('set undodir=~/.vim-temp//', false)
-- }}}

-- Filetype-specific settings {{{
local wrapless = vim.api.nvim_create_augroup("wrapless", {
    clear = false
})

local spreadsheets = vim.api.nvim_create_augroup("spreadsheets", {
    clear = false
})

vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal textwidth=0",
  group   = wrapless,
  once    = false,
  pattern = {"html",
             "awk",
             "fish",
}})

vim.api.nvim_create_autocmd("BufEnter", {
  command = "setlocal textwidth=0",
  group   = spreadsheets,
  once    = false,
  pattern = {"*.tsv",
             "*.csv",
}})

vim.api.nvim_create_autocmd("BufEnter", {
  command = "setlocal noexpandtab",
  group   = spreadsheets,
  once    = false,
  pattern = {"*.tsv",
             "*.csv",
}})

vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal tabstop=2",
  once    = false,
  pattern = {"yaml",
             "lua",
}})

vim.api.nvim_create_autocmd("FileType", {
  command = "setlocal shiftwidth=2",
  once    = false,
  pattern = {"yaml",
             "lua",
}})
-- }}}
