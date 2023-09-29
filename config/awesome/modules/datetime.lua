local theme = require("themes")
local wibox = require("wibox")
local markup = require("lain.util.markup")

local datetime = wibox.widget({
	{
		markup = markup.font(theme.datetime.font_icon, theme.datetime.icon),
		widget = wibox.widget.textbox,
	},
	{
		forced_width = 5,
		color = theme.datetime.bg,
		widget = wibox.widget.separator,
	},
	{
		{
			format = theme.datetime.format,
			font = theme.datetime.font_text,
			refresh = 1,
			widget = wibox.widget.textclock,
		},
		bottom = theme.mem.margin_to_align_icon_and_text,
		widget = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal,
})

return datetime
