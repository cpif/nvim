local basiclayout = {
  '\\documentclass{article}',
  '\\usepackage[utf8]{inputenc}',
  '',
  '\\title{}',
  '\\author{}',
  '\\date{}',
  '',
  '\\begin{document}',
  '% COMMENTED OUT: \\maketitle',
  '% COMMENTED OUT: \\section{}',
  '',
  '',
  '',
  '\\end{document}',
}

function texdoc()
  vim.api.nvim_buf_set_lines(0, 0, -1, true, basiclayout)
end
