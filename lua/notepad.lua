scratchopen = false
local api   = vim.api
local buf, win

function scratchpad()
  if scratchopen == false then
    buf           = api.nvim_create_buf(false, true)
    
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    api.nvim_buf_set_option(buf, 'buftype', 'nofile')

    local width      = api.nvim_get_option("columns")
    local height     = api.nvim_get_option("lines")
    local win_width  = math.ceil(width  * 0.8)
    local win_height = math.ceil(height * 0.8 - 4)
    local col        = math.ceil((width  - win_width ) / 2)
    local row        = math.ceil((height - win_height) / 2 - 1)

    local opts = {
      style    = "minimal",
      relative = "editor",
      border   = "double",
      width    = win_width,
      height   = win_height,
      row      = row,
      col      = col
    }

    win = api.nvim_open_win(buf, true, opts)
    print(win)
    scratchopen   = true
  else
    api.nvim_win_close(win, true)
    print(win)
    scratchopen = false
  end
end
