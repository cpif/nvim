--[[

> Lose no time; be always employ'd in something useful; cut off
> all unnecessary actions.
                                             -- Benjamin Franklin
]]

function checkuncheck(checkline)
  if string.sub(checkline, 3, 5) == '[ ]' then
    return string.sub(checkline, 1, 3) .. 'x' .. string.sub(checkline, 5, -1)
  elseif string.sub(checkline, 3, 5) == '[x]' then
    return string.sub(checkline, 1, 3) .. ' ' .. string.sub(checkline, 5, -1)
  elseif string.sub(checkline, 7, 9) == '[ ]' then
    return string.sub(checkline, 1, 7) .. 'x' .. string.sub(checkline, 9, -1)
  elseif string.sub(checkline, 7, 9) == '[x]' then
    return string.sub(checkline, 1, 7) .. ' ' .. string.sub(checkline, 9, -1)
  else
    print('Is that a checkbox?')
    return checkline
  end
end
