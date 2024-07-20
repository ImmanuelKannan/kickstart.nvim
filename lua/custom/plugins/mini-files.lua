return {
  {
    'echasnovski/mini.files',
    version = false,
    config = function()
      require('mini.files').setup();

      vim.keymap.set('n', '<leader>b', function()
        if not MiniFiles.close() then MiniFiles.open() end
      end, { desc = 'Toggle File [B]rowser' })
    end
  },
}
