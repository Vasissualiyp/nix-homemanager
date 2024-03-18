local notes_dir = vim.fn.expand('~/research/notes')

-- These keymaps will only be folding the notes
vim.keymap.set('n', '<leader>zo', 'ggjVGkkzo<Esc><Esc>gg', { silent = true })
vim.keymap.set('n', '<leader>zm', 'ggjVGkkzm<Esc><Esc>gg', { silent = true })

-- Noterius note management keybinds
vim.keymap.set('n', '<leader>nn', ':FindNextNote<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>np', ':FindPreviousNote<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>no', ':OpenNoteByDate<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n?', ':DisplayNoteriusQuickhelp<CR>', { noremap = true, silent = true })
