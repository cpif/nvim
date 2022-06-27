local todobuf, todowin

function opentodo()
  todobuf          = vim.api.nvim_create_buf(false, false)

  local width      = vim.api.nvim_get_option("columns")
  local height     = vim.api.nvim_get_option("lines")
  local win_width  = math.ceil(width  * 0.6)
  local win_height = math.ceil(height * 0.6 - 4)
  local col        = math.ceil((width  - win_width ) / 2)
  local row        = math.ceil((height - win_height) / 2 - 1)

  local opts       = {
    style          = "minimal",
    relative       = "editor",
    border         = "double",
    width          = win_width,
    height         = win_height,
    row            = row,
    col            = col
  }

  todowin = vim.api.nvim_open_win(todobuf, true, opts)
  vim.cmd('edit ' .. todofile)
  vim.api.nvim_buf_set_option(todobuf, 'textwidth', 0)
end

function closetodo()
  vim.cmd('silent write')
  vim.api.nvim_win_close(todowin, false)
end
