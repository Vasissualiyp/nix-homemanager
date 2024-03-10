vim.g.limelight_conceal_ctermfg = 'gray'
vim.g.limelight_conceal_ctermfg = 240

function ApplyLimelight(timer_id)
  if vim.g.LimelightActive == 1 then
    -- Save current cursor position
    local save_cursor = vim.api.nvim_win_get_cursor(0)

    -- Ensure the Limelight plugin is loaded by packer
    -- This step is crucial for lazy loading scenarios
    local status_ok, _ = pcall(require, "limelight")
    if not status_ok then
      print("Limelight plugin is not loaded.")
      return
    end

    -- Apply Limelight using nvim_feedkeys
    -- The third argument is a string with the following options:
    -- 'm' for remap, 'n' for no remap, 't' to use termcodes
    -- Since <Plug> mappings require remapping, 'm' or '' is appropriate
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Limelight)", true, false, true), 'm', false)

    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, save_cursor)
  end
end


function DebounceCursorMovement()
  if vim.g.limelight_timer ~= nil then
    vim.fn.timer_stop(vim.g.limelight_timer)
  end
  vim.g.limelight_timer = vim.fn.timer_start(100, ApplyLimelight)
end

vim.g.LimelightActive = 0
function ToggleLimelight()
  if vim.g.LimelightActive == 1 then
    -- Turn off Limelight
    vim.cmd('Limelight! 0')
    vim.g.LimelightActive = 0
    vim.api.nvim_exec('autocmd! LimelightAutoGroup', false)
  else
    -- Turn on Limelight
    vim.g.LimelightActive = 1
    ApplyLimelight(0)
    -- Set up an autocmd to call the debounce function on cursor movements
    vim.api.nvim_create_augroup("LimelightAutoGroup", { clear = true })
    vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
      group = "LimelightAutoGroup",
      callback = function()
        DebounceCursorMovement()
      end,
    })
  end
end

