return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      linters_by_ft = {
        sh = { "shellcheck" },
        lua = { "luacheck" },
        javascript = { "biomejs", "eslint" },
        javascriptreact = { "biomejs", "eslint" },
        typescript = { "biomejs", "eslint" },
        typescriptreact = { "biomejs", "eslint" },
        json = { "biomejs", "eslint" },
        jsonc = { "biomejs", "eslint" },
        yaml = { "yamllint" },
        nix = { "nix" },
        markdown = { "markdownlint" },
        zsh = { "zsh" },
      },
    },
  },
}
