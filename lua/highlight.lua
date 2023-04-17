local hl = vim.api.nvim_set_hl

local hls = {
  NormalFloat = { ctermfg = 7,  ctermbg = 0 },
  SpellBad    = { ctermfg = 11, bold = true },
  SpellCap    = { ctermfg = 11, bold = true },
  Folded      = { ctermfg = 7,  ctermbg = 8 },
}

for k,v in pairs(hls) do
  hl(0, k, v)
end
