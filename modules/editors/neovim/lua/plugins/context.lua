vim.cmd [[
  hi TreesitterContextBottom gui=underline guisp=Grey
  hi TreesitterContextLineNumberBottom gui=underline guisp=Grey
]]

require'treesitter-context'.setup{
  enable = true,
  max_lines = 3,
}
