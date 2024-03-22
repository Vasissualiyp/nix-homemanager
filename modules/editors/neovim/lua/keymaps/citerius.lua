--local references_dir = vim.fn.expand('~/research/references')
--vim.g.citerius_references_dir = '~/research/references'
function _G.fuzzy_find_paper()
    local Path = require('plenary.path')
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values
    local action_state = require('telescope.actions.state')
    local actions = require('telescope.actions')

	local home = os.getenv("HOME")
    local parent_dir = home .. '/research/references'
    local csv_file = Path:new(parent_dir):joinpath("papers.csv"):absolute()
    local file = io.open(csv_file, "r")
    if not file then
        print("Failed to open file: " .. csv_file)
        return
    end

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
            local label = fields[5]:gsub('^"', ''):gsub('"$', '')
            table.insert(lines, label)
        end
    end
    file:close()

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
