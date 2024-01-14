return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function(_, opts)
    local logo = [[
        ██╗  ██╗██╗   ██╗██╗     ███████╗    ██╗    ██╗ ██████╗ ███╗   ██╗ ██████╗ 
        ██║ ██╔╝╚██╗ ██╔╝██║     ██╔════╝    ██║    ██║██╔═══██╗████╗  ██║██╔════╝ 
        █████╔╝  ╚████╔╝ ██║     █████╗      ██║ █╗ ██║██║   ██║██╔██╗ ██║██║  ███╗
        ██╔═██╗   ╚██╔╝  ██║     ██╔══╝      ██║███╗██║██║   ██║██║╚██╗██║██║   ██║
        ██║  ██╗   ██║   ███████╗███████╗    ╚███╔███╔╝╚██████╔╝██║ ╚████║╚██████╔╝
        ╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ 
      ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")
    opts.config.center = {
      {
        action = "Lazy",
        desc = " Lazy",
        icon = "󰒲 ",
        key = "l",
      },
      {
        action = "LazyExtras",
        desc = " Lazy Extras",
        icon = " ",
        key = "x",
      },
      {
        action = "qa",
        desc = " Quit",
        icon = " ",
        key = "q",
      },
    }
  end,
}
