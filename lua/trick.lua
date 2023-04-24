--[[
> Lose no time; be always employ'd in something useful; cut off
> all unnecessary actions.
                                          -- Benjamin Franklin ]]

function checkuncheck(checkline)
  if string.sub(checkline, 3, 5) == '[ ]' then
    return string.sub(checkline, 1, 3) .. 'X' .. string.sub(checkline, 5, -1)
  elseif string.sub(checkline, 3, 5) == '[X]' then
    return string.sub(checkline, 1, 3) .. ' ' .. string.sub(checkline, 5, -1)
  elseif string.sub(checkline, 7, 9) == '[ ]' then
    return string.sub(checkline, 1, 7) .. 'X' .. string.sub(checkline, 9, -1)
  elseif string.sub(checkline, 7, 9) == '[X]' then
    return string.sub(checkline, 1, 7) .. ' ' .. string.sub(checkline, 9, -1)
  else
    print('Is that a checkbox?')
    return checkline
  end
end

-- Lorem ipsum generator
ipsum = {
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur adipiscing elit duis tristique sollicitudin nibh. Elementum pulvinar etiam non quam. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Eget dolor morbi non arcu risus quis varius. Etiam tempor orci eu lobortis elementum. Ultricies integer quis auctor elit sed. Dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras. Viverra suspendisse potenti nullam ac tortor vitae purus faucibus ornare. Faucibus a pellentesque sit amet porttitor eget dolor. Urna condimentum mattis pellentesque id nibh.',
'',
'Ridiculus mus mauris vitae ultricies leo integer malesuada. Sed odio morbi quis commodo odio aenean sed adipiscing diam. Felis imperdiet proin fermentum leo vel. Sed arcu non odio euismod lacinia at quis risus. Morbi quis commodo odio aenean. Sociis natoque penatibus et magnis dis parturient montes nascetur. Sed blandit libero volutpat sed cras ornare. Vitae sapien pellentesque habitant morbi tristique. In mollis nunc sed id semper risus. Iaculis urna id volutpat lacus laoreet non curabitur gravida. Tincidunt augue interdum velit euismod in pellentesque massa. Ac felis donec et odio pellentesque diam volutpat commodo sed. Quis ipsum suspendisse ultrices gravida dictum fusce ut. Elementum tempus egestas sed sed. Quam viverra orci sagittis eu volutpat. Maecenas pharetra convallis posuere morbi leo urna molestie at.',
}

function lorem()
  vim.api.nvim_buf_set_lines(0, 0, -1, true, ipsum)
end

-- Cipher from Wittgenstein's journals
code = {
  a='z', b='y', c='x', d='w', e='v',
  f='u', g='t', h='s', i='r', j='q',
  k='p', l='o', m='n', n='m', o='l',
  p='k', q='j', r='i', s='h', t='g',
  u='f', v='e', w='d', x='c', y='b',
  z='a',
  A='z', B='y', C='x', D='w', E='v',
  F='u', G='t', H='s', I='r', J='q',
  K='p', L='o', M='n', N='m', O='l',
  P='k', Q='j', R='i', S='h', T='g',
  U='f', V='e', W='d', X='c', Y='b',
  Z='a'
}

function encipher(str)
  local ciphstr = ''
  for c in str:gmatch('.') do
    if c:match('%a') then
      ciphstr = ciphstr..code[c]
    elseif c == ' ' then
      ciphstr = ciphstr..'&'
    elseif c == '&' then
      ciphstr = ciphstr..' '
    else
      ciphstr = ciphstr..c
    end
  end
  return ciphstr
end
