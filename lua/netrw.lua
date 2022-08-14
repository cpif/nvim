local netrwwin
local filebrowseropen = false

vim.keymap.set('n', '<leader>f', function()
  if filebrowseropen then
    vim.api.nvim_win_close(netrwwin, false)
    filebrowseropen = false
  else
    vim.cmd('Vexplore')
    filebrowseropen = true
    netrwwin = vim.api.nvim_get_current_win()
  end
end)

vim.g.netrw_liststyle    = 3
vim.g.netrw_banner       = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize      = 20

vim.api.nvim_create_autocmd("FileType", {
  callback  = function() vim.wo.statusline = 'FILES' end,
  once    = false,
  pattern = { 'netrw', },
})
