--[[
The most general kind of text processing you might want to do is
run every line in a text file through a particular function.
]]

function processtext(func)
  local a = vim.api
  local filelines = a.nvim_buf_get_lines(0, 0, -1, true)
  local replacement = {}
  for i,v in ipairs(filelines) do
    replacement[i] = func(filelines[i])
  end
  a.nvim_buf_set_lines(0, 0, -1, true, replacement)
end
