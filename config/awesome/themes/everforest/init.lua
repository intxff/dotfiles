local theme = {}
local topbar_text_font = "sans bold 14"
local topbar_icon_font_size = 17
local topbar_icon_font = "sans " .. topbar_icon_font_size
local margin_to_align_icon_and_text = 2
local item_bg = "#212529"

theme.powermenu = {
	bg = item_bg,
	fg = "#e63946",
	font = "monospace 18",
	menu = {
		font = "monospace 78",
		bg = {
			mask = "#0000003f",
			selected = "#a8dadc",
			unselected = "#6d6875",
		},
	},
}

theme.taglist = {
	bg = item_bg,
	fg = "",
}

theme.datetime = {
	icon = "󱑃",
	format = "%-m月%-d日 %H:%M:%S",
	font_icon = topbar_icon_font,
	font_text = topbar_text_font,
	margin_to_align_icon_and_text = margin_to_align_icon_and_text,
	bg = item_bg,
	fg = "#b9fbc0",
}

theme.cpu = {
	icon = "󰻠",
	font_icon = topbar_icon_font,
	font_text = topbar_text_font,
	margin_to_align_icon_and_text = margin_to_align_icon_and_text,
	bg = item_bg,
	fg = "#98f5e1",
}

theme.mem = {
	icon = "󰆼",
	font_icon = topbar_icon_font,
	font_text = topbar_text_font,
	margin_to_align_icon_and_text = margin_to_align_icon_and_text,
	bg = item_bg,
	fg = "#8eecf5",
}

theme.battery = {
	icon = {
		charging = {
			"󰢜",
			"󰂆",
			"󰂇",
			"󰂈",
			"󰢝",
			"󰂉",
			"󰢞",
			"󰂊",
			"󰂋",
			"󰂄",
		},
		ac = "󱘖",
		discharging = {
			"󰁺",
			"󰁻",
			"󰁼",
			"󰁽",
			"󰁾",
			"󰁿",
			"󰂀",
			"󰂁",
			"󰂂",
			"󰁹",
		},
	},
	font_icon = "sans " .. topbar_icon_font_size - 5,
	font_text = topbar_text_font,
	margin_to_align_icon_and_text = margin_to_align_icon_and_text,
	bg = item_bg,
	fg = "#a3c4f3",
}

theme.volume = {
	icon = {
		normal = "󰕾",
		muted = "󰖁",
	},
	font_icon = topbar_icon_font,
	font_text = topbar_text_font,
	margin_to_align_icon_and_text = margin_to_align_icon_and_text,
	bg = item_bg,
	fg = "#cfbaf0ff",
}

theme.brightness = {
	icon = "󰖨",
	font_icon = topbar_icon_font,
	font_text = topbar_text_font,
	margin_to_align_icon_and_text = margin_to_align_icon_and_text,
	bg = item_bg,
	fg = "#f1c0e8",
}

theme.topbar = {
	bg = "#343a40cc",
	height = 30,
}

theme.tray = {
	bg = item_bg,
	fg = "#fff",
}

-- beautiful theme properties
theme.bg_normal = "#000"
theme.fg_normal = "#fff"
theme.bg_systray = item_bg
theme.useless_gap = 5
theme.gap_single_client = true
-- client border
theme.border_width = 3
theme.border_focus = "#7fbbb3aa"
theme.border_normal = "#47525899"
-- taglist
-- theme.taglist_fg_focus = "#1d3557"
-- theme.taglist_bg_focus = "#a8dadc"
theme.taglist_fg_focus = item_bg
theme.taglist_bg_focus = "#b9fbc0"
theme.taglist_fg_urgent = item_bg
theme.taglist_bg_urgent = "#e63946"
theme.taglist_bg_occupied = item_bg
theme.taglist_fg_occupied = "#b9fbc0"
theme.taglist_bg_empty = "#ffba08"
theme.taglist_fg_empty = item_bg
-- theme.taglist_bg_volatile
-- theme.taglist_fg_volatile
-- theme.taglist_squares_sel
-- theme.taglist_squares_unsel
-- theme.taglist_squares_sel_empty
-- theme.taglist_squares_unsel_empty
-- theme.taglist_squares_resize
theme.taglist_font = "sans bold 12"
-- theme.taglist_spacing
-- theme.taglist_shape
-- theme.taglist_shape_border_width
-- theme.taglist_shape_border_color
-- theme.taglist_shape_empty
-- theme.taglist_shape_border_width_empty
-- theme.taglist_shape_border_color_empty
-- theme.taglist_shape_focus = gears.shape.circle
-- theme.taglist_shape_border_width_focus = 2
-- theme.taglist_shape_border_color_focus
-- theme.taglist_shape_urgent
-- theme.taglist_shape_border_width_urgent
-- theme.taglist_shape_border_color_urgent
-- theme.taglist_shape_volatile
-- theme.taglist_shape_border_width_volatile
-- theme.taglist_shape_border_color_volatile

return theme
