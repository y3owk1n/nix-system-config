local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- color scheme
config.color_scheme = "Catppuccin Macchiato"

-- font
config.font = wezterm.font("GeistMono NF", { weight = "Bold" })
config.font_size = 14

-- UI
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"

-- fps
config.max_fps = 240
config.animation_fps = 240

-- unused features
config.mouse_wheel_scrolls_tabs = false

-- reset key bindings
config.disable_default_key_bindings = true
config.disable_default_quick_select_patterns = false

-- key bindings
config.keys = {
	{
		key = "q",
		mods = "CMD",
		action = wezterm.action.QuitApplication,
	},
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
}

-- others
config.quit_when_all_windows_are_closed = true
config.skip_close_confirmation_for_processes_named = {
	"bash",
	"sh",
	"zsh",
	"fish",
	"tmux",
	"zellij",
}
config.window_close_confirmation = "NeverPrompt"

return config
