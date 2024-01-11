return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      linters_by_ft = {
        sh = { "shellcheck" },
        lua = { "luacheck" },
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
        json = { "eslint" },
        jsonc = { "eslint" },
        yaml = { "yamllint" },
        nix = { "nix" },
        markdown = { "markdownlint" },
        zsh = { "zsh" },
      },
    },
  },
}
