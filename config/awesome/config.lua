local awful = require("awful")
local config = {}
config.theme = "everforest"
config.topbar = {
	battery = {
		battery = "BAT0",
	},
	volume = {
		refresh = 10,
		step = 5,
	},
	brightness = {
		device = "amdgpu_bl1",
		refresh = 10,
		step = 5,
	},
}

-- keymap
-- Name         Description
-- Mod1         Usually called Alt on PCs and Option on Macs
-- Mod4         Also called Super, Windows and Command ⌘
-- Mod5         Also called AltGr or ISO Level 3
-- Shift        Both left and right shift keys
-- Control      Also called CTRL on some keyboards
local modkey = "Mod4"
config.keymaps = {
	globalkeys = {
		show_hotkeys = {
			mod = { modkey },
			key = "s",
			press = function()
				require("awful.hotkeys_popup").show_help()
			end,
			description = "show help",
			group = "awesome",
		},
		awesome_quit = {
			mod = { modkey, "Control" },
			key = "q",
			press = awesome.quit,
			description = "restart awesome",
			group = "awesome",
		},
		awesome_restart = {
			mod = { modkey, "Control" },
			key = "r",
			press = awesome.restart,
			description = "restart awesome",
			group = "awesome",
		},
		volumn_toggle_mute = {
			mod = {},
			key = "XF86AudioMute",
			press = function()
				awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
			end,
			description = "toggle mute",
			group = "system",
		},
		volumn_toggle_mic_mute = {
			mod = {},
			key = "XF86AudioMicMute",
			press = function()
				awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
			end,
			description = "toggle mic mute",
			group = "system",
		},
		volumn_increase = {
			mod = {},
			key = "XF86AudioRaiseVolume",
			press = function()
				awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
			end,
			description = "increase volumn",
			group = "system",
		},
		volumn_decrease = {
			mod = {},
			key = "XF86AudioLowerVolume",
			press = function()
				awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
			end,
			description = "decrease volumn",
			group = "system",
		},
		brightness_increase = {
			mod = {},
			key = "XF86MonBrightnessUp",
			press = function()
				awful.spawn("brightnessctl -d amdgpu_bl0 s +8%")
			end,
			description = "increase brightness",
			group = "system",
		},
		brightness_decrease = {
			mod = {},
			key = "XF86MonBrightnessDown",
			press = function()
				awful.spawn("brightnessctl -d amdgpu_bl0 s 8%-")
			end,
			description = "decrease brightness",
			group = "system",
		},
		screen_focus_next = {
			mod = { modkey, "Control" },
			key = "j",
			press = function()
				awful.screen.focus_relative(1)
			end,
			description = "focus the next screen",
			group = "screen",
		},
		screen_focus_prev = {
			mod = { modkey, "Control" },
			key = "k",
			press = function()
				awful.screen.focus_relative(-1)
			end,
			description = "focus the previous screen",
			group = "screen",
		},
		select_on_numpad = {
			mod = { modkey },
			keygroup = "numpad",
			description = "select layout directly",
			group = "layout",
			press = function(index)
				local t = awful.screen.focused().selected_tag
				if t then
					t.layout = t.layouts[index] or t.layout
				end
			end,
		},
		increase_master_width = {
			mod = { modkey },
			key = "l",
			press = function()
				awful.tag.incmwfact(0.05)
			end,
			description = "increase master width factor",
			group = "layout",
		},
		decrease_master_width = {
			mod = { modkey },
			key = "h",
			press = function()
				awful.tag.incmwfact(-0.05)
			end,
			description = "decrease master width factor",
			group = "layout",
		},
		increase_numbe_of_master = {
			mod = { modkey, "Shift" },
			key = "h",
			press = function()
				awful.tag.incnmaster(1, nil, true)
			end,
			description = "increase the number of master clients",
			group = "layout",
		},
		decrease_numbe_of_master = {
			mod = { modkey, "Shift" },
			key = "l",
			press = function()
				awful.tag.incnmaster(-1, nil, true)
			end,
			description = "decrease the number of master clients",
			group = "layout",
		},
		increase_number_of_columns = {
			mod = { modkey, "Control" },
			key = "h",
			press = function()
				awful.tag.incncol(1, nil, true)
			end,
			description = "increase the number of columns",
			group = "layout",
		},
		decrease_number_of_columns = {
			mod = { modkey, "Control" },
			key = "l",
			press = function()
				awful.tag.incncol(-1, nil, true)
			end,
			description = "decrease the number of columns",
			group = "layout",
		},
		select_next = {
			mod = { modkey },
			key = "space",
			press = function()
				awful.layout.inc(1)
			end,
			description = "select next",
			group = "layout",
		},
		select_prev = {
			mod = { modkey, "Shift" },
			key = "space",
			press = function()
				awful.layout.inc(-1)
			end,
			description = "select previous",
			group = "layout",
		},
		view_previous = {
			mod = { modkey },
			key = "Left",
			press = awful.tag.viewprev,
			description = "view previous",
			group = "tag",
		},
		view_next = {
			mod = { modkey },
			key = "Right",
			press = awful.tag.viewnext,
			description = "view next",
			group = "tag",
		},
		go_back_tag = {
			mod = { modkey },
			key = "Escape",
			press = awful.tag.history.restore,
			description = "go back",
			group = "tag",
		},
		view_by_numrow = {
			mod = { modkey },
			keygroup = "numrow",
			description = "only view tag",
			group = "tag",
			press = function(index)
				local screen = awful.screen.focused()
				if index == 0 then
					index = 10
				end
				local tag = screen.tags[index]
				if tag then
					tag:view_only()
				end
			end,
		},
		toggle = {
			mod = { modkey, "Control" },
			keygroup = "numrow",
			description = "toggle tag",
			group = "tag",
			press = function(index)
				local screen = awful.screen.focused()
				if index == 0 then
					index = 10
				end
				local tag = screen.tags[index]
				if tag then
					awful.tag.viewtoggle(tag)
				end
			end,
		},
		move_client = {
			mod = { modkey, "Shift" },
			keygroup = "numrow",
			description = "move focused client to tag",
			group = "tag",
			press = function(index)
				if client.focus then
					if index == 0 then
						index = 10
					end
					local tag = client.focus.screen.tags[index]
					if tag then
						client.focus:move_to_tag(tag)
					end
				end
			end,
		},
		focus_next = {
			mod = { modkey },
			key = "j",
			press = function()
				awful.client.focus.byidx(1)
			end,
			description = "focus next by index",
			group = "client",
		},
		focus_prev = {
			mod = { modkey },
			key = "k",
			press = function()
				awful.client.focus.byidx(-1)
			end,
			description = "focus previous by index",
			group = "client",
		},
		go_back_client = {
			mod = { modkey },
			key = "Tab",
			press = function()
				awful.client.focus.history.previous()
				if client.focus then
					client.focus:raise()
				end
			end,
			description = "go back",
			group = "client",
		},
		restore_minimized = {
			mod = { modkey, "Control" },
			key = "n",
			press = function()
				local c = awful.client.restore()
				-- Focus restored client
				if c then
					c:activate({ raise = true, context = "key.unminimize" })
				end
			end,
			description = "restore minimized",
			group = "client",
		},
		swap_with_next_client = {
			mod = { modkey, "Shift" },
			key = "j",
			press = function()
				awful.client.swap.byidx(1)
			end,
			description = "swap with next client by index",
			group = "client",
		},
		swap_with_previous_client = {
			mod = { modkey, "Shift" },
			key = "k",
			press = function()
				awful.client.swap.byidx(-1)
			end,
			description = "swap with previous client by index",
			group = "client",
		},
		jump_to_urgent = {
			mod = { modkey },
			key = "u",
			awful.client.urgent.jumpto,
			description = "jump to urgent client",
			group = "client",
		},
		powermenu = {
			mod = { modkey },
			key = "q",
			press = function()
				require("modules.powermenu").bar()
			end,
			description = "open powermenu",
			group = "launcher",
		},
		terminal = {
			mod = { modkey },
			key = "Return",
			press = function()
				awful.spawn(config.app.terminal.cmd)
			end,
			description = "open a terminal",
			group = "launcher",
		},
		flameshot = {
			mod = { modkey, "Shift" },
			key = "p",
			press = function()
				awful.spawn(config.app.flameshot.cmd)
			end,
			description = "Rofi",
			group = "Launcher",
		},
		rofi = {
			mod = { modkey },
			key = "d",
			press = function()
				awful.spawn(config.app.rofi.cmd)
			end,
			description = "Rofi",
			group = "Launcher",
		},
	},
	clientkeys = {
		fullscreen = {
			mod = { modkey },
			key = "f",
			press = function(c)
				c.fullscreen = not c.fullscreen
				c:raise()
			end,
			description = "toggle fullscreen",
			group = "client",
		},
		close = {
			mod = { modkey },
			key = "c",
			press = function(c)
				c:kill()
			end,
			description = "close",
			group = "client",
		},
		toggle_floating = {
			mod = { modkey, "Control" },
			key = "space",
			press = awful.client.floating.toggle,
			description = "toggle floating",
			group = "client",
		},
		move_to_master = {
			mod = { modkey, "Control" },
			key = "Return",
			press = function(c)
				c:swap(awful.client.getmaster())
			end,
			description = "move to master",
			group = "client",
		},
		move_to_screen = {
			mod = { modkey },
			key = "o",
			press = function(c)
				c:move_to_screen()
			end,
			description = "move to screen",
			group = "client",
		},
		toggle_keep_on_top = {
			mod = { modkey },
			key = "t",
			press = function(c)
				c.ontop = not c.ontop
			end,
			description = "toggle keep on top",
			group = "client",
		},
		minimize = {
			mod = { modkey },
			key = "n",
			press = function(c)
				-- The client currently has the input focus, so it cannot be
				-- minimized, since minimized clients can't have the focus.
				c.minimized = true
			end,
			description = "minimize",
			group = "client",
		},
		maxmize = {
			mod = { modkey },
			key = "m",
			press = function(c)
				c.maximized = not c.maximized
				c:raise()
			end,
			description = "(un)maximize",
			group = "client",
		},
		unmaximize_vertically = {
			mod = { modkey, "Control" },
			key = "m",
			press = function(c)
				c.maximized_vertical = not c.maximized_vertical
				c:raise()
			end,
			description = "(un)maximize vertically",
			group = "client",
		},
		unmaximize_horizontally = {
			mod = { modkey, "Shift" },
			key = "m",
			press = function(c)
				c.maximized_horizontal = not c.maximized_horizontal
				c:raise()
			end,
			description = "(un)maximize horizontally",
			group = "client",
		},
	},
}

