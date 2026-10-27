local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 15.0
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

config.keys = {
	{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "LeftArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	{ key = "z", mods = "CMD", action = wezterm.action.TogglePaneZoomState },
}

return config