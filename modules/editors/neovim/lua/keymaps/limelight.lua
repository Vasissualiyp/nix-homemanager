-- Map <Leader>l to Limelight in normal mode
vim.api.nvim_set_keymap('n', '<Leader>l', '<Plug>(Limelight)', { noremap = false, silent = true })

-- Map <Leader>l to Limelight in visual mode
vim.api.nvim_set_keymap('x', '<Leader>l', '<Plug>(Limelight)', { noremap = false, silent = true })

-- Toggle Limelight with <Leader>L in normal mode
vim.api.nvim_set_keymap('n', '<Leader>L', ':Limelight!<CR>', { noremap = true, silent = true })

-- Map <Leader>lf to toggle the Limelight function in normal mode
vim.api.nvim_set_keymap('n', '<Leader>lf', '<cmd>lua ToggleLimelight()<CR>', { noremap = true, silent = true })
