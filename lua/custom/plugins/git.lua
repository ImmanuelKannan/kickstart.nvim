return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      local neogit = require 'neogit'
      local diffview = require 'diffview'

      diffview.setup {
        view = {
          merge_tool = {
            layout = 'diff3_mixed',
          },
        },
      }

      neogit.setup {}

      vim.keymap.set('n', '<leader>gs', neogit.open, { desc = '[G]it [S]tatus' })
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },
}
