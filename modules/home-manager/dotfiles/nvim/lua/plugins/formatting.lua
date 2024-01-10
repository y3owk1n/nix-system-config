return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "beautysh" },
        javascript = { { "biome", "prettier" } },
        javascriptreact = { { "biome", "prettier" } },
        typescript = { { "biome", "prettier" } },
        typescriptreact = { { "biome", "prettier" } },
        json = { { "biome", "prettier" } },
        jsonc = { { "biome", "prettier" } },
        markdown = { "markdownlint" },
        ["markdown.mdx"] = { "markdownlint" },
        nix = { "nixfmt" },
        prisma = { "prismaFmt" },
      },
    },
  },
}
