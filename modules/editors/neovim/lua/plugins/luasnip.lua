-- Load snippets from ~/.config/nvim/LuaSnip/
require("luasnip.loaders.from_lua").load({paths = "~/.dotfiles/nvim/LuaSnip/"})
--require("luasnip").config.set_config({enable_autosnippets = true})
require("luasnip").config.set_config({ -- Setting LuaSnip config
  -- Use <Tab> (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
  enable_autosnippets = true
})
