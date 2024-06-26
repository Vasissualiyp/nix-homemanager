vim.keymap.set('i', '<C-`>', function()
  local line = vim.fn.getline('.')
  local cmd = string.format(":silent exec '.!inkscape-figures create \"%s\" \"%s/figures/\"'<CR><CR>:w<CR>", line, vim.b.vimtex_root)
  vim.cmd(cmd)
end, { silent = true })

vim.keymap.set('n', '<C-`>', function()
  local cmd = string.format(":silent exec '!inkscape-figures edit \"%s/figures/\" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>", vim.b.vimtex_root)
  vim.cmd(cmd)
end, { silent = true })