-- mousemap
config.mousemap = {
	client_mouse = {
		mouse_click = {
			mod = {},
			button = 1,
			press = function(c)
				c:activate({ context = "mouse_click" })
			end,
		},
		mouse_move = {
			mod = { modkey },
			button = 1,
			press = function(c)
				c:activate({ context = "mouse_click", action = "mouse_move" })
			end,
		},
		mouse_resize = {
			mod = { modkey },
			button = 3,
			press = function(c)
				c:activate({ context = "mouse_click", action = "mouse_resize" })
			end,
		},
	},
	taglist_mouse = {
		view_only = {
			mod = {},
			button = 1,
			press = function(t)
				t:view_only()
			end,
		},
		move_to_tag = {
			mod = { modkey },
			button = 1,
			press = function(t)
				if client.focus then
					client.focus:move_to_tag(t)
				end
			end,
		},
		viewtoggle = {
			mod = {},
			button = 3,
			press = awful.tag.viewtoggle,
		},
		toogle_tag = {
			mod = { modkey },
			button = 3,
			press = function(t)
				if client.focus then
					client.focus:toggle_tag(t)
				end
			end,
		},
		viewnext = {
			mod = {},
			button = 4,
			press = function(t)
				awful.tag.viewprev(t.screen)
			end,
		},
		viewprev = {
			mod = {},
			button = 5,
			press = function(t)
				awful.tag.viewnext(t.screen)
			end,
		},
	},
}

