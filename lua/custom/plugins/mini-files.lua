return {
  {
    'echasnovski/mini.files',
    version = false,
    config = function()
      require('mini.files').setup();

      vim.keymap.set('n', '<leader>b', function()
        if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end
      end, { desc = 'Toggle File [B]rowser' })
    end
  },
}
