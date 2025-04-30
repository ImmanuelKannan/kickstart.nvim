return {
  {
    'sindrets/diffview.nvim',
    opts = {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    },
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = true,
  },
}
