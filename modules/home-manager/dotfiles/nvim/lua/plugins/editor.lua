return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "current",
      },
    },
  },
  {
    "alexghergh/nvim-tmux-navigation",
    keys = {
      { "<C-l>", "<Cmd>:NvimTmuxNavigateRight<cr>", desc = "Tmux Navigate Right" },
      { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<cr>", desc = "Tmux Navigate Left" },
      { "<C-j>", "<Cmd>NvimTmuxNavigateDown<cr>", desc = "Tmux Navigate Down" },
      { "<C-k>", "<Cmd>NvimTmuxNavigateUp<cr>", desc = "Tmux Navigate Up" },
    },
    config = function(_, opts)
      require("nvim-tmux-navigation").setup(opts)
    end,
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local util = require("lazyvim.util")
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>,"] = "which_key_ignore",
        ["<leader><tab>"] = "which_key_ignore",
        ["<leader>b"] = "which_key_ignore",
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>gw"] = { name = "+git_worktree" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { name = "+window" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      }
      if util.has("noice.nvim") then
        keymaps["<leader>sn"] = { name = "+noice" }
      end
      wk.register(keymaps)
    end,
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fh",
        function()
          ---@type table
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      ---@type table
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ---@type string
              ["N"] = fb_actions.create,
              ---@type string
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for _ = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for _ = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("git_worktree")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    keys = function()
      local harpoon = require("harpoon")
      return {
        {
          "<leader>he",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Menu",
        },
        {
          "<leader>ha",
          function()
            harpoon:list():append()
          end,
          desc = "Add mark",
        },
      }
    end,
    config = function(_, opts)
      local harpoon = require("harpoon")
      harpoon:setup(opts)
    end,
  },
}
