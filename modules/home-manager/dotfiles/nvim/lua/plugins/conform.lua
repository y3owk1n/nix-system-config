return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      biome = {
        condition = function(self, ctx)
          return vim.fs.find({ "biome.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
      lua = { "stylua" },
      sh = { "beautysh" },
      fish = { "fish_indent" },
      javascript = { { "biome", "prettierd" } },
      javascriptreact = { { "biome", "prettierd" } },
      typescript = { { "biome", "prettierd" } },
      typescriptreact = { { "biome", "prettierd" } },
      json = { { "biome", "prettierd" } },
      jsonc = { { "biome", "prettierd" } },
      markdown = { "markdownlint" },
      ["markdown.mdx"] = { "markdownlint" },
      nix = { "nixfmt" },
      ["*"] = { "codespell" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
