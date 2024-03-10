-- Line numbers --
vim.keymap.set('n', '<leader>nrn', ':set nonumber norelativenumber<CR>', { silent = true })
vim.keymap.set('n', '<leader>rn', ':set number relativenumber<CR>', { silent = true })

-- Clipboard copy-pasting --
vim.keymap.set('n', 'gy', '"+y', { silent = true })
vim.keymap.set('n', 'gY', '"+yy', { silent = true })
vim.keymap.set('n', 'gp', '"+p', { silent = true })
vim.keymap.set('n', 'gP', '"+P', { silent = true })
vim.keymap.set('v', 'gy', '"+y', { silent = true })
vim.keymap.set('v', 'gY', '"+yy', { silent = true })
vim.keymap.set('v', 'gp', '"+p', { silent = true })
vim.keymap.set('v', 'gP', '"+P', { silent = true })

-- Finding cursor --
vim.keymap.set('n', '<leader>c', ':set cursorline cursorcolumn<CR>jk', { silent = true })
vim.keymap.set('n', '<leader>C', ':set nocursorline nocursorcolumn<CR>', { silent = true })

-- Insert mode save --
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { silent = true })
