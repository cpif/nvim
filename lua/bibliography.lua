--[[ Functions related to the bibtex bibliography file I
     maintain. ]]

function bibtags()
  vim.cmd('silent !ctags -f ~/biblio/tags --language-force=bibtex ~/biblio/bibliography.bib 2> /dev/null')
  vim.cmd('silent !ctags -f ~/dissertation/tags --language-force=bibtex ~/dissertation/bibliography.bib 2> /dev/null')
end

local bibtags = vim.o.tags .. ',' ..
                vim.fn.expand('~/biblio/tags') .. ',' ..
                vim.fn.expand('~/dissertation/tags')
vim.o.tags    = bibtags
