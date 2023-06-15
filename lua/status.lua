-- Set the status line.

function setstatus()
  local shrug = '¯\\_(ツ)_/¯'
  local file = '%f'
  local line = '%l'
  local column = '%v'
  local wc_table = vim.fn.wordcount()
  local wc = wc_table.words
  return string.format(
    '%.40s LINE:%3s/COL:%3s',
    file,
    line,
    column
  )
end
vim.o.statusline = setstatus()
