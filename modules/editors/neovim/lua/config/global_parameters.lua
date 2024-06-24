-- Setting 'packpath' equal to 'runtimepath'
vim.opt.packpath = vim.opt.runtimepath:get()

-- Setting the Python 3 host program path
vim.g.python3_host_prog = vim.fn.expand('~/env/venv/bin/python')
--vim.g.python3_host_prog = '/data/data/com.termux/files/usr/bin/python3'

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.lua",
  callback = function()
    vim.opt_local.syntax = "lua"
  end,
})

-- Set number and relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Show command in the bottom bar
vim.opt.showcmd = true

-- Set tab stops
vim.opt.tabstop = 4

-- Uncomment the next line if you want to enable spell checking
-- vim.opt.spell = true

-- Set auto indentation
vim.opt.autoindent = true

-- Uncomment the next line if you want to use the system clipboard
-- vim.opt.clipboard = 'unnamedplus'

-- Set the background to dark
vim.opt.background = 'dark'

-- Set file encoding
vim.opt.encoding = 'utf-8'

-- Set fold method
vim.opt.foldmethod = "syntax"

-- Disable mouse
vim.opt.mouse = ''
