--[[

This is a version of the cipher Wittgenstein used on the verso
side of his diaries... only he enciphered in his head.

]]

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
