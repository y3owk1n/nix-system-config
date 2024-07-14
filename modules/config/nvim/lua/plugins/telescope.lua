return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")
    local open_with_trouble = require("trouble.sources.telescope").open

    -- Use this to add more results without clearing the trouble list
    local add_to_trouble = require("trouble.sources.telescope").add

    return {
      defaults = {
        path_display = { "truncate " },
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,

        mappings = {
          i = {
            -- do not allow any actions during insert mode
            -- mappings from https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
            ["<LeftMouse>"] = actions.nop,
            ["<2-LeftMouse>"] = actions.nop,

            ["<C-n>"] = actions.nop,
            ["<C-p>"] = actions.nop,

            ["<C-c>"] = actions.nop,

            ["<Down>"] = actions.nop,
            ["<Up>"] = actions.nop,

            -- ["<CR>"] = actions.nop,
            ["<C-x>"] = actions.nop,
            ["<C-v>"] = actions.nop,
            ["<C-t>"] = actions.nop,

            ["<C-u>"] = actions.nop,
            ["<C-d>"] = actions.nop,
            ["<C-f>"] = actions.nop,
            ["<C-k>"] = actions.nop,

            ["<PageUp>"] = actions.nop,
            ["<PageDown>"] = actions.nop,
            ["<M-f>"] = actions.nop,
            ["<M-k>"] = actions.nop,

            ["<Tab>"] = actions.nop,
            ["<S-Tab>"] = actions.nop,
            ["<C-q>"] = actions.nop,
            ["<M-q>"] = actions.nop,
            ["<C-l>"] = actions.nop,
            ["<C-/>"] = actions.nop,
            ["<C-_>"] = actions.nop,
            ["<C-w>"] = actions.nop,
            ["<C-r><C-w>"] = actions.nop,
            ["<C-j>"] = actions.nop,
          },
          n = {
            ["<c-a>"] = open_with_trouble,
            ["<c-A>"] = add_to_trouble,
            ["q"] = actions.close,
            ["-"] = actions.select_horizontal,
            ["\\"] = actions.select_vertical,
          },
        },
      },
      pickers = {
        diagnostics = {
          theme = "dropdown",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      },
    }
  end,
}
