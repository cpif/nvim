--[[ PREAMBLE                                 {{{

These are small lua functions that work on strings. Some of them
call each other at the moment. That may or may not be
"functional" enough.

}}}]]

--[[ STRIPPING HYPHENS FROM THE ENDS OF LINES {{{

Sometimes, it's useful to be able to strip hyphens from the ends
of lines. For example, when pasting a quotation from a pdf with
broken, wrapped lines. ]]

function lasthyphen(str)
  if string.sub(str, -1) == '-' then
    return string.sub(str, 1, -2)
  else
    return str .. ' '
  end
end
--}}}

--[[ JOINING A TABLE OF STRINGS               {{{

Like `gJ`, but implemented here, and with `lasthyphen` from
above. ]]

function joinstrings(table)
  local joined = '> '
  for i, v in ipairs(table) do 
    joined = joined .. lasthyphen(v)
  end
  return joined
end
--}}}

--[[ CLEANING UP QUOTATIONS                   {{{

For copying/pasting, quote-cleaning, etc., this lua script
removes all "smart" quotes, n-dashes, and m-dashes.

]]

function quoteclean()
  vim.cmd('%s/‘\\|’/\'/ge')
  vim.cmd('%s/“\\|”/"/ge')
  vim.cmd('%s/ \\?\\(—\\|–\\) \\?/ -- /ge')
end
--}}}
