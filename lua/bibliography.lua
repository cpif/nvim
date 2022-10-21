--[[

Functions related to the bibtex bibliography file I maintain.

--]]

-- I can't remember, and shouldn't have to remember, the annoying
-- options from ctags.

function bibtags()
  vim.cmd("silent !ctags -f ~/Bibliography/tags --language-force=bibtex --kinds-bibtex=e ~/Bibliography/bibliography.bib 2> /dev/null")
end
