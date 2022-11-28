--[[

Functions related to the bibtex bibliography file I maintain.

ctags options, and global tagfile.

--]]

-- I can't remember, and shouldn't have to remember, the annoying
-- options from ctags.

function bibtags()
  vim.cmd('silent !ctags -f ~/biblio/tags --language-force=bibtex ~/biblio/bibliography.bib 2> /dev/null')
  vim.cmd('silent !ctags -f ~/dissertation/tags --language-force=bibtex ~/dissertation/bibliography.bib 2> /dev/null')
end

-- Make the tagfile from the bibliography globally available

-- The vim docs say to set `tags` with `+=`, so I grab the
-- content of `vim.o.tags` and couple it (with a comma) to my
-- master bibliography file's tags.
local bibtags = vim.o.tags .. ',' ..
                vim.fn.expand('~/biblio/tags') .. ',' ..
                vim.fn.expand('~/dissertation/tags')
vim.o.tags    = bibtags
