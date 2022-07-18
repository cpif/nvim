local startdir = vim.fn.getcwd()
if startdir == vim.fn.expand('~\\NVIM\\nvim-win64\\bin') then
  vim.cmd('cd ' .. vim.fn.expand('~\\Dropbox\\note'))
end
