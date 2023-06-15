local hl = vim.api.nvim_set_hl

local hls       = {
  DiffAdd       = { ctermbg =  8, },
  DiffChange    = { ctermbg =  8, },
  DiffDelete    = { ctermbg =  8, },
  DiffText      = { ctermbg =  8, bold      = true  },
  Folded        = { ctermfg =  7, ctermbg   = 8     },
  NormalFloat   = { ctermfg =  7, ctermbg   = 0     },
  SpellBad      = { ctermfg = 11, underline = true  },
  SpellCap      = { ctermfg = 11, underline = true  },
  nroffRequest  = { ctermfg =  8, },
}

for k,v in pairs(hls) do
  hl(0,k,v)
end
