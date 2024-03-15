{ config, pkgs, ... }:
let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
{
  programs.neovim = {
    enable = true;

	extraLuaConfig = ''
      ${builtins.readFile ./lua/config/global_parameters.lua  }
      
      -- This is needed to setup the path, which is essential for nvim on NixOS to work
      ${builtins.readFile ./lua/config/path_setup.lua}

	  -- Add vimwiki directory
      vim.cmd('source ~/.dotfiles/nvim/vimscript/vimwiki.vim')
      
      -- Load config settings
      ${builtins.readFile ./lua/keymaps/global.lua}
      ${builtins.readFile ./lua/config/colors.lua}
      ${builtins.readFile ./lua/config/digraphs.lua}

      ${builtins.readFile ./lua/plugins/treesitter.lua}

      ${builtins.readFile ./lua/keymaps/inkscape.lua}
      vim.cmd('source ~/.dotfiles/nvim/vimscript/noterius.vim')
      ${builtins.readFile ./lua/keymaps/noterius.lua}
	'';
    extraPython3Packages = ps: with ps; [
	  pynvim
      #neovim
      #jedi
      #pylint
      #black
      # any other python packages
    ];
    plugins = with pkgs.vimPlugins; [
      #plenary

      nvim-web-devicons
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-bash
        p.tree-sitter-c
        p.tree-sitter-cpp
        p.tree-sitter-csv
        p.tree-sitter-ini
        p.tree-sitter-json
        p.tree-sitter-latex
        p.tree-sitter-lua
        p.tree-sitter-make
        p.tree-sitter-nix
        p.tree-sitter-python
        p.tree-sitter-rust
        p.tree-sitter-vim
        p.tree-sitter-yaml
	  ]))
	  nvim-treesitter-context
	  nvim-treesitter-textobjects
      {
	  plugin = telescope-nvim;
	  config = toLua "${builtins.readFile ./lua/plugins/telescope.lua}\n${builtins.readFile ./lua/keymaps/telescope.lua}";
	  }
	  vim-tmux-navigator
      {
	  plugin = harpoon;
	  config = toLua "${builtins.readFile ./lua/plugins/harpoon.lua}\n${builtins.readFile ./lua/keymaps/harpoon.lua}";
	  }
      #ripgrep
	  leap-nvim
	  copilot-vim
	  vim-css-color
	  nvim-lspconfig
	  {
	  plugin = SimpylFold;
	  config = toLuaFile ./lua/plugins/simpylfold.lua;
	  }
      {
	  plugin = vimtex;
	  config = "source ~/.dotfiles/nvim/vimscript/vimtex.vim \nlua << EOF\n${builtins.readFile ./lua/plugins/vimtex.lua}\nEOF";
	  }
      #vim-tex-fold
      {
	  plugin = vimwiki;
	  config = toLuaFile ./lua/plugins/vimwiki.lua;
	  }
      {
	  plugin = calendar-vim;
	  config = toLuaFile ./lua/plugins/calendar.lua;
	  }
      {
	  plugin = vim-smoothie;
	  config = toLuaFile ./lua/plugins/smoothie.lua;
	  }
      {
	  plugin = limelight-vim;
	  config = toLua "${builtins.readFile ./lua/plugins/limelight.lua}\n${builtins.readFile ./lua/keymaps/limelight.lua}";
	  }
      {
	  plugin = lightline-vim;
	  config = toLuaFile ./lua/plugins/lightline.lua;
	  }
	  vimspector
	  fzf-vim
      #fzf
	  startup-nvim
	  vim-snippets
	  telescope-ultisnips-nvim
      {
	  plugin = ultisnips;
	  config = toLuaFile ./lua/keymaps/ultisnips.lua;
	  }

	  # Mason doesn't work on NixOs
      #mason-nvim
      #mason-lspconfig-nvim
    ];

  };

}
