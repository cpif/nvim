local opts          = vim.o
local global        = vim.go
--[[ Set pandoc export options                                {{{

     I use John MacFarlane's wonderful pandoc to convert markdown
     to Word documents. This sets up some output options for it.

     The problem is: I love the fish shell, but it works like
     shit on WSL so I use bash. The `cmdsub` external decides
     which shell I'm using and picks the syntax for command
     substitutions (the fish shell uses parentheses instead of
     bash's backticks). ]]

require('cmdsub')
local docout  = ' -o ' .. lcmdsub .. 'basename % .md' .. rcmdsub
  .. '.docx'
-- }}}

opts.makeprg        = 'pandoc % -dbasic ' .. docout
opts.linebreak      = true
opts.textwidth      = 65
opts.autoindent     = true
opts.rnu            = true
opts.hlsearch       = false
opts.foldlevelstart = 0
opts.foldmethod     = 'marker'
opts.expandtab      = true
opts.tabstop        = 4
opts.shiftwidth     = 4
opts.guifont        = "Courier:h16"
opts.dictionary     = '/usr/share/dict/american-english'
opts.equalprg       = 'pandoc'
opts.ignorecase     = true
opts.smartcase      = true

global.guicursor    =
  'i-ci:ver30-iCursor-blinkwait500-blinkon250-blinkoff250'
