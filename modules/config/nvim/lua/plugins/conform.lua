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
      prettier = {
        ---@diagnostic disable-next-line: unused-local
        condition = function(self, ctx)
          local prettier_configs = {
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            "prettier.config.js",
            ".prettierrc.mjs",
            "prettier.config.mjs",
            ".prettierrc.cjs",
            "prettier.config.cjs",
            ".prettierrc.toml",
          }

          return find_root(ctx, prettier_configs)
        end,
      },
    },
    formatters_by_ft = {
      javascript = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      json = { "biome", "prettier", stop_after_first = true },
      jsonc = { "biome", "prettier", stop_after_first = true },
    },
  },
}
