return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.markdownlint,
          nls.builtins.formatting.yamlfmt,
          nls.builtins.formatting.nixfmt,
          nls.builtins.formatting.nixpkgs_fmt,
          nls.builtins.formatting.prismaFmt,
          nls.builtins.formatting.beautysh.with({
            extra_args = { "-i=4" },
          }),
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.biome,
          nls.builtins.diagnostics.jsonlint,
          nls.builtins.diagnostics.yamllint,
          nls.builtins.diagnostics.luacheck,
          nls.builtins.diagnostics.markdownlint,
          nls.builtins.diagnostics.zsh,
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "biome" },
        ["javascriptreact"] = { "biome" },
        ["typescript"] = { "biome" },
        ["typescriptreact"] = { "biome" },
        ["vue"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "biome" },
        ["jsonc"] = { "biome" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },
    },
  },
}
