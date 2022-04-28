local packer = require'core.packer'

packer.startup(function()
  use 'wbthomason/packer.nvim'

  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-eunuch' }
  use { 'tpope/vim-sleuth' }
  use { 'wakatime/vim-wakatime' }
  use { 'mg979/vim-visual-multi' }
  use { 'airblade/vim-rooter' }
  use { 'sheerun/vim-polyglot' }
  use { 'sickill/vim-pasta' }
  use { 'tommcdo/vim-lion' }
  use { 'farmergreg/vim-lastplace' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'moll/vim-bbye' }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require'configs.toggleterm'.config()
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require'configs.lualine'.config()
    end,
  }

  use {
    'mrjones2014/smart-splits.nvim',
    modile = 'smart-splits',
    config = function()
      require'configs.smart-splits'.config()
    end,
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require'configs.which-key'.config()
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require'configs.gitsigns'.config()
    end,
  }

  use {
    'APZelos/blamer.nvim',
    config = function()
      require'configs.blamer'.config()
    end,
  }

  use {
    'akinsho/bufferline.nvim',
    config = function()
      require'configs.bufferline'.config()
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require("configs.treesitter").config()
    end,
  }


  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = 'nvim-treesitter',
  }

  use {
    'rcarriga/nvim-notify',
    config = function()
      require'configs.notify'.config()
    end
  }

  use {
    'neoclide/coc.nvim',
    branch = 'release',
    run = 'yarn install --frozen-lockfile',
    config = function()
      require'configs.coc'.config()
    end
  }

  use {
    'glepnir/dashboard-nvim',
    config = function()
      require'configs.dashboard'.config()
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

   use {
     'ghifarit53/tokyonight-vim',
     rtp = "vim/",
     config = function() vim.cmd("colorscheme tokyonight") end
   }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('configs.neo-tree').config()
    end
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  }
end)
