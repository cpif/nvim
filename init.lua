local api             = vim.api
local aucmd           = vim.api.nvim_create_autocmd
local augrp           = vim.api.nvim_create_augroup
local backup          = vim.fn.expand('~/.vim-temp//')
local filebrowseropen = false
local func            = vim.fn
local global          = vim.go
local global_var      = vim.g
local map             = vim.keymap.set
local netrwwin
local opt             = vim.o
local setline         = vim.api.nvim_set_current_line
local window          = vim.wo

local bib = {
  opt.tags,
  func.expand('~/biblio/tags'),
  func.expand('~/dissertation/tags')
}

local hls = {
  DiffAdd       = { ctermbg = 8,  },
  DiffChange    = { ctermbg = 8,  },
  DiffDelete    = { ctermbg = 8,  },
  DiffText      = { ctermbg = 8,  bold = true },
  Folded        = { ctermbg = 1,  ctermfg = 0 },
  NormalFloat   = { ctermbg = 0,  ctermfg = 7 },
  SpellBad      = { ctermfg = 11, underline = true },
  SpellCap      = { ctermfg = 11, underline = true },
  nroffRequest  = { ctermfg = 8,  },
}

map('n', '<M-l>', function()
  local ipsum = {
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur adipiscing elit duis tristique sollicitudin nibh. Elementum pulvinar etiam non quam. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Eget dolor morbi non arcu risus quis varius. Etiam tempor orci eu lobortis elementum. Ultricies integer quis auctor elit sed. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras. Viverra suspendisse potenti nullam ac tortor vitae purus faucibus ornare. Faucibus a pellentesque sit amet porttitor eget dolor. Urna condimentum mattis pellentesque id nibh.',
  '',
  'Ridiculus mus mauris vitae ultricies leo integer malesuada. Sed odio morbi quis commodo odio aenean sed adipiscing diam. Felis imperdiet proin fermentum leo vel. Sed arcu non odio euismod lacinia at quis risus. Morbi quis commodo odio aenean. Sociis natoque penatibus et magnis dis parturient montes nascetur. Sed blandit libero volutpat sed cras ornare. Vitae sapien pellentesque habitant morbi tristique. In mollis nunc sed id semper risus. Iaculis urna id volutpat lacus laoreet non curabitur gravida. Tincidunt augue interdum velit euismod in pellentesque massa. Ac felis donec et odio pellentesque diam volutpat commodo sed. Quis ipsum suspendisse ultrices gravida dictum fusce ut. Elementum tempus egestas sed sed. Quam viverra orci sagittis eu volutpat. Maecenas pharetra convallis posuere morbi leo urna molestie at.',
  }
  api.nvim_buf_set_lines(0, 0, -1, true, ipsum)
end)

vim.cmd('cnorea myvimrc $MYVIMRC', false)
vim.cmd('inorea precuation precaution', false)
vim.cmd('inorea precuations precautions', false)
vim.cmd('ia knoweldge knowledge', false)

map('n', '<leader>t', function()
  vim.cmd([[silent !ctags
    \ -f ~/biblio/tags
    \ --language-force=bibtex
    \ ~/biblio/bibliography.bib
    \ 2> /dev/null]])
  vim.cmd([[silent !ctags
    \ -f ~/dissertation/tags
    \ --language-force=bibtex
    \ ~/dissertation/bibliography.bib
    \ 2> /dev/null]])
end)

map('n', '<leader>f', function()
  if filebrowseropen then
    api.nvim_win_close(netrwwin, false)
    filebrowseropen = false
  else
    vim.cmd('Vexplore')
    filebrowseropen = true
    netrwwin = api.nvim_get_current_win()
  end
end)

map('i', '<C-B>', '<Left>')
map('i', '<C-F>', '<Right>')
map('i', '<A-b>', '<C-Left>')
map('i', '<A-f>', '<C-Right>')

map('n', '<leader>q', function()
  vim.cmd('%s/‘\\|’/\'/ge')
  vim.cmd('%s/“\\|”/"/ge')
  vim.cmd('%s/ \\?\\(—\\|–\\) \\?/ -- /ge')
end)

map('i', '<M-u>', 'gUU`]a')
map('n', '<leader>o', 'O<esc>0D')
map('v', '<leader>a', 'g<C-a>')
map('n', '<leader>a', '<C-a>')

map('n', '<up>', '<C-w>k')
map('n', '<down>', '<C-w>j')
map('n', '<left>', '<C-w>h')
map('n', '<right>', '<C-w>l')

