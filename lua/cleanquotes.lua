--[[

For copying/pasting, quote-cleaning, etc., this lua script
removes all "smart" quotes, n-dashes, and m-dashes.

--]]

function quoteclean()
  vim.cmd('%s/ \\?\\(—\\|–\\) \\?/ -- /g')
  vim.cmd('%s/“\\|”/"/g')
  vim.cmd('%s/‘\\|’/\'/g')
end
