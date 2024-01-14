return {
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
}
