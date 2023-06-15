--[[ This file is a testament to how it may, sometimes, be
     simpler to do it in vimscript.

     TODO: find out if there's a less stupid way. ]]

local wrapless = vim.api.nvim_create_augroup('wrapless', {
    clear = true
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'setlocal textwidth=0',
  group   = wrapless,
  once    = false,
  pattern = {'html',
             'awk',
             'fish',
}})

local spelling = vim.api.nvim_create_augroup('spellcheck', {
  clear = true
})

vim.api.nvim_create_autocmd('FileType', {
  command = 'setlocal spell',
  group   = spelling,
  once    = false,
  pattern = {'markdown',
             'tex',
}})

local spreadsheets = vim.api.nvim_create_augroup('spreadsheets', {
    clear = true
})

vim.api.nvim_create_autocmd('BufEnter', {
  command = 'setlocal textwidth=0',
  group   = spreadsheets,
  once    = false,
  pattern = {'*.tsv',
             '*.csv',
}})

vim.api.nvim_create_autocmd('BufEnter', {
  command = 'setlocal noexpandtab',
  group   = spreadsheets,
  once    = false,
  pattern = {'*.tsv',
             '*.csv',
}})

vim.api.nvim_create_autocmd('FileType', {
  command = 'setlocal tabstop=2',
  once    = false,
  pattern = {'yaml',
             'lua',
             'html',
}})

vim.api.nvim_create_autocmd('FileType', {
  command = 'setlocal shiftwidth=2',
  once    = false,
  pattern = {'yaml',
             'lua',
             'html',
}})

-- autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

vim.api.nvim_create_autocmd('FileType', {
  command = 'set omnifunc=htmlcomplete#CompleteTags',
  once    = false,
  pattern = {'html',}
})

-- LaTeX template (very rudimentary)

vim.api.nvim_create_autocmd('BufNewFile', {
  command = '0r ~/.vimplates/tex',
  once    = false,
  pattern = {'*.tex',}
})

-- Markdown previews?

if ( markdownpreview == 1 ) then
  vim.api.nvim_create_autocmd('BufWritePost', {
    callback = mdprev,
    pattern  = {"*.md"},
  })
end
