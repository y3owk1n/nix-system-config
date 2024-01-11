return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "beautysh",
        "biome",
        "bash-language-server",
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint_d",
        "html-lsp",
        "json-lsp",
        "jsonlint",
        "lua-language-server",
        "mdx-analyzer",
        "markdownlint",
        "marksman",
        "prettier",
        "prisma-language-server",
        "nil",
        "stylua",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        "yamllint",
        "luacheck",
        "shellcheck",
        "yamlfmt",
        "shfmt",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    setup = {},
    opts = {
      servers = {
        cssls = {},
        biome = {},
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          -- Use this to add any additional keymaps
          -- for specific lsp servers
          ---@type LazyKeysSpec[]
          -- keys = {},
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                  "vim",
                  "require",
                },
              },
              workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        prismals = {},
        nil_ls = {},
        bashls = {},
        docker_compose_language_service = {},
        dockerls = {},
        mdx_analyzer = {},
      },
    },
  },
}
