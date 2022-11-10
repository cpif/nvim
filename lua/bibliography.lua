--[[

Functions related to the bibtex bibliography file I maintain.

--]]

-- I can't remember, and shouldn't have to remember, the annoying
-- options from ctags.

function bibtags()
  vim.cmd('silent !ctags -f ~/Bibliography/tags --language-force=bibtex --kinds-bibtex=e ~/Bibliography/bibliography.bib 2> /dev/null')
end

-- Make the tagfile from the bibliography globally available

-- The vim docs say to set `tags` with `+=`, so I grab the
-- content of `vim.o.tags` and couple it (with a comma) to my
-- master bibliography file's tags.
local bibtags = vim.o.tags .. ',' ..
                vim.fn.expand('~/Bibliography/tags')
vim.o.tags    = bibtags
