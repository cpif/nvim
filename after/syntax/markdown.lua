local headercolors = {
  { name = 'H1', cterm = 'Blue', },
  { name = 'H2', cterm = 'Magenta', },
  { name = 'H3', cterm = 'DarkGreen', },
}
setmdheaders(headercolors)

-- Programmatically set markdown header colors {{{
function setmdheaders(headercolors)
  for i,v in ipairs(headercolors) do
    sethi({
      specs           = {
        foreground    ='White',
        background    = v.cterm,
        bold          = true,
        ctermfg       ='White',
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

vim.api.nvim_set_hl(0, 'markdownFootnote', { ctermfg='green'})
vim.api.nvim_set_hl(0, 'markdownUrl', { ctermfg='lightgreen'})
