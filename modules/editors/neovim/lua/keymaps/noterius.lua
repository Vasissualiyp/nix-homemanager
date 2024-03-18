local notes_dir = vim.fn.expand('~/research/notes')

-- These keymaps will only be folding the notes
vim.keymap.set('n', '<leader>zo', 'ggjVGkkzo<Esc><Esc>gg', { silent = true })
vim.keymap.set('n', '<leader>zm', 'ggjVGkkzm<Esc><Esc>gg', { silent = true })

-- Call FindNextNote()
vim.keymap.set('n', '<leader>nn', function()
    vim.cmd('call noterius#FindNextNote()')
end, { silent = true })

-- Call FindPreviousNote()
vim.keymap.set('n', '<leader>np', function()
    vim.cmd('call noterius#FindPreviousNote()')
end, { silent = true })

-- Call OpenNoteByDate()
vim.keymap.set('n', '<leader>no', function()
    vim.cmd('call noterius#OpenNoteByDate()')
end, { silent = true })

-- Call DisplayNoteriusQuickhelp()
vim.keymap.set('n', '<leader>n?', function()
    vim.cmd('call noterius#DisplayNoteriusQuickhelp()')
end, { silent = true })

--require('noterius_vim.noterius_telescope').setup({
--  notes_dir = "~/research/notes", -- Custom notes directory
--  keymaps = {
--    ["<leader>nf"] = "search_notes", -- Custom keybind for searching notes
--    ["<leader>ng"] = "grep_notes",   -- Custom keybind for grepping notes
--  }
--})
--
