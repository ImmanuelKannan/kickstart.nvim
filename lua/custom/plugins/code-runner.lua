return {
  {
    'CRAG666/code_runner.nvim',
    config = function()
      vim.keymap.set('n', 'qkr', '<cmd>RunCode<cr>', { desc = '[Q]uo[K]ka [R]un' })
      require('code_runner').setup {}
    end,
  },
  {
    'LintaoAmons/scratch.nvim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', 'qkn', '<cmd>Scratch<cr>', { desc = '[Q]uo[K]ka [N]ew' })
      require('scratch').setup {
        filetypes = { 'js', 'ts', 'lua' },
      }
    end,
  },
}
