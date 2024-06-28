-- Yes, we're just executing a bunch of Vimscript, but this is the officially
-- endorsed method; see https://github.com/L3MON4D3/LuaSnip#keymaps
vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
imap <silent><expr> kj luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'kj'
smap <silent><expr> kj luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'kj'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>luasnip-next-choice', {})
vim.api.nvim_set_keymap('s', '<C-j>', '<Plug>luasnip-next-choice', {})
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>luasnip-prev-choice', {})
vim.api.nvim_set_keymap('s', '<C-k>', '<Plug>luasnip-prev-choice', {})


