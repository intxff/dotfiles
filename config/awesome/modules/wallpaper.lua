local awful = require("awful")
local timer = require("gears.timer")
local wibox = require("wibox")

-- scan directory, and optionally filter outputs
local function scandir(directory, filter)
	local i, t, popen = 0, {}, io.popen
	if not filter then
		filter = function(s)
			return true
		end
	end
	for filename in popen('ls -a "' .. directory .. '"'):lines() do
		if filter(filename) then
			i = i + 1
			t[i] = filename
		end
	end
	return t
end

local function set_wallpaper(config)
	local mode = config.mode
	if mode == "dir" then
		local index = 1
		local dir = config.dir
		local timeout = 10
		local filter = function(s)
			return string.match(s, "%.png$") or string.match(s, "%.jpg$")
		end
		local files = scandir(dir, filter)

		local wp_timer = timer({ timeout = timeout })
		wp_timer:connect_signal("timeout", function()
			-- set wallpaper to current index for all screens
			for s = 1, screen.count() do
				awful.wallpaper({
					screen = s,
					widget = {
						horizontal_fit_policy = "fit",
						vertical_fit_policy = "fit",
						image = dir .. files[index],
						widget = wibox.widget.imagebox,
					},
				})
			end

			-- stop the timer (we don't need multiple instances running at the same time)
			wp_timer:stop()

			-- get next random index
			index = math.random(1, #files)

			--restart the timer
			wp_timer.timeout = timeout
			wp_timer:start()
		end)

		-- initial start when rc.lua is first run
		wp_timer:start()
	end

	if mode == "file" then
		local file = config.file
		for s in screen do
			awful.wallpaper({
				screen = s,
				widget = {
					horizontal_fit_policy = "fit",
					vertical_fit_policy = "fit",
					image = file,
					widget = wibox.widget.imagebox,
				},
			})
		end
	end
end

return set_wallpaper
