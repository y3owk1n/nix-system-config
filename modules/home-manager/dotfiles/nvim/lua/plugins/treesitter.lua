return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "vim",
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "yaml",
        "prisma",
        "regex",
        "gitignore",
        "graphql",
        "http",
        "sql",
        "svelte",
        "jsonc",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
