vim.api.nvim_set_hl(0, 'Folded', {ctermbg='black', ctermfg='cyan'})
vim.api.nvim_set_hl(0, 'TreesitterContext', {ctermbg=0})
vim.api.nvim_set_hl(0, 'NormalFloat', {ctermbg=0})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", guibg = "NONE" })
    end,
})

