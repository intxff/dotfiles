local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local theme = require("themes")
local config = require("config")

tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
  })
end)

local taglist = function(s)
  local taglist_buttons = {}
  for _, v in pairs(config.mousemap.taglist_mouse) do
    table.insert(taglist_buttons, awful.button(v.mod, v.button, v.press))
  end
  return awful.widget.taglist {
    screen          = s,
    filter          = awful.widget.taglist.filter.noempty,
    buttons         = taglist_buttons,
    style           = {},
    layout          = {
      layout = wibox.layout.fixed.horizontal
    },
    widget_template = {
      {
        id = "index_role",
        font = theme.taglist_font,
        widget = wibox.widget.textbox,
      },
      widget = wibox.container.background,
      -- Add support for hover colors and an index label
      create_callback = function(self, t, index, tags)
        if t.selected then
          if #(t:clients()) == 0 then
            self.bg = theme.taglist_bg_empty
            self.fg = theme.taglist_fg_empty
          else
            self.bg = theme.taglist_bg_focus
            self.fg = theme.taglist_fg_focus
          end
        else
          local urgent = false
          local all_clients = t:clients()
          for _, v in pairs(all_clients) do
            if v.urgent then
              urgent = true
            end
          end
          if urgent then
            self.bg = theme.taglist_bg_urgent
            self.fg = theme.taglist_fg_urgent
          else
            self.bg = theme.taglist_bg_occupied
            self.fg = theme.taglist_fg_occupied
          end
        end
        self.widget.markup = '<b> ' .. t.name .. ' </b>'
      end,
      update_callback = function(self, t, index, tags) --luacheck: no unused args
        if t.selected then
          if #(t:clients()) == 0 then
            self.bg = theme.taglist_bg_empty
            self.fg = theme.taglist_fg_empty
          else
            self.bg = theme.taglist_bg_focus
            self.fg = theme.taglist_fg_focus
          end
        else
          local urgent = false
          local all_clients = t:clients()
          for _, v in pairs(all_clients) do
            if v.urgent then
              urgent = true
            end
          end
          if urgent then
            self.bg = theme.taglist_bg_urgent
            self.fg = theme.taglist_fg_urgent
          else
            self.bg = theme.taglist_bg_occupied
            self.fg = theme.taglist_fg_occupied
          end
        end
        self.widget.markup = '<b> ' .. t.name .. ' </b>'
      end,
    },
  }
end

return taglist
