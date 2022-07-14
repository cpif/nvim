local api = vim.api
local buf, win

function makenewwindow(widthratio, heightratio, isscratch, filen)
  buf = api.nvim_create_buf(false, isscratch)

  local width      = api.nvim_get_option("columns")
  local height     = api.nvim_get_option("lines")
  local win_width  = math.ceil(width * widthratio)
  local win_height = math.ceil(height * heightratio - 4)
  local col        = math.ceil((width - win_width) / 2)
  local row        = math.ceil((height - win_height) / 2 - 1)

  local opts = {
    style          = "minimal",
    relative       = "editor",
    border         = "double",
    width          = win_width,
    height         = win_height,
    col            = col,
    row            = row,
  }

  win = api.nvim_open_win(buf, true, opts)
  if isscratch == false then
    vim.cmd('edit ' .. filen)
  end

  return buf, win
end

function closenewwindow(win, write)
  if write == true then
    vim.cmd('silent write')
  end
  api.nvim_win_close(win, true)
end
