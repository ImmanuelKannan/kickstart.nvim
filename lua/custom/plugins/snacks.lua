return {
  {
    'folke/snacks.nvim',
    opts = {
      scroll = {},
      picker = {},
    },
    keys = {
      {
        '<leader><space>',
        function()
          Snacks.picker.files({ hidden = true, ignored = true, exclude={ "**/node_modules/*", "**/dist/*" } })
        end,
        desc = 'Find Files',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Search Buffers',
      },
      {
        '<leader>,',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Search Buffers',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = 'Search Keymaps',
      },
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Search Grep',
      },
    },
  },
}
