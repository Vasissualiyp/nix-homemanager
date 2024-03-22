--local references_dir = vim.fn.expand('~/research/references')
vim.g.citerius_references_dir = '~/research/references'
--vim.g.citerius_git_url = 'git@github.com:Vasissualiyp/citeriustest.git'

--require('citerius-vim.citerius_telescope').setup({
--  references_dir = vim.g.citerius_references_dir,
--})
--
---- Citerius note management keybinds
--vim.keymap.set('n', '<leader>N' , ':CiteriusToday<CR>', { noremap = true, silent = true })
--vim.keymap.set('n', '<leader>nc', ':CiteriusCleanup<CR>', { noremap = true, silent = true })
--vim.keymap.set('n', '<leader>n?', ':DisplayCiteriusQuickhelp<CR>', { noremap = true, silent = true })
--
---- Telescope integration keybinds
--local citerius_telescope = require('citerius-vim.citerius_telescope')
--vim.keymap.set('n','<leader>ng', citerius_telescope.grep_references)
--vim.keymap.set('n','<leader>nf', citerius_telescope.search_references)
--
---- Initialize citerius. MUST BE INCLUDED AFTER the definitions of global variables!
--require('citerius-vim.init').setup({
--  references_dir = '~/research/references',
--  author = 'Vasilii Pustovoit',
--  citerius_integration = 1,
--  citerius_src_dir = '~/research/references',
--})


local Path = require('plenary.path')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')

local function fuzzy_find_paper()
    local parent_dir = vim.g.citerius_references_dir
    local csv_file = Path:new(parent_dir):joinpath("papers.csv"):absolute()
    local file = io.open(csv_file, "r")
    if not file then
        print("Failed to open file: " .. csv_file)
        return
    end

    -- Skipping the header and parsing the CSV
    local lines = {}
    local header_skipped = false
    for line in file:lines() do
        if not header_skipped then
            header_skipped = true
        else
            local fields = {}
            for field in line:gmatch('([^,]+)') do
                table.insert(fields, field)
            end
            -- Assuming the fifth column contains the label with double quotes
            local label = fields[5]:gsub('^"', ''):gsub('"$', '')
            table.insert(lines, label)
        end
    end
    file:close()

    -- Using Telescope to pick a line
    pickers.new({}, {
        prompt_title = "Select Paper",
        finder = finders.new_table({
            results = lines,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry,
                    ordinal = entry,
                }
            end,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                print(selection.value)
                actions.close(prompt_bufnr)
            end)
            return true
        end,
    }):find()
end

