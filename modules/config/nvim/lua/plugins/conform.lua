local find_root = require("utils.file").find_root

return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      biome = {
        ---@diagnostic disable-next-line: unused-local
        condition = function(self, ctx)
          return find_root(ctx, { "biome.json" })
        end,
      },
    },
    formatters_by_ft = {
      javascript = { { "biome", "prettier" } },
      javascriptreact = { { "biome", "prettier" } },
      typescript = { { "biome", "prettier" } },
      typescriptreact = { { "biome", "prettier" } },
      json = { { "biome", "prettier" } },
      jsonc = { { "biome", "prettier" } },
    },
  },
}
