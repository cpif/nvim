--[[

Dumbest band-aid fix in the world. I work in WSL on my laptop and
the fish shell is *so* slow there. But I use a few command
substitutions in `init.lua`. This sets which symbol should
indicate that a substitution is occurring.

--]]
if vim.go.shell == '/usr/bin/fish' then
  lcmdsub = '('
  rcmdsub = ')'
else
  lcmdsub = '`'
  rcmdsub = '`'
end
