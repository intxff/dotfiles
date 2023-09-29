local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local theme = require("themes")
local powermenu = require("modules.powermenu")

local function item(w, margins_out, margins_inner, bg, fg)
  local newshape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 7)
  end
  local m = wibox.widget {
    widget = wibox.container.margin,
    left = margins_out.left,
    right = margins_out.right,
    top = margins_out.top,
    bottom = margins_out.bottom,
    {
      {
        w,
        widget = wibox.container.margin,
        left = margins_inner.left,
        right = margins_inner.right,
        top = margins_inner.top,
        bottom = margins_inner.bottom,
      },
      shape = newshape,
      bg = bg,
      fg = fg,
      widget = wibox.container.background,
    },
  }
  return m
end

local topbar = function(s)
  local margins_out = { left = 5, top = 3, right = 5, bottom = 3 }
  local margins_inner = { left = 7, top = 0, right = 7, bottom = 0 }

  return awful.wibar {
    type = "dock",
    visible = true,
    bg = theme.topbar.bg,
    height = theme.topbar.height,
    width = s.geometry.width,
    screen = s,
    widget = {
      layout = wibox.layout.align.horizontal,
      expand = false,
      {
        layout          = wibox.layout.grid,
        forced_num_cols = 10,
        forced_num_rows = 1,
        homogeneous     = false,
        expand          = false,
        item(require("modules.taglist")(s), margins_out, margins_inner, theme.taglist.bg, theme.taglist.fg),
      },
      {
        visible = false,
        widget = wibox.widget.separator,
      },
      {
        layout          = wibox.layout.grid,
        forced_num_cols = 10,
        forced_num_rows = 1,
        homogeneous     = false,
        expand          = false,
        item(require("modules.tray"), margins_out, margins_inner, theme.tray.bg, theme.tray.fg),
        item(require("modules.brightness"), margins_out, margins_inner, theme.brightness.bg, theme.brightness.fg),
        item(require("modules.volume"), margins_out, margins_inner, theme.volume.bg, theme.volume.fg),
        item(require("modules.battery"), margins_out, margins_inner, theme.battery.bg, theme.battery.fg),
        item(require("modules.mem"), margins_out, margins_inner, theme.mem.bg, theme.mem.fg),
        item(require("modules.cpu"), margins_out, margins_inner, theme.cpu.bg, theme.cpu.fg),
        item(require("modules.datetime"), margins_out, margins_inner, theme.datetime.bg, theme.datetime.fg),
        item(powermenu.applet, margins_out, margins_inner, theme.powermenu.bg, theme.powermenu.fg),
      },
    },
  }
end

return topbar
