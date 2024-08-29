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
-- Function to update line number colors
local function update_line_nr_colors()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local total_lines = vim.api.nvim_buf_line_count(0)
    
    -- Clear existing matches to prevent overlap
    vim.fn.clearmatches()
    
    -- Apply custom highlight groups for line numbers
    for i = 1, total_lines do
        if i < current_line then
            vim.fn.matchadd('LineNrAbove', [[^\s*]] .. (current_line - i) .. [[\s]], 10, -1, {window = 0})
        elseif i > current_line then
            vim.fn.matchadd('LineNrBelow', [[^\s*]] .. (i - current_line) .. [[\s]], 10, -1, {window = 0})
        end
    end
end

-- Function to set up highlight groups based on the current colorscheme
local function setup_highlights()
    -- Get colors from existing highlight groups
    local above_gui_color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('DiffAdd')), 'fg#')
    local below_gui_color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('DiffDelete')), 'fg#')
    
    -- Get terminal colors (if available)
    local above_cterm_color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('DiffAdd')), 'fg', 'cterm')
    local below_cterm_color = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('DiffDelete')), 'fg', 'cterm')

    -- Set custom highlight groups
    local cmd = string.format('highlight LineNrAbove guifg=%s guibg=NONE', above_gui_color)
    if above_cterm_color ~= "" then
        cmd = cmd .. string.format(' ctermfg=%s ctermbg=NONE', above_cterm_color)
    end
    vim.cmd(cmd)

    cmd = string.format('highlight LineNrBelow guifg=%s guibg=NONE', below_gui_color)
    if below_cterm_color ~= "" then
        cmd = cmd .. string.format(' ctermfg=%s ctermbg=NONE', below_cterm_color)
    end
    vim.cmd(cmd)
end

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Autocommands to update colors on cursor move and colorscheme change
vim.api.nvim_create_augroup('LineNrColors', {clear = true})
vim.api.nvim_create_autocmd(
    {'CursorMoved', 'CursorMovedI', 'WinEnter', 'BufWinEnter'},
    {
        group = 'LineNrColors',
        pattern = '*',
        callback = update_line_nr_colors,
    }
)
vim.api.nvim_create_autocmd('ColorScheme', {
    group = 'LineNrColors',
    pattern = '*',
    callback = setup_highlights,
})

-- Initial setup
setup_highlights()
update_line_nr_colors()
