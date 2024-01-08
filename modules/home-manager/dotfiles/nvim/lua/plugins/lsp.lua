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
        "eslint-lsp",
        "eslint_d",
        "html-lsp",
        "json-lsp",
        "jsonlint",
        "lua-language-server",
        "mdx-analyzer",
        "markdownlint",
        "marksman",
        "prettierd",
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
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      servers = {
        cssls = {},
        biome = {},
        html = {},
        lua_ls = {
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
