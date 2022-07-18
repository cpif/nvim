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
    default       = true,
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
    default       = true,
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
    default       = true,
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
    default       = true,
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
    default       = true,
    foreground    = '#30b0c0',
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
    default       = true,
    foreground    = '#b02020',
  },
  categories      = {
    'Constant',
  }
}
sethi(Constant)
-- }}}

