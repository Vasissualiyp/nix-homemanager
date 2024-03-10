-- Get the full path to your nvim configuration directory
local config_dir = vim.fn.stdpath('config')

-- Append the path to where Lua modules are stored within your config directory
package.path = config_dir .. '/lua/?.lua;' .. package.path
package.path = config_dir .. '/lua/?/init.lua;' .. package.path

-- If you have compiled Lua modules, append the path for those as well
-- Note: Adjust the path according to where your compiled modules are located
-- package.cpath = config_dir .. '/?.so;' .. package.cpath

