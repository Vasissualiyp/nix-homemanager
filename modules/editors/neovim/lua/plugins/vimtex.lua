-- Vimtex settings
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_flavor = 'latex'

-- Continuous latex compilation
vim.opt.conceallevel = 1

-- Set .tex foldmethod to marker
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.opt_local.foldmethod = "marker"
    end,
})
