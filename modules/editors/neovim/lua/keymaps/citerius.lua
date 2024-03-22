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
    local is_header = true  -- Flag to skip the first line
    for line in file:lines() do
        if not is_header then
            table.insert(lines, line)
        else
            is_header = false  -- After the first iteration, set this to false
        end
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

    -- Prompt the user for additional input in Neovim's command line
    local input_prompt = "Enter the items you want to find (e.g., 'f5 e12' for 5th figure and 12th equation): "
    local input_line = vim.fn.input(input_prompt)

    -- Construct the command with the additional user input
    local command = string.format('%s "%s" "%s" "%s"', script_path, parent_dir, label, input_line)
    
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

-- Paste the label at the cursor position
function _G.paste_label(label)
    vim.api.nvim_put({label}, 'c', true, true)
end
function _G.fuzzy_find_paste_label()
    _G.fuzzy_find_paper(_G.paste_label)
end
