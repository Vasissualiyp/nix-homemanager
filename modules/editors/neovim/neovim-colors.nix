{ pkgs, config, ... }: {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = mini-nvim;
        config = ''
          lua << END
            require('mini.base16').setup({
              palette = {
                base00 = '#${config.colorScheme.palette.base00}',
                base01 = '#${config.colorScheme.palette.base01}',   
                base02 = '#${config.colorScheme.palette.base02}',    
                base03 = '#${config.colorScheme.palette.base03}',    
                base04 = '#${config.colorScheme.palette.base04}',    
                base05 = '#${config.colorScheme.palette.base05}',
                base06 = '#${config.colorScheme.palette.base06}',    
                base07 = '#${config.colorScheme.palette.base07}',    
                base08 = '#${config.colorScheme.palette.base08}',    
                base09 = '#${config.colorScheme.palette.base09}',   
                base0A = '#${config.colorScheme.palette.base0A}',    
                base0B = '#${config.colorScheme.palette.base0B}',    
                base0C = '#${config.colorScheme.palette.base0C}',   
                base0D = '#${config.colorScheme.palette.base0D}',
                base0E = '#${config.colorScheme.palette.base0E}',
                base0F = '#${config.colorScheme.palette.base0F}',    
              },
            })

            -- Set the line number and sign column background colors
            vim.api.nvim_command('highlight LineNr guifg=#${config.colorScheme.palette.base03} guibg=#${config.colorScheme.palette.base00}')
            vim.api.nvim_command('highlight CursorLineNr guifg=#${config.colorScheme.palette.base05} guibg=#${config.colorScheme.palette.base00}')
            vim.api.nvim_command('highlight SignColumn guibg=#${config.colorScheme.palette.base00}')
            vim.api.nvim_command('highlight LineNrAbove guifg=#${config.colorScheme.palette.base03} guibg=#${config.colorScheme.palette.base00}')
            vim.api.nvim_command('highlight LineNrBelow guifg=#${config.colorScheme.palette.base03} guibg=#${config.colorScheme.palette.base00}')
          
          END
        '';
      }
    ];
  };
}
