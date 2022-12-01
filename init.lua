--[[
> I was never embarrassed about asking someone, literally, "What
> should I paint?" because how is asking someone for ideas any
> different from looking for them in a magazine? 
                                                -- Andy Warhol ]]
require('abbreviations')
require('bibliography')
require('cursor')
require('emacs')
require('filetypes')
require('highlight')
require('lines')
require('lorem')
require('netrw')
require('opts')
require('startdir')
require('status')
require('swapfiles')

--[[ Set makeprg to pandoc                                    {{{
I use John MacFarlane's wonderful pandoc to convert markdown to
Word documents. Here I set it up as my `makeprg`.

I love the fish shell, but it works like shit on WSL so I use
bash. The `cmdsub` external decides which shell I'm using and
picks the syntax for command substitutions (the fish shell uses
parentheses instead of bash's backticks). ]]
require('cmdsub')
local docout  = ' -o ' .. lcmdsub .. 'basename % .md' .. rcmdsub
  .. '.docx'
vim.o.makeprg = 'pandoc % -dbasic ' .. docout
-- }}}
