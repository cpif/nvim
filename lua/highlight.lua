-- Programmatically set highlights
function sethi(highlights)
  for i,v in ipairs(highlights.categories) do
    vim.api.nvim_set_hl(0, v, highlights.specs)
  end
end

-- Normal         {{{
local normal	    = {
  specs           = {
    foreground    = 'black',
    background    = '#eeeeee',
    ctermfg       = 'grey',
    ctermbg       = 'black'
  },
  categories      = {
    'Normal', 'LineNr', 'Pmenu', 'FloatBorder',
  }
}
sethi(normal)
-- }}}

-- Folds          {{{
local fold        = {
  specs           = {
    foreground    = 'black',
    background    = '#eeeeee',
    ctermfg       = 'black',
    ctermbg       = 'darkcyan'
  },
  categories      = {
    'Folded', 'FoldColumn',
  }
}
sethi(fold)
-- }}}

-- Comment        {{{
local Comment     = {
  specs           = {
    ctermfg       = 'Cyan',
    foreground    = '#6070a0',
  },
  categories      = {
    'Comment',  
  }
}
sethi(Comment)
-- }}}

-- Special        {{{
local Special     = {
  specs           = {
    ctermfg       = 'LightRed',
    foreground    = '#bb00bb',
  },
  categories      = {
    'Special',  
  }
}
sethi(Special)
-- }}}

-- Type           {{{
local Type        = {
  specs           = {
    ctermfg       = 'LightGreen',
    foreground    = '#30c030',
		bold      	  = true,
  },
  categories      = {
    'Type',
  }
}
sethi(Type)
-- }}}

-- Statement      {{{
local Statement   = {
  specs           = {
    ctermfg       = 'Yellow',
    foreground    = '#aaaa40',
		bold      	  = true,
  },
  categories      = {
    'Statement',
  }
}
sethi(Statement)
-- }}}

-- Identifier     {{{
local Identifier  = {
  specs           = {
    ctermfg       = 'Cyan',
    foreground    = '#30b0c0',
    cterm         = {
      bold        = true,
    },
  },
  categories      = {
    'Identifier',
  }
}
sethi(Identifier)
-- }}}

-- Constant       {{{
local Constant    = {
  specs           = {
    ctermfg       = 'Magenta',
    foreground    = '#b02020',
  },
  categories      = {
    'Constant',
  }
}
sethi(Constant)
-- }}}

-- PreProc        {{{
local PreProc     = {
  specs           = {
    ctermfg       = 'LightBlue',
    foreground    = '#60b060',
  },
  categories      = {
    'PreProc',
  }
}
sethi(PreProc)
-- }}}
