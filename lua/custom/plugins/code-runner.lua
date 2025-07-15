return {
  {
    'CRAG666/code_runner.nvim',
    enabled = false,
    config = function()
      vim.keymap.set('n', 'qkr', '<cmd>RunCode<cr>', { desc = '[Q]uo[K]ka [R]un' })
      require('code_runner').setup {}
    end,
  },
  {
    'LintaoAmons/scratch.nvim',
    enabled = false,
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', 'qkn', '<cmd>Scratch<cr>', { desc = '[Q]uo[K]ka [N]ew' })
      require('scratch').setup {
        filetypes = { 'js', 'ts', 'lua' },
      }
    end,
  },
}
