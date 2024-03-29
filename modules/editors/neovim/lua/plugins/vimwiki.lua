-- Set options
--vim.opt.nocompatible = true -- only matters in vim
vim.cmd [[filetype plugin on]]
vim.cmd [[syntax on]]

-- Custom command
vim.api.nvim_create_user_command('Diary', 'VimwikiDiaryIndex', {})

---- Autocommand group for VimWiki
--local vimwikigroup = vim.api.nvim_create_augroup("vimwikigroup", { clear = true })
--vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--  pattern = "diary.wiki",
--  command = "VimwikiDiaryGenerateLinks",
--  group = vimwikigroup,
--})
--
--function _G.VimwikiLinkHandler(link)
--  local mode = ""
--  if link:match('^zl:') then
--    mode = 'light'
--    link = link:sub(4)
--  elseif link:match('^zd:') then
--    mode = 'dark'
--    link = link:sub(4)
--  else
--    return 0
--  end
--
--  local link_infos = vim.fn['vimwiki#base#resolve_link'](link)
--  if link_infos.filename == '' then
--    print('Vimwiki Error: Unable to resolve link!')
--    return 0
--  else
--    if mode == 'light' then
--      vim.cmd('!zathura -c ~/.config/zathura/zathurarc-light ' .. link_infos.filename)
--    else
--      vim.cmd('!zathura ' .. link_infos.filename)
--    end
--    return 1
--  end
--end
--
---- To expose the Lua function to Vimscript if needed:
--vim.api.nvim_set_var('VimwikiLinkHandler', VimwikiLinkHandler)
