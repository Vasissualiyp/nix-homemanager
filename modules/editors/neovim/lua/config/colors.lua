vim.api.nvim_set_hl(0, 'Folded', {ctermbg='black', ctermfg='cyan'})
vim.api.nvim_set_hl(0, 'TreesitterContext', {ctermbg=0})
vim.api.nvim_set_hl(0, 'NormalFloat', {ctermbg=0})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", guibg = "NONE" })
    end,
})


-- COLOR RELATIVE NUMBER LINES DIFFERENTLY BEFORE AND AFTER CURRENT LINE
local function update_line_nr_colors()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local win_height = vim.api.nvim_win_get_height(0)
    local buffer_lines = vim.api.nvim_buf_line_count(0)
    local start_line = math.max(1, current_line - win_height)
    local end_line = math.min(buffer_lines, current_line + win_height)

    vim.fn.clearmatches()

    for i = start_line, end_line do
        if i < current_line then
            vim.fn.matchadd('LineNrAbove', '^\\s*' .. (current_line - i) .. '\\s', 100, -1, {window = 0})
        elseif i > current_line then
            vim.fn.matchadd('LineNrBelow', '^\\s*' .. (i - current_line) .. '\\s', 100, -1, {window = 0})
        end
    end
end

local function setup_highlights()
    local above_color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('DiffAdd')), 'fg#')
    local below_color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('DiffDelete')), 'fg#')
    vim.cmd('highlight LineNrAbove guifg=' .. above_color .. ' guibg=NONE')
    vim.cmd('highlight LineNrBelow guifg=' .. below_color .. ' guibg=NONE')
end

-- Setup highlights initially and update on colorscheme change
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = setup_highlights,
})

-- Update colors around the cursor after a delay to improve responsiveness
vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'}, {
    callback = function()
        vim.defer_fn(update_line_nr_colors, 100)  -- Defer updating line numbers by 100 ms
    end,
})

setup_highlights()

