-- System-specific adjustments

-- Fish or bash command substitutions?

if vim.go.shell == '/usr/bin/fish' then
  lcmdsub = '('
  rcmdsub = ')'
else
  lcmdsub = '`'
  rcmdsub = '`'
end

-- Adjust initial directory

local startdir = vim.fn.getcwd()
if startdir == vim.fn.expand('~\\NVIM\\nvim-win64\\bin') then
  vim.cmd('cd ' .. vim.fn.expand('~\\Dropbox\\note'))
end
