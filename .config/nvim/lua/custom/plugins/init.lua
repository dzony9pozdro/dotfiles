-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    config = function() require('nvim-surround').setup() end,
  },

  -- Catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
      }
    end,
  },

  -- Gruvbox
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        transparent_mode = false,
        contrast = 'soft', -- hard, medium, soft
      }
    end,
  },

  -- Rosé Pine
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'auto', -- auto, main, moon, dawn
        dark_variant = 'main',
      }
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'BufReadPost',
    config = function() require('rainbow-delimiters.setup').setup {} end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPost',
    config = function()
      require('ibl').setup {
        indent = { char = '▏' },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
        },
      }

      -- local function set_scope_hl()
      --   vim.api.nvim_set_hl(0, '@ibl.scope.underline.1', {
      --     link = 'Function',
      --     -- underline = true,
      --     sp = '#fabd2f',
      --   })
      -- end
      --
      -- vim.api.nvim_create_autocmd('ColorScheme', {
      --   pattern = '*',
      --   callback = set_scope_hl,
      -- })
      --
      -- set_scope_hl()
    end,
  },
  {
    'vague-theme/vague.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        -- optional configuration here
      }
    end,
  },
  {
    'tpope/vim-endwise',
    ft = { 'ruby', 'lua', 'vim', 'sh', 'bash', 'zsh' },
  },
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'neovim/nvim-lspconfig' },
    ft = { 'html', 'eruby', 'css', 'scss', 'javascriptreact', 'typescriptreact' },
    opts = {
      document_color = { enabled = true },
      conceal = { enabled = true }, -- hides the class soup, expands on the cursor line
      server = { override = false }, -- we register tailwindcss via vim.lsp.config; skip the deprecated lspconfig path
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin-frappe', -- or whatever you're using
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
      }
    end,
  },
  {
    'nvzone/floaterm',
    dependencies = { 'nvzone/volt' },
    config = function()
      require('floaterm').setup {}

      local ft = require 'floaterm'

      -- Only keybind you actually want
      vim.keymap.set('n', '<leader>tt', function() ft.toggle() end)
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
