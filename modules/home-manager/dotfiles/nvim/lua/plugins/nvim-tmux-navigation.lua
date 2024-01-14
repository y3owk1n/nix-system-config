return {
  "alexghergh/nvim-tmux-navigation",
  keys = {
    { "<C-l>", "<Cmd>NvimTmuxNavigateRight<cr>", desc = "Tmux Navigate Right" },
    { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<cr>", desc = "Tmux Navigate Left" },
    { "<C-j>", "<Cmd>NvimTmuxNavigateDown<cr>", desc = "Tmux Navigate Down" },
    { "<C-k>", "<Cmd>NvimTmuxNavigateUp<cr>", desc = "Tmux Navigate Up" },
  },
  config = function(_, opts)
    require("nvim-tmux-navigation").setup(opts)
  end,
  opts = {},
}
