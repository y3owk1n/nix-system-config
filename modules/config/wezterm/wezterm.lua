-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("GeistMono NF", { weight = "Bold" })
config.font_size = 14
config.max_fps = 240
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"
config.disable_default_key_bindings = true

config.keys = {
	{
		key = "q",
		mods = "CMD",
		action = wezterm.action.QuitApplication,
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
}

config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"fish",
	"tmux",
	"zellij",
}

config.window_close_confirmation = "NeverPrompt"

-- and finally, return the configuration to wezterm
return config
