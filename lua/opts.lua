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
vim.o.ignorecase      = true
vim.o.smartcase       = true

local backups         = vim.fn.expand('~/.vim-temp//')
vim.o.backupdir       = backups
vim.o.directory       = backups
vim.o.undodir         = backups

vim.go.guicursor =
  'i-ci:ver30-iCursor-blinkwait500-blinkon250-blinkoff250'

vim.g.vimwiki_list = {{
  path    = '~/wiki',
  syntax  = 'markdown',
  ext     = '.md',
}}
