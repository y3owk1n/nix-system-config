return {
	{
		"gelguy/wilder.nvim",
		keys = {
			":",
			"/",
			"?",
		},
		config = function()
			local wilder = require("wilder")
			local macchiato =
				require("catppuccin.palettes").get_palette("macchiato")

			-- Create a highlight group for the popup menu
			local text_highlight = wilder.make_hl(
				"WilderText",
				{ { a = 1 }, { a = 1 }, { foreground = macchiato.text } }
			)
			local blue_highlight = wilder.make_hl(
				"WilderBlue",
				{ { a = 1 }, { a = 1 }, { foreground = macchiato.blue } }
			)

			-- Enable wilder when pressing :, / or ?
			wilder.setup({ modes = { ":", "/", "?" } })

			-- Enable fuzzy matching for commands and buffers
			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.cmdline_pipeline({
						fuzzy = 1,
					}),
					wilder.vim_search_pipeline({
						fuzzy = 1,
					})
				),
			})

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					highlighter = wilder.basic_highlighter(),
					highlights = {
						default = text_highlight,
						border = blue_highlight,
						accent = blue_highlight,
					},
					pumblend = 5,
					min_width = "100%",
					min_height = "25%",
					max_height = "25%",
					border = "rounded",
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				}))
			)
		end,
	},
}
