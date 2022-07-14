--[[

For copying/pasting, quote-cleaning, etc., this lua script
removes all "smart" quotes, n-dashes, and m-dashes.

--]]

function quoteclean()
  vim.cmd('%s/‘\\|’/\'/ge')
  vim.cmd('%s/“\\|”/"/ge')
  vim.cmd('%s/ \\?\\(—\\|–\\) \\?/ -- /ge')
  vim.cmd('%s/\\(\\."\\?\\)\\d\\+/\\1/ge')
end
