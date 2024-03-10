-- Improved LSP Setup
local lspconfig = require('lspconfig')

-- Function to enable formatting on save for supported languages
local function lsp_format_on_save()
  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      vim.lsp.buf.format({ async = true })
    end,
  })
end

-- Global LSP settings
local global_opts = {
  -- Add settings that are global to all LSP servers here
}

-- Enable formatting on save for specific servers
--lsp_format_on_save()

