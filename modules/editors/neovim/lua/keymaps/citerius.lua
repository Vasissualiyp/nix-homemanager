--local references_dir = vim.fn.expand('~/research/references')
--vim.g.citerius_references_dir = '~/research/references'
vim.g.citerius_references_dir = os.getenv("HOME") .. '/research/references'


--Extract field id from the csv file using telescope
function _G.fuzzy_find_paper(callback,field_id)
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values
    local action_state = require('telescope.actions.state')
    local actions = require('telescope.actions')

    local parent_dir = vim.g.citerius_references_dir
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
                    local label = fields[field_id]:gsub('^"', ''):gsub('"$', '')
                    vim.schedule(function() callback(label) end)
                end
            end)
            return true
        end,
    }):find()
end

function _G.execute_fuzzy_find_eqns_figs(label)
    local parent_dir = vim.g.citerius_references_dir
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

function _G.open_tex_document(label, mode)
    local parent_dir = vim.g.citerius_references_dir
    local target_dir = parent_dir .. '/' .. label .. '/src'
    local command = 'ls ' .. target_dir .. '/*.tex'
    local handle = io.popen(command, 'r')
    if not handle then
        print('Failed to open directory: ' .. target_dir)
        return
    end

    local tex_files = {}
    for file in handle:lines() do
        table.insert(tex_files, file)
    end
    handle:close()

    -- Function to open file based on mode
    local function open_file(file)
        if mode == "tab" then
            vim.cmd('tabnew ' .. file)
        elseif mode == "split" then
            vim.cmd('split ' .. file)
        else -- Default mode :n
            vim.cmd('edit ' .. file)
        end
    end

    -- Selecting and opening the file
    if #tex_files == 1 then
        open_file(tex_files[1])
    elseif #tex_files > 1 then
        vim.ui.select(tex_files, {prompt = 'Select a file:'}, function(choice)
            if choice then open_file(choice) end
        end)
    else
        print('No .tex file found in ' .. target_dir)
    end
end

function _G.fuzzy_find_eqns_figs()
    _G.fuzzy_find_paper(_G.execute_fuzzy_find_eqns_figs,5)
end

-- Paste the label at the cursor position
function _G.paste_label(label)
    vim.api.nvim_put({label}, 'c', true, true)
end
function _G.fuzzy_find_paste_label()
    _G.fuzzy_find_paper(_G.paste_label,5)
end

-- Open source tex file. 
-- Modes: "tab", "split", none (would do :n <src>)
function _G.open_paper_src(mode)
    _G.fuzzy_find_paper(function(label)
        _G.open_tex_document(label, mode)
    end, 5) -- Assuming field_id 5 contains the label
end