map({'n', 'x'}, 'ga', '<Plug>(EasyAlign)')

map('n', '<leader>d', function()
  local checkline = api.nvim_get_current_line()
  if string.sub(checkline, 3, 5) == '[ ]' then
    setline(string.sub(checkline, 1, 3) .. 'x' .. string.sub(checkline, 5, -1))
  elseif string.sub(checkline, 3, 5) == '[x]' then
    setline(string.sub(checkline, 1, 3) .. ' ' .. string.sub(checkline, 5, -1))
  elseif string.sub(checkline, 7, 9) == '[ ]' then
    setline(string.sub(checkline, 1, 7) .. 'x' .. string.sub(checkline, 9, -1))
  elseif string.sub(checkline, 7, 9) == '[x]' then
    setline(string.sub(checkline, 1, 7) .. ' ' .. string.sub(checkline, 9, -1))
  else
    print('Is that a checkbox?')
  end
end)

for k,v in pairs(hls) do
  api.nvim_set_hl(0,k,v)
end

aucmd('FileType', {
  callback = function() window.statusline = 'FILES' end,
  once = false,
  pattern = { 'netrw', }
})

opt.linebreak = true
opt.textwidth = 65
opt.autoindent = true
opt.rnu = true
opt.hlsearch = false
opt.foldlevelstart = 0
opt.foldmethod = 'marker'
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.dictionary = '/usr/share/dict/american-english'
opt.equalprg = 'pandoc'
opt.ignorecase = true
opt.smartcase = true
opt.grepprg = 'rg -i --vimgrep $*'
opt.tags = table.concat(bib,',')
opt.backupdir = backup
opt.directory = backup
opt.undodir = backup

opt.statusline = string.format(
  '%.40s LINE:%3s/COL%3s',
  '%f',
  '%l',
  '%v'
)

global.guicursor =
  'i-ci:ver30-iCursor-blinkwait500-blinkon250-blinkoff250'

global_var.netrw_liststyle      = 3
global_var.netrw_banner         = 0
global_var.netrw_browse_split   = 4
global_var.netrw_winsize        = 20
global_var.vimwiki_list = { { path = '~/wiki', } }
global_var.vimwiki_global_ext = 0
global_var.vimwiki_folding = 'list'
global_var.markdown_fenced_languages = {
  'awk', 'lua', 'perl', 'html',
  'sh', 'bash', 'bib',
}

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lervag/vimtex'
  use 'vimwiki/vimwiki'
  use 'junegunn/vim-easy-align'
end)

local wrapless_group = augrp('wrapless_group', { clear = true })
local wrapless_match = {
  'html',
  'awk',
  'sh',
}
aucmd('FileType', {
  command = 'setlocal textwidth=0',
  group = wrapless_group,
  pattern = wrapless_match,
  once = false,
})

local spelling_group = augrp('spelling_group', { clear = true })
local spelling_match = {
  'markdown',
  'tex',
  'vimwiki',
}
aucmd('FileType', {
  command = 'setlocal spell',
  group = spelling_group,
  pattern = spelling_match,
  once = false,
})

local sheet_group = augrp('sheet_group', { clear = true })
local sheet_match = {
  '*.tsv',
  '*.csv',
}
aucmd('BufEnter', {
  command = 'setlocal textwidth=0',
  group = sheet_group,
  pattern = sheet_match,
  once = false,
})
aucmd('BufEnter', {
  command = 'setlocal noexpandtab',
  group = sheet_group,
  pattern = sheet_match,
  once = false,
})

local indent_group = augrp('indent_group', { clear = true })
local indent_match = {
  'yaml',
  'lua',
  'html',
}
aucmd('FileType', {
  command = 'setlocal tabstop=2',
  group = indent_group,
  pattern = indent_match,
  once = false,
})
aucmd('FileType', {
  command = 'setlocal shiftwidth=2',
  group = indent_group,
  pattern = indent_match,
  once = false,
})

aucmd('FileType', {
  command = 'set omnifunc=htmlcomplete#CompleteTags',
  once = false,
  pattern = {'html'}
})

aucmd('BufNewFile', {
  command = '0r ~/.vimplates/tex',
  once    = false,
  pattern = {'*.tex',}
})

aucmd('BufNewFile', {
  command = '0r ~/.vimplates/xsl',
  once    = false,
  pattern = {'*.xsl',}
})

