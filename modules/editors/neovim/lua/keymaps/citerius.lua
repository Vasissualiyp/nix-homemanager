--local references_dir = vim.fn.expand('~/research/references')
--vim.g.citerius_references_dir = '~/research/references'
function _G.fuzzy_find_paper()
    local Path = require('plenary.path')
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values
    local action_state = require('telescope.actions.state')
    local actions = require('telescope.actions')

    -- Constructing parent_dir with $HOME environment variable
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
            -- Storing entire line for display and search in Telescope
            table.insert(lines, line)
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
                local fields = {}
                for field in selection.value:gmatch('([^,]+)') do
                    table.insert(fields, field)
                end
                -- Extracting and cleaning the 5th column from the selected line
                local label = fields[5]:gsub('^"', ''):gsub('"$', '')
                vim.g.selected_paper_label = label -- Set the global variable
                actions.close(prompt_bufnr)
            end)
            return true
        end,
    }):find()
end

function _G.execute_fuzzy_find_eqns_figs()
    if vim.g.selected_paper_label then
        local parent_dir = os.getenv("HOME") .. '/research/references'
        local script_path = '/home/vasilii/Software/Citerius/bin/fuzzy_find_eqns_figs.sh'
		local command = string.format('%s "%s" "%s"', script_path, parent_dir, vim.g.selected_paper_label)
		--local command = string.format('bash -c \'%s "%s" "%s"\'', script_path, parent_dir, vim.g.selected_paper_label)
        
        -- Execute the command and capture its output
        local output = vim.fn.system(command)

        -- Check for an error in the system call
        if vim.v.shell_error ~= 0 then
            print("Error executing command: " .. command)
        else
		    -- Split `output` into lines if it contains newlines
            local lines = {}
            for line in output:gmatch("([^\n]+)") do
                table.insert(lines, line)
            end
            
            -- Insert the lines into the document
            vim.api.nvim_put(lines, "c", true, {noremap = true})
        end
    else
        print("No label has been selected.")
    end
end

function _G.fuzzy_find_eqns_figs()
   fuzzy_find_paper() 
   execute_fuzzy_find_eqns_figs()
end
