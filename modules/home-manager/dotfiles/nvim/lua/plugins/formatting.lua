return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "beautysh" },
        javascript = { { "biome", "prettierd" } },
        javascriptreact = { { "biome", "prettierd" } },
        typescript = { { "biome", "prettierd" } },
        typescriptreact = { { "biome", "prettierd" } },
        json = { { "biome", "prettierd" } },
        jsonc = { { "biome", "prettierd" } },
        css = { { "prettierd" } },
        html = { { "prettierd" } },
        vue = { { "prettierd" } },
        scss = { { "prettierd" } },
        less = { { "prettierd" } },
        graphql = { { "prettierd" } },
        yaml = { "yamlfmt" },
        markdown = { "markdownlint" },
        ["markdown.mdx"] = { "markdownlint" },
        nix = { "nixfmt" },
        prisma = { "prismaFmt" },
      },
    },
  },
}