config.rules = {
	--{
	--     id = {},
	--     properties = {},
	--     callbacks = {},
	--     rule = {},
	--     rule_any = {},
	--     except = {},
	--     except_any = {},
	--     rule_every = {},
	--     rule_lesser = {},
	--     rule_greater = {},
	-- },
	-- All clients will match this rule.
	global = {
		properties = {
			focus = awful.client.focus.filter,
			raise = true,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			titlebars_enabled = true,
			shape = function(cr, width, height)
				require("gears.shape").rounded_rect(cr, width, height, 10)
			end,
		},
		rule = {},
	},
	borderless = {
		properties = {
			border_width = 0,
		},
		rule_any = {
			class = { "lx-music-desktop", "lx-music-desktop" },
			instance = { "lx-music-desktop", "lx-music-desktop" },
		},
	},
	fullscreen = {
		properties = {
			shape = require("gears.shape").rectangle,
		},
		rule_any = {
			fullscreen = true,
		},
	},
	autohide = {
		properties = {
			minimized = true,
		},
		rule_any = {
			name = { "GoldenDict" },
			class = { "goldendict", "GoldenDict" },
			instance = { "goldendict", "GoldenDict" },
		},
	},
}

config.app = {
	terminal = {
		autostart = false,
		cmd = "kitty",
	},
	rofi = {
		autostart = false,
		cmd = "rofi -show drun",
	},
	editor = {
		autostart = false,
		cmd = "nvim",
	},
	network = {
		autostart = true,
		cmd = "nm-applet",
	},
	picom = {
		autostart = true,
		with_shell = true,
		cmd = "picom --config ~/.config/picom/picom.conf",
	},
	fcitx5 = {
		autostart = true,
		cmd = "fcitx5",
	},
	goldendict = {
		autostart = true,
		cmd = "goldendict",
	},
	flameshot = {
		autostart = false,
		cmd = "flameshot gui",
	},
	redshift = {
		autostart = false,
		cmd = "redshift",
	},
	anki = {
		autostart = false,
		cmd = "anki",
	},
}

config.wallpaper = {
	-- mode: dir or file
	mode = "file",
	-- absolute path
	dir = "/home/icarus/.config/awesome/wallpaper/",
	file = "/home/icarus/.config/awesome/wallpaper/background.png",
}

return config
