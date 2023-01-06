-- Process each line in a file through the passed function

function processtext(func)
  local a = vim.api
  local filelines = a.nvim_buf_get_lines(0, 0, -1, true)
  local replacement = {}
  for i,v in ipairs(filelines) do
    replacement[i] = func(filelines[i])
  end
  a.nvim_buf_set_lines(0, 0, -1, true, replacement)
end

-- Strip hyphen from the end of a line

function lasthyphen(str)
  if string.sub(str, -1) == '-' then
    return string.sub(str, 1, -2)
  else
    return str .. ' '
  end
end

-- Join a table of strings, stripping trailing hyphens

function joinstrings(table)
  local joined = '> '
  for i, v in ipairs(table) do 
    joined = joined .. lasthyphen(v)
  end
  return joined
end

-- Clean undesirable characters from pasting/quotation

function quoteclean()
  vim.cmd('%s/‘\\|’/\'/ge')
  vim.cmd('%s/“\\|”/"/ge')
  vim.cmd('%s/ \\?\\(—\\|–\\) \\?/ -- /ge')
end
