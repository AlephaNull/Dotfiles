local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  --[[ use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  } --]]
  use 'folke/tokyonight.nvim'
 --  use 'rmehri-01/onenord.nvim'
  use 'kyazdani42/nvim-web-devicons' -- web icons
  use "rafamadriz/friendly-snippets"
  use 'L3MON4D3/LuaSnip' -- snippets
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'andweeb/presence.nvim' -- Discord RPC
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictogrtams for autocompletion
  use 'hrsh7th/cmp-buffer' 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp' -- Completion 
  use {
    'nvim-treesitter/nvim-treesitter', -- syntax highlighting
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'windwp/nvim-autopairs' -- nvim-autopairs
  use 'windwp/nvim-ts-autotag' -- autotags 

  use 'nvim-lua/plenary.nvim' -- common utilities
  use 'nvim-telescope/telescope.nvim' -- fuzzy finding
  use 'nvim-telescope/telescope-file-browser.nvim' -- fuzzy finder browser
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use 'glepnir/lspsaga.nvim'
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'norcalli/nvim-colorizer.lua'
end)

