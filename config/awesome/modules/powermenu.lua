local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local theme = require("themes")

local focused_screen = awful.screen.focused()

local selected
local menulist = {}
local selcted_entry

-- entries
local function highlight_entry(w)
	if menulist[selected].widget == w then
		return
	end
	for k, v in pairs(menulist) do
		if v.widget == w then
			menulist[selected].widget.bg = theme.powermenu.menu.bg.unselected
			selected = k
		end
	end
	w.bg = theme.powermenu.menu.bg.selected
end
local function entry(symbol, func)
	local size = focused_screen.geometry.height * 0.12
	local t = wibox.widget({
		{
			markup = symbol,
			font = theme.powermenu.menu.font,
			align = "center",
			valign = "center",
			widget = wibox.widget.textbox,
		},
		bg = theme.powermenu.menu.bg.unselected,
		forced_height = size,
		forced_width = size,
		shape = gears.shape.rounded_rect,
		opacity = 1,
		widget = wibox.container.background,
	})
	t:connect_signal("mouse::enter", highlight_entry)
	t:connect_signal("button::press", function(self, lx, ly, button, mods, metadata)
		if button == 1 then
			func()
		end
	end)
	local r = {
		widget = t,
		func = func,
	}
	return r
end

-- power manager
local powermenu = {}

-- bar applet
powermenu.applet = wibox.widget({
	markup = "",
	font = theme.powermenu.font,
	align = "center",
	valign = "center",
	widget = wibox.widget.textbox,
})

-- init menulist
local poweroff = entry("󰤆", function()
	awful.spawn("systemctl poweroff")
end)
local hibernate = entry("󰤄", function()
	awful.spawn("systemctl hibernate")
end)
local logout = entry("󰍃", function()
	awesome.quit()
end)
local reboot = entry("󰑓", function()
	awful.spawn("systemctl reboot")
end)
local sleep = entry("󰒲", function()
	awful.spawn("systemctl suspend")
end)
local lockscreen = entry("󱅞", function()
	require("naughty").notify({ text = "2314" })
	-- awful.spawn("systemctl sleep")
end)
menulist = { poweroff, hibernate, sleep, logout, reboot, lockscreen }
selected = 1

local menu = wibox({
	widget = {
		{
			menulist[1].widget,
			menulist[2].widget,
			menulist[3].widget,
			menulist[4].widget,
			menulist[5].widget,
			menulist[6].widget,
			forced_num_cols = #menulist,
			forced_num_rows = 1,
			homogeneous = true,
			expand = true,
			horizontal_spacing = focused_screen.geometry.height * 0.05,
			layout = wibox.layout.grid,
		},
		forced_height = focused_screen.geometry.height * 0.15,
		forced_width = focused_screen.geometry.width * 0.5,
		widget = wibox.container.place,
	},
	bg = theme.powermenu.menu.bg.mask,
	height = focused_screen.geometry.height,
	width = focused_screen.geometry.width,
	screen = focused_screen,
	ontop = true,
	type = "dock",
	visible = false,
})

local grabber
menu:buttons(gears.table.join(awful.button({}, 1, function()
	menu.visible = false
	menulist[selected].widget.bg = theme.powermenu.menu.bg.unselected
	selected = 1
	awful.keygrabber.stop(grabber)
end)))

powermenu.bar = function()
	local pre
	selected = 1
	selcted_entry = menulist[selected].widget
	selcted_entry.bg = theme.powermenu.menu.bg.selected
	menu.visible = true
	grabber = awful.keygrabber.run(function(mod, key, event)
		if key == "Escape" then
			menu.visible = false
			menulist[selected].widget.bg = theme.powermenu.menu.bg.unselected
			selected = 1
			awful.keygrabber.stop(grabber)
		end
		if event == "press" then
			if key == "Left" or key == "k" then
				pre = menulist[selected].widget
				selected = selected - 1
				if selected == 0 then
					selected = #menulist
				end
				pre.bg = theme.powermenu.menu.bg.unselected
				menulist[selected].widget.bg = theme.powermenu.menu.bg.selected
			end
			if key == "Right" or key == "j" then
				pre = menulist[selected].widget
				selected = selected + 1
				if selected == #menulist + 1 then
					selected = 1
				end
				pre.bg = theme.powermenu.menu.bg.unselected
				menulist[selected].widget.bg = theme.powermenu.menu.bg.selected
			end
			if key == "Return" then
				menu.visible = false
				menulist[selected].widget.bg = theme.powermenu.menu.bg.unselected
				awful.keygrabber.stop(grabber)
				menulist[selected].func()
			end
		end
	end)
end

powermenu.applet:buttons(gears.table.join(awful.button({}, 1, powermenu.bar)))

return powermenu
