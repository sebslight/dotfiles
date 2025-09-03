local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

--[[ Font ]]
config.font_size = 13
config.line_height = 1.2
local font_name = "TX-02"
config.font = wezterm.font(font_name, { weight = "Medium" })

--[[ Appearance ]]
config.color_scheme = "tokyonight_night"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 40
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
config.use_fancy_tab_bar = true
config.tab_max_width = 32
config.max_fps = 120
config.prefer_egl = true
config.colors = {
	tab_bar = {
		active_tab = {
			-- I use a solarized dark theme; this gives a teal background to the active tab
			fg_color = "#073642",
			bg_color = "#2aa198",
		},
	},
}
wezterm.on("update-status", function(window)
	-- Grab the utf8 character for the "powerline" left facing
	-- solid arrow.
	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

	-- Grab the current window's configuration, and from it the
	-- palette (this is the combination of your chosen colour scheme
	-- including any overrides).
	local color_scheme = window:effective_config().resolved_palette
	local bg = color_scheme.background
	local fg = color_scheme.foreground

	window:set_right_status(wezterm.format({
		-- First, we draw the arrow...
		{ Background = { Color = "none" } },
		{ Foreground = { Color = bg } },
		{ Text = SOLID_LEFT_ARROW },
		-- Then we draw our text
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = " " .. wezterm.hostname() .. " " },
	}))
end)

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
return config
