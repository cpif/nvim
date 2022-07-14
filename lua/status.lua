--[[

Set the status line.

]]

function setstatus()
  local shrug = '¯\\_(ツ)_/¯'
  local file = '%f'
  local line = '%l'
  local column = '%v'
  return string.format(
    '%-13s %.40s LINE:%3s/COL:%3s',
    shrug,
    file,
    line,
    column
  )
end
vim.o.statusline = setstatus()
