--local notes_dir = vim.fn.expand('~/research/notes')
--vim.g.noterius_notes_dir = '/home/vasilii/research/notes'
vim.g.noterius_notes_dir = '$HOME/research/notes'
vim.g.noterius_git_url = 'git@github.com:Vasissualiyp/Research_Notes.git'

require('noterius-vim.noterius_telescope').setup({
  notes_dir = vim.g.noterius_notes_dir,
})

-- These keymaps will only be folding the notes
vim.keymap.set('n', '<leader>zo', 'ggjVGkkzo<Esc><Esc>gg', { silent = true })
vim.keymap.set('n', '<leader>zm', 'ggjVGkkzm<Esc><Esc>gg', { silent = true })

-- Noterius note management keybinds
vim.keymap.set('n', '<leader>N' , ':NoteriusToday<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nc', ':NoteriusCleanup<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nn', ':FindNextNote<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>np', ':FindPreviousNote<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>no', ':OpenNoteByDate<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n?', ':DisplayNoteriusQuickhelp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ns', ':NoteriusGitPull<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>nP', ':NoteriusGitPush<CR>', { noremap = true, silent = true })

-- Telescope integration keybinds
local noterius_telescope = require('noterius-vim.noterius_telescope')
vim.keymap.set('n','<leader>ng', noterius_telescope.grep_notes)
vim.keymap.set('n','<leader>nf', noterius_telescope.search_notes)

-- Initialize noterius. MUST BE INCLUDED AFTER the definitions of global variables!
require('noterius-vim.init').setup({
  notes_dir = vim.g.noterius_notes_dir,
  author = "Vasilii Pustovoit",
  citerius_integration = 1,
  citerius_src_dir = '/home/vasilii/research/references',
})
