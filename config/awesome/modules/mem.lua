local wibox = require("wibox")
local theme = require("themes")
local lain = require("lain")
local markup = lain.util.markup

local entry = wibox.widget({
	{
		markup = markup.font(theme.mem.font_icon, theme.mem.icon),
		widget = wibox.widget.textbox,
	},
	{
		forced_width = 5,
		color = theme.mem.bg,
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

function entry:set_markup(m)
	self.third.widget.markup = m
end

local mem = lain.widget.mem({
	settings = function()
		local text = markup.bold(markup.font(theme.mem.font_text, mem_now.perc .. "%"))
		widget:set_markup(text)
	end,
	widget = entry,
})

return mem
