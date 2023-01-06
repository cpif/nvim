function bibtags()
  vim.cmd([[ silent !ctags 
           \ -f ~/bibliography/tags
           \ --language-force=bibtex
           \ --kinds-bibtex=e
           \ ~/bibliography/bibliography.bib 2> /dev/null ]])
  vim.cmd([[ silent !ctags
           \ -f ~/Dissertation/tags
           \ --language-force=bibtex
           \ --kinds-bibtex=e
           \ ~/Dissertation/bibliography.bib 2> /dev/null ]])
end

local bibtags = vim.o.tags .. ',' ..
                vim.fn.expand('~/bibliography/tags') .. ',' ..
                vim.fn.expand('~/Dissertation/tags')
vim.o.tags    = bibtags
