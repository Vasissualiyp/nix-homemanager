-- Set up nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup({
  completion = {
    completeopt="menu,menuone,preview,noselect",
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
	{ name = 'luasnip' },
	{ name = 'calc' },
	{ name = 'emoji' },
	{ name = 'vimtex' },
    { name = 'luasnip_choice' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
-- Set up cmp-luasnip-choice
require('cmp_luasnip_choice').setup({
    auto_open = true, -- Automatically open nvim-cmp on choice node
})
-- Set up lspconfig.
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Bash LSP
lspconfig.bashls.setup{
  capabilities = capabilities
}

-- Python LSP
lspconfig.pyright.setup{
  capabilities = capabilities
}

-- Nix LSP
lspconfig.nil_ls.setup{
  capabilities = capabilities
}

-- Lua LSP
lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

-- C/C++: clangd
lspconfig.clangd.setup {
  capabilities = capabilities,
}


-- BROKEN LSPs (Fortran, C/CPP, Makefile)

---- Fortran LSP
--lspconfig.fortls.setup{
--  cmd = { "fortls", "--notify_init", "--hover_signature", "--hover_language=fortran", "--use_signature_help" },
--  filetypes = { "fortran" },
--  root_dir = lspconfig.util.root_pattern(".fortls") or vim.fn.getcwd(),
--  settings = {},  -- You can leave this empty or customize it with other settings
--  capabilities = capabilities 
--}
--
--
--cmp.setup({
--  sources = {
--    { name = 'vimtex', },
--  },
--})

