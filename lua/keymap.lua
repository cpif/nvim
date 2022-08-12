--[[
The following mapping allows you to paste a quotation with <M-p>.
I use it with PDFs -- typically a pasted quotation will retain
line break where I don't want them. This joins all the lines,
removing any hyphenated words that were wrapped across lines.
]]
vim.keymap.set('n', '<M-p>',    function()
  require('strings')
  clipb = vim.split(vim.fn.getreg('+'), '\n')
  vim.api.nvim_set_current_line(joinstrings(clipb))
end)


