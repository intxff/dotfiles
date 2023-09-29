local awful = require("awful")
local config = require("config")
local naughty = require("naughty")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- beautiful init theme
local theme = require("themes")
local beautiful = require("beautiful")
beautiful.init(theme)

local function parse_keymap(t, key)
	table.insert(
		t,
		awful.key({
			modifiers = key.mod,
			key = key.key,
			keygroup = key.keygroup,
			on_press = key.press,
			on_release = key.release,
			description = key.description,
			group = key.group,
		})
	)
end
local function parse_mousemap(t, button)
	table.insert(t, awful.button(button.mod, button.button, button.press))
end

-- bind global keys
local globalkeys = {}
for _, value in pairs(config.keymaps.globalkeys) do
	parse_keymap(globalkeys, value)
end
awful.keyboard.append_global_keybindings(globalkeys)

-- autostart applications
local app = require("config").app
for _, v in pairs(app) do
	if v.autostart == true then
		if v.with_shell == true then
			awful.spawn.with_shell(v.cmd)
		end
		awful.spawn.once(v.cmd)
	end
end

-- rules
local ruled = require("ruled")
local rules = {}
for _, v in pairs(config.rules) do
	table.insert(rules, v)
end
ruled.client.connect_signal("request::rules", function()
	ruled.client.append_rules(rules)
end)

-- screen
local topbar = require("modules.topbar")
awful.screen.connect_for_each_screen(function(s)
	awful.tag({ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" }, s, awful.layout.layouts[2])
	topbar(s)
end)

-- wallpaper
require("modules.wallpaper")(config.wallpaper)
screen.connect_signal("property::geometry", function()
	require("modules.wallpaper")(config.wallpaper)
end)

-- client
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)
-- key and mouse
local clientkeys = {}
for _, value in pairs(config.keymaps.clientkeys) do
	parse_keymap(clientkeys, value)
end
local clientbuttons = {}
for _, value in pairs(config.mousemap.client_mouse) do
	parse_mousemap(clientbuttons, value)
end
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_client_mousebindings(clientbuttons)
end)
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings(clientkeys)
end)
