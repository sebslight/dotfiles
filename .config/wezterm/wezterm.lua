local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

--[[ Font ]]
config.font_size = 13
config.line_height = 1.1
local font_name = "TX02 Nerd Font Mono"
config.font = wezterm.font(font_name, { weight = "Medium" })

--[[ Appearance ]]
config.color_scheme = "tokyonight_night"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = "RESIZE"
-- Sets the font for the window frame (tab bar)
config.window_frame = {
	-- Berkeley Mono for me again, though an idea could be to try a
	-- serif font here instead of monospace for a nicer look?
	font = wezterm.font({ family = font_name, weight = "Bold" }),
	font_size = 11,
}

config.window_padding = {
	left = 3,
	right = 3,
	top = 0,
	bottom = 0,
}
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.max_fps = 120
config.prefer_egl = true

-- [[ Keymaps ]]
config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

config.keys = {
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.ShowTabNavigator,
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}
config.switch_to_last_active_tab_when_closing_tab = true

-- Plugins
-- https://github.com/adriankarlen/bar.wezterm
local tab_bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
tab_bar.apply_to_config(config, {
	position = "bottom",
	modules = {
		hostname = {
			enabled = false,
		},
	},
})

return config
