return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = '[T]est [N]earest File' }),
  vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = '[T]est current [F]ile' }),
  vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>', { desc = '[T]est [A]ll Suite' }),
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = '[T]est [L]ast' }),
  -- vim.keymap.set('n', '<leader>g', ':TestVisit<CR>'),
  vim.cmd("let test#strategy = 'vimux'"),
}
