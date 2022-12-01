-- Programmatically set markdown header colors {{{
function setmdheaders(headercolors)
  for i,v in ipairs(headercolors) do
    sethi({
      specs           = {
        bold          = true,
        ctermfg       = 0,
        ctermbg       = v.cterm,
        cterm         = {
          bold        = true,
        },
      },
      categories      = {
        'markdown' .. v.name,
        'markdown' .. v.name .. 'Delimiter',
      }
    })
  end
end
-- }}}

local headercolors = {
  { name = 'H1', cterm = 3, },
  { name = 'H2', cterm = 7, },
  { name = 'H3', cterm = 9, },
  { name = 'H4', cterm = 6, },
  { name = 'H5', cterm = 15, },
  { name = 'H6', cterm = 2, },
}
setmdheaders(headercolors)

vim.api.nvim_set_hl(0, 'markdownFootnote', { ctermfg='green'})
vim.api.nvim_set_hl(0, 'markdownUrl', { ctermfg='lightgreen'})
