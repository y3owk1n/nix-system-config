return {
  "nvim-lualine/lualine.nvim",
  event = "ColorScheme",
  opts = function(_, opts)
    opts.options.component_separators = { left = "", right = "" }
    opts.options.section_separators = { left = "", right = "" }

    opts.sections.lualine_z = {}

    table.insert(opts.sections.lualine_x, 2, 'vim.fn["codeium#GetStatusString"]()')

    opts.extensions = { "quickfix", "trouble" }
  end,
}
