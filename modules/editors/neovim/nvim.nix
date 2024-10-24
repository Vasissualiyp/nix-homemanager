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
  telescope-luasnip = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-luasnip";
    src = pkgs.fetchFromGitHub {
      owner = "benfowler";
      repo = "telescope-luasnip.nvim";
      rev = "11668478677de360dea45cf2b090d34f21b8ae07";
      hash = "sha256-jzLzucF2rAa3nkHE5n4g2StkSUjMOMK93JCH/g09DQY=";
    };
  };
  cmp-calc = pkgs.vimUtils.buildVimPlugin {
    name = "cmp-calc";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-calc";
      rev = "5947b412da67306c5b68698a02a846760059be2e";
      hash = "sha256-TI1FR0EjzPcjsFdJQ9vXVleQwyXkmqs4TvYyZ8A6cS0=";
    };
  };
  cmp-emoji = pkgs.vimUtils.buildVimPlugin {
    name = "cmp-emoji";
    src = pkgs.fetchFromGitHub {
      owner = "hrsh7th";
      repo = "cmp-emoji";
      rev = "e8398e2adf512a03bb4e1728ca017ffeac670a9f";
      hash = "sha256-Sdgetlwhhc11ufDJH6uaXtbL0EZQFZ2Qgg5yBfG1u7I=";
    };
  };
  cmp-vimtex = pkgs.vimUtils.buildVimPlugin {
    name = "cmp-vimtex";
    src = pkgs.fetchFromGitHub {
      owner = "micangl";
      repo = "cmp-vimtex";
      rev = "5283bf9108ef33d41e704027b9ef22437ce7a15b";
      hash = "sha256-pD2dPdpyn5A/uwonDdAxCX138yBeDqbXDdlG/IKjVTU=";
    };
  };
  cmp-luasnip-choice = pkgs.vimUtils.buildVimPlugin {
    name = "cmp-luasnip-choice";
    src = pkgs.fetchFromGitHub {
        owner = "doxnit";
        repo = "cmp-luasnip-choice";
        rev = "97a367851bc17984b56164b5427a53919aed873a";
        hash = "sha256-GBQpalj0mUGumrEYOSN4glGqZECiKhTSkeAnIaTSALc=";
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
	extraPackages = with pkgs; [
      nil # Nix LSP
	  pyright # Python type checker LSP
	  lua-language-server # Lua LSP
	  bash-language-server # Bash LSP
	  pylint
	  clang
	  clang-tools
	  #fortls # Fortran LSP
	  #clang # Dependency of ccls
	  #llvm # Dependency of ccls
	  #cmake # Dependency of ccls
	  #ccls # C/CPP LSP
	];

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
	  #copilot-vim
      #ripgrep
      #vim-tex-fold
	  nvim-treesitter-textobjects
      nvim-web-devicons
	  leap-nvim
	  vim-tmux-navigator
	  vim-css-color
	  nvim-lspconfig
	  vimspector # Debugger
	  fzf-vim
	  startup-nvim
	  vim-snippets

      {
	    plugin = telescope-nvim;
	    config = toLua "${builtins.readFile ./lua/plugins/telescope.lua}\n${builtins.readFile ./lua/keymaps/telescope.lua}";
	  }
      {
	    plugin = oil-nvim;
	    config = toLua "${builtins.readFile ./lua/plugins/oil.lua}\n${builtins.readFile ./lua/keymaps/oil.lua}";
	  }
	  #{
	  #  plugin = nvim-treesitter-context; # Showing the current funciton start at the top
	  #  config = toLuaFile ./lua/plugins/context.lua;
	  #}
      {
	    plugin = harpoon;
	    config = toLua "${builtins.readFile ./lua/plugins/harpoon.lua}\n${builtins.readFile ./lua/keymaps/harpoon.lua}";
	  }
	  {
	    plugin = SimpylFold;
	    config = toLuaFile ./lua/plugins/simpylfold.lua;
	  }
	  {
	    plugin = vimtex;
	    config = "source ~/.dotfiles/nvim/vimscript/vimtex.vim \nlua << EOF\n${builtins.readFile ./lua/plugins/vimtex.lua}\nEOF";
	  }
	  {
	    plugin = vimwiki;
	    config = toLuaFile ./lua/plugins/vimwiki.lua;
	  }
	  {
	    plugin = calendar-vim;
	    config = toLuaFile ./lua/plugins/calendar.lua;
	  }
	  {
	    plugin = luasnip;
	    config = toLua "${builtins.readFile ./lua/plugins/luasnip.lua}\n${builtins.readFile ./lua/keymaps/luasnip.lua}";
	  }
      telescope-luasnip # Packaged myself
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
	  {
	    plugin = noterius; # THIS ONE IS TESTING
	    config = toLuaFile ./lua/keymaps/noterius.lua;
	  }
	  {
	    plugin = speedtyper; # THIS ONE IS TESTING - couldn't make it work fully so far
	    config = toLuaFile ./lua/plugins/speedtyper.lua;
	  }



	  # Autocompletion with cmp
	  cmp_luasnip
	  cmp-buffer
	  cmp-path
	  cmp-emoji
	  cmp-calc
	  cmp-vimtex
      cmp-luasnip-choice
	  cmp-nvim-lsp
      {
	    plugin = nvim-cmp; # Drop-down menu for luasnips
	    config = toLuaFile ./lua/plugins/cmp.lua;
	  }
	  #(
          #  let
          #    lspServers = pkgs.writeText "lsp_servers.json" (builtins.toJSON (import ./lsp_servers.nix { inherit pkgs; }));
          #  in
          #  {
          #    plugin = nvim-lspconfig;
	  #    config = toLua "${builtins.readFile ./lua/config/lsp.lua}\n${builtins.readFile ./lua/config/lsp_cmp.lua}";
          #  }
	  #)

	  # Something for autocomplete
	  #{
	  #  plugin = lsp_signature-nvim; 
	  #  config = toLuaFile ./lua/plugins/lsp_signature.lua;
	  #}
	  
	  # CoC Autocompletion
	  #{
	  #  plugin = coc-nvim; # Autocompletion
	  #  config = toLuaFile ./lua/plugins/coc.lua;
	  #}
	  #telescope-coc-nvim



	  # UltiSnips is being replaced by LuaSnips
	  #{
	  #  plugin = ultisnips;
	  #  config = toLuaFile ./lua/keymaps/ultisnips.lua;
	  #}
	  #telescope-ultisnips-nvim
    ];

  };

}
