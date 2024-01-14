return {
  "nvim-lualine/lualine.nvim",
  event = "ColorScheme",
  opts = function(_, opts)
    opts.sections.lualine_z = {}

    table.insert(opts.sections.lualine_x, 2, 'vim.fn["codeium#GetStatusString"]()')
  end,
}
