function mapfloatingwindow(table)
  vim.keymap.set('n', '<leader>' .. table.leader, function()
    if table.open == false then
      makefloatingwindow(table)
    else
      closefloatingwindow(table)
    end
  end)
end

function makefloatingwindow(table)
  table.buffer      = vim.api.nvim_create_buf(false, table.scratch)

  local width       = vim.api.nvim_get_option("columns")
  local height      = vim.api.nvim_get_option("lines")

  local win_width   = math.ceil(width  * table.size[1])
  local win_height  = math.ceil(height * table.size[2]- 4)

  local col         = math.ceil((width  - win_width)  / 2)
  local row         = math.ceil((height - win_height) / 2 - 1)

  local opts = {
    style           = "minimal",
    relative        = "editor",
    border          = "double",
    width           = win_width,
    height          = win_height,
    col             = col,
    row             = row,
  }

  table.window = vim.api.nvim_open_win(table.buffer, true, opts)
  if table.scratch == false then
    vim.cmd('edit ' .. table.file)
  end
  table.open = true
end

function closefloatingwindow(table)
  if table.write == true then
    vim.cmd('silent write')
  end
  vim.api.nvim_win_close(table.window, true)
  table.open = false
end
