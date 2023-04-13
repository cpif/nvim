function bibtags()
  vim.cmd([[ silent !ctags 
           \ -f ~/Bibliography/tags
           \ --language-force=bibtex
           \ --kinds-bibtex=abiI
           \ ~/Bibliography/bibliography.bib 2> /dev/null ]])
  vim.cmd([[ silent !ctags
           \ -f ~/Dissertation/tags
           \ --language-force=bibtex
           \ --kinds-bibtex=abiI
           \ ~/Dissertation/bibliography.bib 2> /dev/null ]])
end

local bibtags = vim.o.tags .. ',' ..
                vim.fn.expand('~/Bibliography/tags') .. ',' ..
                vim.fn.expand('~/Dissertation/tags')
vim.o.tags    = bibtags
