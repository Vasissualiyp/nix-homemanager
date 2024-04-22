{ config, pkgs, ... }:
let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    noterius = pkgs.vimUtils.buildVimPlugin {
      name = "noterius-vim";
      src = pkgs.fetchFromGitHub {
        owner = "Vasissualiyp";
		repo = "noterius-vim";
        rev = "a4527fbae371e34302c8734c351734bc2b81ebd2";
        sha256 = "08d16sz77jfwn9yv8s524hhvrm0cd19p6aac3cgkdv90sazsd3gx";
      };
    };
    speedtyper = pkgs.vimUtils.buildVimPlugin {
      name = "speedtyper";
      src = pkgs.fetchFromGitHub {
        owner = "NStefan002";
        repo = "speedtyper.nvim";
        rev = "2d158eed4c753995b0501a3a7a72464fbb213e3d";
        hash = "sha256-8q8DU62Jsx9MYSsuPGCuqXwn5ZfNt0iEVKQRExqELDI=";
      };
    };
in
{
  programs.neovim = {
    enable = true;

	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./lua/config/global_parameters_nix.lua  }
      
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
      ${builtins.readFile ./lua/keymaps/citerius.lua}
      --vim.cmd('source ~/.dotfiles/nvim/vimscript/citerius.vim')
    '';

    extraPython3Packages = ps: with ps; [
      pynvim
	  #pybibget
	  #arxiv
      #neovim
      #jedi
      #pylint
      #black
      # any other python packages
    ];

    plugins = with pkgs.vimPlugins; [

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
	  #(
          #  let
          #    lspServers = pkgs.writeText "lsp_servers.json" (builtins.toJSON (import ./lsp_servers.nix { inherit pkgs; }));
          #  in
          #  {
          #    plugin = nvim-lspconfig;
	  #    config = toLua "${builtins.readFile ./lua/config/lsp.lua}\n${builtins.readFile ./lua/config/lsp_cmp.lua}";
          #  }
	  #)
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
      #{
	  #plugin = vim-smoothie;
	  #config = toLuaFile ./lua/plugins/smoothie.lua;
	  #}
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
	  plugin = noterius; # THIS ONE IS TESTING
	  config = toLuaFile ./lua/keymaps/noterius.lua;
	  }
	  #{
	  #plugin = speedtyper; # THIS ONE IS TESTING - couldn't make it work so far
	  #config = toLuaFile ./lua/plugins/speedtyper.lua;
	  #}
      {
	  plugin = ultisnips;
	  config = toLuaFile ./lua/keymaps/ultisnips.lua;
	  }
    ];

  };

}
