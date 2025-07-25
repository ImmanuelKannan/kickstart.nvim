return {
  {
    'folke/snacks.nvim',
    opts = {
      -- scroll = {},
      picker = {
        preview = false,
        layout = { preset = 'vscode' },
      },
    },
    keys = {
      {
        '<leader><space>',
        function()
          Snacks.picker.files { hidden = true, ignored = true, exclude = { '**/node_modules/*', '**/dist/*' } }
        end,
        desc = 'Find Files',
      },
      {
        '<leader>sb',
        function()
          Snacks.picker.buffers { sort_lastused = true, current = false }
        end,
        desc = 'Search Buffers',
      },
      {
        '<leader>,',
        function()
          Snacks.picker.buffers { sort_lastused = true, current = false }
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
          Snacks.picker.grep { layout = 'vertical' }
        end,
        desc = 'Search Grep',
      },
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = 'Search Registers',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'Search Document Symbols',
      },
      {
        '<leader>lg',
        function()
          Snacks.lazygit()
        end,
        desc = '[L]azy[G]it',
      },
      {
        '<leader>gs',
        function()
          Snacks.lazygit.open {
            args = { 'status' },
          }
        end,
        desc = 'Git Status',
      },
      {
        '<leader>gb',
        function()
          Snacks.lazygit.open {
            args = { 'branch' },
          }
        end,
        desc = 'Git Branches',
      },
      {
        '<leader>gl',
        function()
          Snacks.lazygit.open {
            args = { 'log' },
          }
        end,
        desc = 'Git Log',
      },
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics_buffer { preview = true }
        end,
        desc = 'Search Diagnostics',
      },
    },
  },
}
