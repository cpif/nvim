--[[

> Lose no time; be always employ'd in something useful; cut off
> all unnecessary actions.
                                             -- Benjamin Franklin

TODO: make this script handle indented checkboxes.

]]

function checkuncheck(checkline)
  if string.sub(checkline, 4, 4) == " " then
    return string.sub(checkline, 1, 3) .. 'x' .. string.sub(checkline, 5, -1)
  elseif string.sub(checkline, 4, 4) == "x" then
    return string.sub(checkline, 1, 3) .. ' ' .. string.sub(checkline, 5, -1)
  else
    print("Is that a checkbox?")
    return checkline
  end
end
