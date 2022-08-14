-- Make the tagfile from the bibliography globally available
--
-- The vim docs say to set `tags` with `+=`, so I grab the
-- content of `vim.o.tags` and couple it (with a comma) to my
-- master bibliography file's tags.
local bibtags = vim.o.tags .. ',' ..
                vim.fn.expand('~/Bibliography/tags')
vim.o.tags    = bibtags
