return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      linters_by_ft = {
        sh = { "shellcheck" },
        lua = { "luacheck" },
        javascript = { "biomejs", "eslint_d" },
        javascriptreact = { "biomejs", "eslint_d" },
        typescript = { "biomejs", "eslint_d" },
        typescriptreact = { "biomejs", "eslint_d" },
        json = { "biomejs", "eslint_d" },
        jsonc = { "biomejs", "eslint_d" },
        yaml = { "yamllint" },
        nix = { "nix" },
        markdown = { "markdownlint" },
        zsh = { "zsh" },
      },
    },
  },
}
