local notes_dir = vim.fn.expand('~/research/notes')

-- These keymaps will only be folding the notes
vim.keymap.set('n', '<leader>zo', 'ggjVGkkzo<Esc><Esc>gg', { silent = true })
vim.keymap.set('n', '<leader>zm', 'ggjVGkkzm<Esc><Esc>gg', { silent = true })

-- Call FindNextNote()
vim.keymap.set('n', '<leader>nn', function()
    vim.cmd('call FindNextNote()')
end, { silent = true })

-- Call FindPreviousNote()
vim.keymap.set('n', '<leader>np', function()
    vim.cmd('call FindPreviousNote()')
end, { silent = true })

-- Call OpenNoteByDate()
vim.keymap.set('n', '<leader>no', function()
    vim.cmd('call OpenNoteByDate()')
end, { silent = true })

-- Call DisplayNoteriusQuickhelp()
vim.keymap.set('n', '<leader>n?', function()
    vim.cmd('call DisplayNoteriusQuickhelp()')
end, { silent = true })

-- Call SearchNotes()
vim.keymap.set('n', '<leader>ns', function()
    vim.cmd('call SearchNotes()')
end, { silent = true })

vim.keymap.set("n", "<leader>ng", function()
  require('telescope.builtin').live_grep({
    search_dirs = {notes_dir},
    additional_args = function(opts)
      return {"--glob", "*.tex"}
    end,
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      -- Use the variable in the custom path display function if needed
      local relative_path = path:sub(#notes_dir + 2) -- +2 to remove the slash at the beginning and make it relative
      return string.gsub(relative_path, "(.*/)(%d+/%d+/%d+)/(.*)", "%2/" .. tail)
    end,
  })
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nf", function()
  require('telescope.builtin').find_files({
    search_dirs = {notes_dir},
    find_command = {'rg', '--files', '--type', 'tex', '--glob', '*.tex'},
    path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      local relative_path = path:sub(#notes_dir + 2)
      return string.gsub(relative_path, "(.*/)(%d+/%d+/%d+)/(.*)", "%2/" .. tail)
    end,
  })
end, { noremap = true, silent = true })
