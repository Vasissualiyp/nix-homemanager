local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  --Nvim plugins
  'nvim-lua/plenary.nvim',

  --Treesitter--
  'nvim-tree/nvim-web-devicons',
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
  {
    'nvim-treesitter/nvim-treesitter-context',
      dependencies= {
  	    'nvim-treesitter/nvim-treesitter-textobjects',
  	  }
  },

  --Navigation--
  'nvim-telescope/telescope.nvim',
  'christoomey/vim-tmux-navigator',
  'ThePrimeagen/harpoon',
  'BurntSushi/ripgrep',
  'ggandor/leap.nvim',
  'github/copilot.vim',

  'ap/vim-css-color',

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  --Python--
  'tmhedberg/SimpylFold',

  --Latex--
  'lervag/vimtex',      --main vimtex
  'matze/vim-tex-fold', --folding
  "micangl/cmp-vimtex", --autocompletion for citations

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp', --completion
  'quangnguyen30192/cmp-nvim-ultisnips', --completion for ultisnips

  -- Vimwiki
  {
    "vimwiki/vimwiki",
    init = function()
        vim.g.vimwiki_list = {
            {
                path = '~/Documents/wiki/Research',
                syntax = 'default',
				listsyms = '✗○◐●✓',
                ext = '.wiki',
            },
        }
    end,
  },


  --Vim Plugins--
  'mattn/calendar-vim',
  'psliwka/vim-smoothie',
  'junegunn/limelight.vim',
  'itchyny/lightline.vim',
  'puremourning/vimspector',
  'https://github.com/kshenoy/vim-signature',
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end
   },

  {
    'startup-nvim/startup.nvim',
    dependencies = {'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim'},
    config = function()
      require'startup'.setup()
    end
  },

  --UltiSnips--
  'jdujava/telescope-ultisnips.nvim',
  -- I've been trying to make my vim ultisnips work with nvim. Another snippets are in the folder: u
  --/home/vasilii/.local/share/nvim/site/pack/packer/start/vim-snippets/UltiSnips/tex.snippets:148
  'SirVer/ultisnips',
  'honza/vim-snippets',
})
require('telescope').load_extension('ultisnips')
--require('telescope').load_extension('ultisnips')
require("startup").setup({theme = "evil"})
require('leap').create_default_mappings()
require("mason").setup()
--require('mason-config')
--require('lsp-config').setup()
require("mason-lspconfig").setup()
