return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'macchiato',
        highlight_overrides = {
          macchiato = function(macchiato)
            return {
              LineNr = {
                fg = '#b49edb',
              },
              LineNrAbove = { fg = '#8087a2' },
              LineNrBelow = { fg = '#8087a2' },
            }
          end,
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'palenight',
          extensions = { 'neo-tree' },
        },
      }
    end,
  },
  {
    'letieu/btw.nvim',
    config = function()
      require('btw').setup()
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      vim.opt.termguicolors = true

      require('nvim-highlight-colors').setup {}
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    config = function()
      local dropbar = require 'dropbar.api'
      vim.keymap.set('n', '<Leader>;', dropbar.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar.select_next_context, { desc = 'Select next context' })
    end,
  },
}
