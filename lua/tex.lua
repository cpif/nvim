function compiletex()
  vim.cmd('silent write')
  vim.cmd('silent !pdftex %')
end
