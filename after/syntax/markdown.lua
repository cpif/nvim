local headers     = {
  specs           = {
    ctermfg       ='white',
    ctermbg       ='blue',
    cterm         = {
      bold        = true,
    },
  },
  categories      = {
    'markdownH1', 'markdownH2', 'markdownH3',
    'markdownHeadingDelimiter',
  }
}
sethi(headers)

vim.api.nvim_set_hl(0, 'markdownFootnote', { ctermfg='green'})
vim.api.nvim_set_hl(0, 'markdownUrl', { ctermfg='lightgreen'})
