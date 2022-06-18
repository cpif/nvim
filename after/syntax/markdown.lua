local basic = {
  ctermfg='grey',
  ctermbg='black'
}

local headers = {
  ctermfg='white',
  ctermbg='blue',
  cterm = { bold=true }
}

vim.api.nvim_set_hl(0, 'Normal',                    basic)
vim.api.nvim_set_hl(0, 'LineNr',                    basic)

vim.api.nvim_set_hl(0, 'markdownH1',                headers)
vim.api.nvim_set_hl(0, 'markdownH2',                headers)
vim.api.nvim_set_hl(0, 'markdownH3',                headers)
vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter',  headers)

vim.api.nvim_set_hl(0, 'markdownFootnote', { ctermfg='green'})
vim.api.nvim_set_hl(0, 'markdownUrl', { ctermfg='lightgreen'})

