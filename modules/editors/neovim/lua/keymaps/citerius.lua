--local references_dir = vim.fn.expand('~/research/references')
--vim.g.citerius_references_dir = '~/research/references'
function _G.fuzzy_find_paper(callback)
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values
    local action_state = require('telescope.actions.state')
    local actions = require('telescope.actions')

    local home = os.getenv("HOME")
    local parent_dir = home .. '/research/references'
    local csv_file = parent_dir .. "/papers.csv"
    local file = io.open(csv_file, "r")
    if not file then
        print("Failed to open file: " .. csv_file)
        return
    end

    local lines = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()

    pickers.new({}, {
        prompt_title = "Select Paper",
        finder = finders.new_table({
            results = lines,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                if selection and callback then
                    local fields = vim.split(selection.value, ",")
                    local label = fields[5]:gsub('^"', ''):gsub('"$', '')
                    vim.schedule(function() callback(label) end)
                end
            end)
            return true
        end,
    }):find()
end

function _G.execute_fuzzy_find_eqns_figs(label)
    local parent_dir = os.getenv("HOME") .. '/research/references'
    local script_path = '/home/vasilii/Software/Citerius/bin/fuzzy_find_eqns_figs.sh'
    -- Use the `label` argument directly instead of `vim.g.selected_paper_label`
    local command = string.format('%s "%s" "%s"', script_path, parent_dir, label)
    
    local output = vim.fn.system(command)
    if vim.v.shell_error ~= 0 then
        print("Error executing command: " .. command)
        return
    end

    local lines = vim.split(output, "\n", true)
    vim.api.nvim_put(lines, '', true, true)
end

function _G.fuzzy_find_eqns_figs()
    _G.fuzzy_find_paper(_G.execute_fuzzy_find_eqns_figs)
end
