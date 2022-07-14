local headers  = {
  ctermfg      ='white',
  ctermbg      ='blue',
  cterm        = {
    bold       = true,
  }
}

local headersh = {
  'markdownH1', 'markdownH2', 'markdownH3',
  'markdownHeadingDelimiter',
}

sethi(headers, headersh)

vim.api.nvim_set_hl(0, 'markdownFootnote', { ctermfg='green'})
vim.api.nvim_set_hl(0, 'markdownUrl', { ctermfg='lightgreen'})
