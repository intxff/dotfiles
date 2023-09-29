local wibox = require("wibox")
local theme = require("themes")
local lain = require("lain")
local markup = lain.util.markup

local entry = wibox.widget({
	{
		markup = markup.font(theme.cpu.font_icon, theme.cpu.icon),
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
		bottom = theme.cpu.margin_to_align_icon_and_text,
		widget = wibox.container.margin,
	},
	layout = wibox.layout.align.horizontal,
})

function entry:set_markup(m)
	self.third.widget.markup = m
end

local cpu = lain.widget.cpu({
	settings = function()
		local text = markup.bold(markup.font(theme.cpu.font_text, cpu_now.usage .. "%"))
		widget:set_markup(text)
	end,
	widget = entry,
})

return cpu
