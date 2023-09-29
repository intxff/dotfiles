local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local theme = require("themes")
local config = require("config")
local lain = require("lain")
local utils = require("modules.utils")
local markup = lain.util.markup

local device = config.topbar.brightness.device or "@DEFAULT_SINK@"
local max = utils.popen_and_return("brightnessctl -d " .. device .. " m")
local step = config.topbar.brightness.step
local icon = markup.font(theme.brightness.font_icon, theme.brightness.icon)

local brightness = wibox.widget({
	{
		markup = icon,
		widget = wibox.widget.textbox,
	},
	{
		forced_width = 5,
		color = theme.brightness.bg,
		widget = wibox.widget.separator,
	},
	{
		{
			widget = wibox.widget.textbox,
		},
		bottom = theme.brightness.margin_to_align_icon_and_text,
		widget = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal,
})

function brightness:inc(s)
	local cur = utils.popen_and_return("brightnessctl -d " .. device .. " g")
	cur = cur + s
	awful.spawn("brightnessctl -d " .. device .. " s " .. cur, false)
	brightness:update_graphic()
end

function brightness:dec(s)
	local cur = utils.popen_and_return("brightnessctl -d " .. device .. " g")
	cur = cur - s
	awful.spawn("brightnessctl -d " .. device .. " s " .. cur, false)
	brightness:update_graphic()
end

function brightness:update_graphic()
	local cur = utils.popen_and_return("brightnessctl -d " .. device .. " g")
	local per = string.format("%.1f", cur / max * 100)
	brightness.third.widget.markup = markup.font(theme.brightness.font_text, per .. "%")
end

brightness:buttons({
	gears.table.join(
		awful.button({}, 4, function()
			brightness:inc(step)
		end),
		awful.button({}, 5, function()
			brightness:dec(step)
		end)
	),
})

gears.timer({
	timeout = config.topbar.brightness.refresh,
	call_now = true,
	autostart = true,
	callback = function()
		brightness:update_graphic()
	end,
})

return brightness
