-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
    },
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        backends = { 'treesitter', 'lsp' },
      }
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {}
    end,
  },

  -- {
  --   'dense-analysis/ale',
  --   config = function()
  --     local g = vim.g
  --     g.ale_ruby_rubocop_auto_correct_all = 1
  --     g.ale_linters = {
  --       javascript = { 'eslint' },
  --     }
  --   end,
  -- },

  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
    config = function()
      require('lint').linters_by_ft = {
        javascript = { 'eslint' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function()
          require('lint').try_lint(nil, { ignore_errors = true })
        end,
      })
    end,
  },

  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    "kkoomen/vim-doge",
  },
}
