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
    enabled = false,
    config = function()
      local dropbar = require 'dropbar.api'
      vim.keymap.set('n', '<Leader>;', dropbar.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar.select_next_context, { desc = 'Select next context' })
    end,
  },
  {
    'mistricky/codesnap.nvim',
    build = 'make',
    config = function()
      require('codesnap').setup { has_line_number = true, watermark = '' }
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup {
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        }
      end
      require('ufo').setup()
    end,
  },
}
