local api = vim.api
local buf, win, border_win
local scratchopen = false

function scratchpad()
  if scratchopen == false then
    scratchopen = true
    buf        = api.nvim_create_buf(false, false)
    buf_border = api.nvim_create_buf(false, false)
    
    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    api.nvim_buf_set_option(buf_border, 'bufhidden', 'wipe')
    api.nvim_buf_set_option(buf_border, 'buftype', 'nofile')

    local width       = api.nvim_get_option("columns")
    local height      = api.nvim_get_option("lines")
    local win_width   = math.ceil(width  * 0.8)
    local win_height  = math.ceil(height * 0.8 - 4)
    local col         = math.ceil((width  - win_width ) / 2)
    local row         = math.ceil((height - win_height) / 2 - 1)

    local opts        = {
      style           = "minimal",
      relative        = "editor",
      border          = "double",
      width           = win_width,
      height          = win_height,
      row             = row,
      col             = col
    }

    local border = {"┌" .. string.rep("─", win_width) .. "┐"}
    for i=2,win_height+1 do
      border[i] = "│" .. string.rep(" ", win_width) .. "│"
    end
    border[#border + 1] = "└" .. string.rep("─", win_width) .. "┘"
    api.nvim_buf_set_lines(buf_border,0,-1,true,border)

    win        = api.nvim_open_win(buf, true, opts)
    return '<cmd>echo "hello"<cr>'
  else
    scratchopen = false
    api.nvim_win_close(win, true)
  end
end
