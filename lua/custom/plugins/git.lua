local function toggle_diffview(cmd)
  if next(require('diffview.lib').views) == nil then
    vim.cmd(cmd)
  else
    vim.cmd 'DiffviewClose'
  end
end

return {
  {
    'sindrets/diffview.nvim',
    keys = {
      {
        '<leader>gd',
        function()
          toggle_diffview 'DiffviewOpen'
        end,
        desc = 'Toggle Diffview window',
      },
      {
        '<leader>gf',
        function()
          toggle_diffview 'DiffviewFileHistory %'
        end,
        desc = 'Toggle Diffview for current file',
      },
    },
    opts = {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    },
    config = {
      keymaps = {
        view = {
          ['q'] = '<CMD>DiffviewClose<CR>',
        },
        file_panel = {
          ['q'] = '<CMD>DiffviewClose<CR>',
        },
        file_history_panel = {
          ['q'] = '<CMD>DiffviewClose<CR>',
        },
      },
    },
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },
  {
    "tpope/vim-fugitive",
    event = "BufWinEnter"
  }
}
