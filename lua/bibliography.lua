--[[

Functions related to the bibtex bibliography files I maintain.

`bibtags()` makes a tagfile without having to remember all the
annoying ctags options.

I also need to set nvim's `tags` option so that these tag files
are globally available.

--]]

function bibtags()
  vim.cmd('silent !ctags -f ~/Bibliography/tags --language-force=bibtex --kinds-bibtex=e ~/Bibliography/bibliography.bib 2> /dev/null')
  vim.cmd('silent !ctags -f ~/Dissertation/tags --language-force=bibtex --kinds-bibtex=e ~/Dissertation/bibliography.bib 2> /dev/null')
end

-- Make the tagfile from the bibliography globally available

-- The vim docs say to set `tags` with `+=`, so I grab the
-- content of `vim.o.tags` and couple it (with a comma) to my
-- master bibliography file's tags.
local bibtags = vim.o.tags .. ',' ..
                vim.fn.expand('~/Bibliography/tags')
                vim.fn.expand('~/Dissertation/tags')
vim.o.tags    = bibtags
