return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      background_colour = "#181825",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    opts = function(_, opts)
      opts.sections.lualine_z = {}

      table.insert(opts.sections.lualine_x, 2, 'vim.fn["codeium#GetStatusString"]()')
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      local focused = true

      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })

      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
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
    end,
  },
}
