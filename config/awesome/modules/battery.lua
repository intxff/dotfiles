local math = require("math")
local wibox = require("wibox")
local theme = require("themes")
local config = require("config")
local lain = require("lain")
local markup = lain.util.markup

local entry = wibox.widget({
	{
		widget = wibox.widget.textbox,
	},
	{
		forced_width = 5,
		color = theme.battery.bg,
		widget = wibox.widget.separator,
	},
	{
		{
			widget = wibox.widget.textbox,
		},
		bottom = theme.mem.margin_to_align_icon_and_text,
		widget = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal,
})

function entry:set_icon_markup(m)
	self.first.markup = m
end

function entry:set_text_markup(m)
	self.third.widget.markup = m
end

local bat = lain.widget.bat({
	battery = config.topbar.battery.battery,
	settings = function()
		local icon
		local text
		if bat_now.ac_status == 1 then
			icon = markup.font(theme.battery.font_icon, theme.battery.icon.ac)
		else
			local i = math.floor(tonumber(bat_now.perc) / 10) + 1
			if i == 11 then
				i = 10
			end
			if bat_now.status == "Discharging" then
				icon = markup.font(theme.battery.font_icon, theme.battery.icon.discharging[i])
			else
				icon = markup.font(theme.battery.font_icon, theme.battery.icon.charging[i])
			end
		end
		text = markup.bold(markup.font(theme.battery.font_text, bat_now.perc .. "%"))
		widget:set_icon_markup(icon)
		widget:set_text_markup(text)
	end,
	widget = entry,
})

return bat
