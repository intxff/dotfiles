local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local theme = require("themes")
local config = require("config")
local lain = require("lain")
local pactl = require("modules.pactl")
local markup = lain.util.markup

local device = config.topbar.volume.device or "@DEFAULT_SINK@"
local step = config.topbar.volume.step
local normal_icon = markup.font(theme.volume.font_icon, theme.volume.icon.normal)
local muted = markup.font(theme.volume.font_icon, theme.volume.icon.muted)

local volume = wibox.widget({
	{
		widget = wibox.widget.textbox,
	},
	{
		forced_width = 5,
		color = theme.cpu.bg,
		widget = wibox.widget.separator,
	},
	{
		{
			widget = wibox.widget.textbox,
		},
		bottom = theme.volume.margin_to_align_icon_and_text,
		widget = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal,
})

function volume:inc(s)
	pactl.volume_increase(device, s)
	volume:update_graphic()
end

function volume:dec(s)
	pactl.volume_decrease(device, s)
	volume:update_graphic()
end

function volume:toggle(d)
	pactl.mute_toggle(d)
	volume:update_graphic()
end

function volume:update_graphic()
	local vol = pactl.get_volume(device)
	if vol ~= nil and not pactl.get_mute(device) then
		volume.first.markup = normal_icon
		volume.third.widget.markup = markup.font(theme.volume.font_text, vol .. "%")
	else
		volume.first.markup = muted
		volume.third.widget.markup = markup.font(theme.volume.font_text, "0.0%")
	end
end

volume:buttons({
	gears.table.join(
		awful.button({}, 1, function()
			volume:toggle(device)
		end),
		awful.button({}, 4, function()
			volume:inc(step)
		end),
		awful.button({}, 5, function()
			volume:dec(step)
		end)
	),
})

gears.timer({
	timeout = config.topbar.volume.refresh,
	call_now = true,
	autostart = true,
	callback = function()
		volume:update_graphic()
	end,
})

return volume
