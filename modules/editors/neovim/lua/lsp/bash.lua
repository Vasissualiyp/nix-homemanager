require'lspconfig'.bashls.setup{}

local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
      filetypes = { "sh" },
	  single_file_supper = { "true" },
    })
  end,
})
lspconfig.bashls.setup {}
