-- I use both fish and bash, and I have some command
-- substitutions in my init.lua file. This picks which command
-- substitution syntax to use for shell commands.

if vim.go.shell == '/usr/bin/fish' then
  lcmdsub = '('
  rcmdsub = ')'
else
  lcmdsub = '`'
  rcmdsub = '`'
end
