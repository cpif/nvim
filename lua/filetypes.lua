local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local wrapless = augroup('wrapless', { clear = true })

autocmd('FileType', {
  command = 'setlocal textwidth=0',
  group   = wrapless,
  once    = false,
  pattern = {'html',
             'awk',
             'fish',
}})

local spreads = augroup('spreads', { clear = true })

autocmd('BufEnter', {
  command = 'setlocal textwidth=0',
  group   = spreads,
  once    = false,
  pattern = {'*.tsv',
             '*.csv',
}})

autocmd('BufEnter', {
  command = 'setlocal noexpandtab',
  group   = spreads,
  once    = false,
  pattern = {'*.tsv',
             '*.csv',
}})

autocmd('FileType', {
  command = 'setlocal tabstop=2',
  once    = false,
  pattern = {'yaml',
             'lua',
             'html',
             'elm',
}})

autocmd('FileType', {
  command = 'setlocal shiftwidth=2',
  once    = false,
  pattern = {'yaml',
             'lua',
             'html',
             'elm',
}})

local spellcheck = augroup('spellcheck', { clear = true })

autocmd('FileType', {
  command = 'setlocal spell',
  once    = false,
  pattern = {'markdown',
             'tex',
             'text',
}})

autocmd('FileType', {
  command = 'set omnifunc=htmlcomplete#CompleteTags',
  once    = false,
  pattern = {'html',}
})

autocmd('BufNewFile', {
  command = '0r ~/.vimplates/tex',
  once    = false,
  pattern = {'*.tex',}
})
