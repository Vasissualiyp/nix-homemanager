-- Load and configure lsp_signature.nvim
require'lsp_signature'.setup({
  bind = true,  -- This is mandatory, otherwise border config won't get registered.
  floating_window = true,  -- Show signature in floating window
  hint_enable = true,      -- Enable signature hints while typing
  hint_prefix = "🐍 ",      -- Change the prefix used for signature hints
  transparency = 20,       -- Adjust transparency of the floating window
})
