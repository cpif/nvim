-- PROGRAMMATICALLY SET HIGHLIGHTS
function sethi(specs, cats)
  for i,v in ipairs(cats) do
    vim.api.nvim_set_hl(0, v, specs)
  end
end

-- NORMAL {{{
local normal	= {
  foreground  = 'black',
  background  = '#eeeeee',
  ctermfg     = 'grey',
  ctermbg     = 'black'
}

local normalh = {
  'Normal', 'LineNr', 'Pmenu', 'FloatBorder',
}

sethi(normal, normalh)
-- }}}

-- FOLDS {{{
local fold    = {
  foreground  = 'black',
  background  = '#eeeeee',
  ctermfg     = 'black',
  ctermbg     = 'darkcyan'
}

local foldh   = {
  'Folded', 'FoldColumn',
}

sethi(fold, foldh)
-- }}}
